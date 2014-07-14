//contributed by Simen Haugen

/*

BEHAVIOR: select-buddy
    goal: Auxiliary buttons for various <select multiple> actions.
    actions: "select-all" - select all options
             "clear-all" - deselect all options
    for pair of <select>s:
             "move-all" - move all options from source to destination
             "move-selected" - move selected options from source to destination
             "revoke-all" - move all options from destination to source
             "revoke-selected" - move all options from destination to source
TYPICAL USE CASE:
   <div style="behavior:select-buddy">
      <widget type="select" multiple="checks" role="source"> 
         <option>...
      </widget> 
      <input type="button" action="move-all">move all</input>
      <input type="button" action="move-selected">move selected</button>
      <widget type="select" multiple="checks" role="destination"> 
         <option>...
      </widget> 
   </div>
SAMPLE:
*/
module htmlayout.behaviors.ti.select_buddy;

import htmlayout.events;
import htmlayout.capi;
import htmlayout.element;

import Integer = tango.text.convert.Integer;

/// Selects all options in multiselect
void selectAllOptions(HElement el)
{
	foreach( sel; el.select("option") )
		sel.state(STATE_CHECKED, 0, false);
	el.update();
}

/// Clear checked states in multiselect <select>.
/// This simply resets :checked state for all checked <option>'s
void clearAllOptions(HElement el)
{
	foreach( sel; el.select("option:checked,[role='option']:checked") )
		sel.state(0, STATE_CHECKED, false);
	el.update();	
}


static this()
{
	new HBehaviorSelectBuddy;
}


class HBehaviorSelectBuddy : HBehavior
{
	this()
	{
		super( "select-buddy", HANDLE_BEHAVIOR_EVENT );
	}

	bool onBehaviorEvent(HBehaviorEvent evt)
	{
		if( evt.cmd == BUTTON_CLICK )
		{
			scope target = new HElement(evt.heTarget);
			auto action = target.attribute("action");
			switch( action )
			{
			case "select-all":
				return doSelectAll(evt.element);
			case "clear-all":
				return doClearAll(evt.element);
			case "move-all":
				return doMove(evt.element, true, false);
			case "move-selected":
				return doMove(evt.element, true, true);
			case "revoke-all":
				return doMove(evt.element, false, false);
			case "revoke-selected":
				return doMove(evt.element, false, true);
			default:
				return false;
			}
		}
		return false;
	}

	bool doSelectAll(HElement el)
	{
		selectAllOptions(el);
		return true;
	}

	bool doClearAll(HElement el)
	{
		clearAllOptions(el);
		return true;
	}

	bool doMove(HElement el, bool srcToDst, bool selectedOnly)
	{
		// Make sure we have exactly one source and destination
		auto sources = el.select("[role='source']");
		assert( sources.length == 1 );
		auto src = sources[0];

		auto dests = el.select("[role='destination']");
		assert( dests.length == 1 );
		auto dst = dests[0];

		// Move back to source
		if( !srcToDst )
		{
			auto tmp = src;
			src = dst;
			dst = tmp;
		}

		auto options = src.select(
				selectedOnly?"option:checked":"option");

		if( srcToDst )
		{
			foreach_reverse( sel; options )
			{
				sel.attribute("-srcindex", Integer.toString(sel.index));
				sel.insert(dst, 0);
			}
		}
		else
		{
			foreach( sel; options )
			{
				auto idx = Integer.toInt(sel.attribute("-srcindex"));
				sel.insert(dst, idx);
			}
		}
		src.update();
		dst.update();
		return true;
	}
}
