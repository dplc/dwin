//contributed by Simen Haugen

/** behavior:grid, browser of tabular data (records).
 *  Supports multiple selection mode. Use "multiple" attribute.
 *
 *   model is like this:
 *   <table fixedrows=1 ... style="behavior:grid"> 
 *     <tr>...
 *     <tr>...
 *   </table> 
 *
 *  LOGICAL EVENTS: 
 *    TABLE_HEADER_CLICK, click on some cell in table header, target is the cell
 *    TABLE_ROW_CLICK,    click on data row in the table, target is the row
 *
 *  See: html_samples/grid/scrollable-table.htm
 *  Authors: Andrew Fedoniouk, initial implementation.
 *           Andrey Kubyshev, multiselection mode.
 *           Simen Endsjo, D port.
 *
 **/
module htmlayout.behaviors.ti.grid;

import htmlayout.events;
import htmlayout.capi;
import htmlayout.element;

import tango.math.Math;
import tango.text.Text;


static this()
{
	new HBehaviorGrid;
	new HBehaviorSortableGrid;
}

class HBehaviorGrid : HBehavior
{
	this(char[] name,uint events=DISABLE_INITIALIZATION)
	{
		super( name, events );
	}

	this()
	{
		super( "grid", HANDLE_MOUSE | HANDLE_KEY | HANDLE_FOCUS );
	}

	bool fixedRows(HElement table)
	{
		return table.attribute("fixedrows") == "1";
	}

	bool isMultiple(HElement table)
	{
		return table.attribute("multiple") == "1";
	}

	void setCurrentRow(HElement table, HElement row,
			uint keyboardStates, bool dblClick=false, bool smooth=false)
	{
		if( isMultiple(table) )
		{
			if( keyboardStates & SHIFT_KEY_PRESSED )
			{
				checkAll(table, false);
				checkRange(table, row.index, true);
			}
			else
			{
				if( keyboardStates & CONTROL_KEY_PRESSED )
					setCheckedRow(table, row, true);
				else
					checkAll(table, false);
				setAnchor(table, row.index);
			}
		}

		auto prev = getCurrentRow(table);
		if( prev && prev != row)
			prev.state(0, STATE_CURRENT, false);
		row.state(STATE_CURRENT, 0, false);
		row.scrollToView(smooth);
		table.postEvent(dblClick ? TABLE_ROW_DBL_CLICK : TABLE_ROW_CLICK,
						row, row.index);
	}	

	void checkRange(HElement table, int idx, bool check)
	{
		if( !isMultiple(table) ) return;

		int startidx = getAnchor(table);
		int start = min(startidx, idx);
		int end = max(startidx, idx);

		int frows = fixedRows(table);
		if( start < frows ) start = frows;

		for( ;end >= start; --end)
		{
			auto row = table.child(end);
			if( row.visible )
			{
				if( check ) row.state(STATE_CHECKED, 0, false);
				else row.state(0, STATE_CHECKED, false);
			}
		}
	}

	int getAnchor(HElement table)
	{
		auto rows = table.select("tr:anchor");
		if( rows.length )
			return rows[0].index;
		return 0;
	}

	void setAnchor(HElement table, int idx)
	{
		auto rows = table.select("tr:anchor");
		if( rows.length )
			rows[0].state(0, STATE_ANCHOR, false);
		auto row = table.child(idx);
		row.state(STATE_ANCHOR | STATE_CHECKED, 0, false);
	}

	HElement getCurrentRow(HElement table)
	{
		for( int i=0; i < table.children; i++ )
		{
			auto c = table.child(i);
			if( c.current ) return c;
		}
		return null;
	}

	void setCheckedRow(HElement table, HElement row, bool toggle=false)
	{
		if( toggle ) row.checked = !row.checked;
		else row.checked = true;
	}

	/// onoff = true -> check all rows
	/// onoff = false -> uncheck all rows
	void checkAll(HElement table, bool onoff)
	{
		if( !isMultiple(table) ) return;

		if( onoff )
			foreach( tr; table.select("tr") )
				tr.checked = true;
		else
			foreach( tr; table.select("tr:checked") )
				tr.checked = false;
	}

	bool onMouse(HMouse evt)
	{
		if( evt.cmd != MOUSE_DOWN && evt.cmd != MOUSE_DCLICK )
			return false;
		if( evt.button_state != MAIN_MOUSE_BUTTON )
			return false;


		auto table = evt.element;
		auto target = new HElement(evt.target);

		if( target == table ) // Clicked the table itself.
			return false;

		auto row = targetRow(table, target);
		if( row.index < fixedRows(table) ) // Header row clicked
		{
			auto headerCell = targetHeader(row, target);
			onColumnClick(table, headerCell);
			return true;
		}
		setCurrentRow(table, row, evt.event.alt_state,
				evt.cmd == MOUSE_DCLICK);
		return true;
	}

	bool onKey(HKey evt)
	{
		return false;
	}

	void onColumnClick(HElement table, HElement headerCell)
	{
		table.postEvent(TABLE_HEADER_CLICK, headerCell, headerCell.index);
	}

	HElement targetRow(HElement table, HElement target)
	{
		if( target.parent == table )
			return target;
		return targetRow(table, target.parent);
	}

	HElement targetHeader(HElement headerRow, HElement target)
	{
		if( target.parent == headerRow )
			return target;
		return targetHeader(headerRow, target.parent);
	}
}


class HBehaviorSortableGrid : HBehaviorGrid
{
	this()
	{
		super( "sortable-grid", HANDLE_MOUSE | HANDLE_KEY | HANDLE_FOCUS );
	}

	void onColumnClick(HElement table, HElement headerCell)
	{
		super.onColumnClick( table, headerCell );
		auto allchecked = table.select("th:checked");

		// Remove previously selected
		// and select the current clicked header
		if( allchecked.length )
		{
			auto current = allchecked[0];
			if( current == headerCell ) return; // Already sorted
			current.checked = false;
		}
		headerCell.checked = true;

		auto row = getCurrentRow(table);
		table.sort(1u, cast(uint)table.children, &emCmp,
				cast(void*)headerCell.index);
		if( row ) row.scrollToView();
		table.update();
	}
}

extern(Windows)
{
	/// Compare two 
	int emCmp(void* h1, void* h2, void* params)
	{
		auto colidx = cast(int)params;
		auto em1 = (new HElement(h1)).child(colidx);
		auto em2 = (new HElement(h2)).child(colidx);
		scope em1str = new Text!(char)(em1.value.toString);
		scope em2str = new Text!(char)(em2.value.toString);
		if( !em1str.length || !em2str.length ) return 0;
		return em1str.opCmp(em2str);
	}
}

version (build) {
    debug {
        pragma(link, "debug-htmlayout");
    } else {
        pragma(link, "htmlayout");
    }
}
