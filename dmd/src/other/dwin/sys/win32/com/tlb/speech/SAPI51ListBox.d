// Speech enabled ListBox ActiveX control
// Version 1.0

//mixin(uuid("47928922-4acf-42dc-bfd1-13e3f105fb45"));
module dwin.sys.win32.com.tlb.speech.SAPI51ListBox;

/*[importlib("stdole2.tlb")]*/
/*[importlib("3")]*/
/*[importlib("msdatsrc.tlb")]*/
private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.tlb.stdole2; //for OLE_COLOR
private import dwin.sys.win32.com.tlb.more.msdatasrc; //for DataSource

// Interfaces

interface _Sample : IDispatch {
  mixin(uuid("89cd4715-bb65-4c96-af01-6c975c65eeb4"));
  //static DWINGUID IID = { 0x89cd4715, 0xbb65, 0x4c96, 0xaf, 0x01, 0x6c, 0x97, 0x5c, 0x65, 0xee, 0xb4 };
  // Adds an item to a ListBox or ComboBox control or a row to a Grid control.
  /*[id(0x6003002B)]*/ int AddItem(wchar* Item, DWINVARIANT index);
  // Returns/sets whether or not an object is painted at run time with 3-D effects.
  /*[id(0xFFFFFDF8)]*/ int get_Appearance(out short value);
  // Returns/sets whether or not an object is painted at run time with 3-D effects.
  /*[id(0xFFFFFDF8)]*/ int set_Appearance(short value);
  // Returns/sets the background color used to display text and graphics in an object.
  /*[id(0x68030022)]*/ int get_BackColor(out OLE_COLOR value);
  // Returns/sets the background color used to display text and graphics in an object.
  /*[id(0x68030022)]*/ int set_BackColor(OLE_COLOR value);
  // Returns/sets whether validation occurs on the control which lost focus.
  /*[id(0x68030021)]*/ int get_CausesValidation(out short value);
  // Returns/sets whether validation occurs on the control which lost focus.
  /*[id(0x68030021)]*/ int set_CausesValidation(short value);
  // Clears the contents of a control or the system Clipboard.
  /*[id(0x6003002C)]*/ int Clear();
  // Returns/sets a value that determines whether a ListBox scrolls vertically in a single column (value of 0) or horizontally in snaking columns (values greater than 0).
  /*[id(0x68030020)]*/ int get_Columns(out short value);
  // Returns/sets a value that determines whether a ListBox scrolls vertically in a single column (value of 0) or horizontally in snaking columns (values greater than 0).
  /*[id(0x68030020)]*/ int set_Columns(short value);
  // Returns/sets a value that describes the DataMember for a data connection.
  /*[id(0x6803001F)]*/ int get_DataMember(out wchar* value);
  // Returns/sets a value that describes the DataMember for a data connection.
  /*[id(0x6803001F)]*/ int set_DataMember(wchar* value);
  // Sets a value that specifies the Data control through which the current control is bound to a database. 
  /*[id(0x6803001E)]*/ int get_DataSource(out DataSource value);
  // Sets a value that specifies the Data control through which the current control is bound to a database. 
  /*[id(0x6803001E)]*/ int setref_DataSource(DataSource value);
  // Returns/sets a value that determines whether an object can respond to user-generated events.
  /*[id(0x6803001D)]*/ int get_Enabled(out short value);
  // Returns/sets a value that determines whether an object can respond to user-generated events.
  /*[id(0x6803001D)]*/ int set_Enabled(short value);
  // Returns/sets underline font styles.
  /*[id(0x6803001C)]*/ int get_FontUnderline(out short value);
  // Returns/sets underline font styles.
  /*[id(0x6803001C)]*/ int set_FontUnderline(short value);
  // Returns/sets strikethrough font styles.
  /*[id(0x6803001B)]*/ int get_FontStrikethru(out short value);
  // Returns/sets strikethrough font styles.
  /*[id(0x6803001B)]*/ int set_FontStrikethru(short value);
  // Specifies the size (in points) of the font that appears in each row for the given level.
  /*[id(0x6803001A)]*/ int get_FontSize(out float value);
  // Specifies the size (in points) of the font that appears in each row for the given level.
  /*[id(0x6803001A)]*/ int set_FontSize(float value);
  // Specifies the name of the font that appears in each row for the given level.
  /*[id(0x68030019)]*/ int get_FontName(out wchar* value);
  // Specifies the name of the font that appears in each row for the given level.
  /*[id(0x68030019)]*/ int set_FontName(wchar* value);
  // Returns/sets italic font styles.
  /*[id(0x68030018)]*/ int get_FontItalic(out short value);
  // Returns/sets italic font styles.
  /*[id(0x68030018)]*/ int set_FontItalic(short value);
  // Returns/sets bold font styles.
  /*[id(0x68030017)]*/ int get_FontBold(out short value);
  // Returns/sets bold font styles.
  /*[id(0x68030017)]*/ int set_FontBold(short value);
  // Returns a Font object.
  /*[id(0xFFFFFE00)]*/ int get_Font(out Font value);
  // Returns a Font object.
  /*[id(0xFFFFFE00)]*/ int setref_Font(Font value);
  // Returns/sets the foreground color used to display text and graphics in an object.
  /*[id(0x68030016)]*/ int get_ForeColor(out OLE_COLOR value);
  // Returns/sets the foreground color used to display text and graphics in an object.
  /*[id(0x68030016)]*/ int set_ForeColor(OLE_COLOR value);
  // Returns a handle (from Microsoft Windows) to an object's window.
  /*[id(0x68030015)]*/ int get_hWnd(out int value);
  // Returns/Sets a value indicating whether the control displays partial items.
  /*[id(0x68030014)]*/ int get_IntegralHeight(out short value);
  // Returns/sets a specific number for each item in a ComboBox or ListBox control.
  /*[id(0x68030013)]*/ int get_ItemData(short index, out int value);
  // Returns/sets a specific number for each item in a ComboBox or ListBox control.
  /*[id(0x68030013)]*/ int set_ItemData(short index, int value);
  // Returns/sets the index of the currently selected item in the control.
  /*[id(0x68030012)]*/ int get_ListIndex(out short value);
  // Returns/sets the index of the currently selected item in the control.
  /*[id(0x68030012)]*/ int set_ListIndex(short value);
  // Returns the number of items in the list portion of a control.
  /*[id(0x68030011)]*/ int get_ListCount(out short value);
  // Returns/sets the items contained in a control's list portion.
  /*[id(0x00000000)]*/ int get_List(short index, out wchar* value);
  // Returns/sets the items contained in a control's list portion.
  /*[id(0x00000000)]*/ int set_List(short index, wchar* value);
  // Returns/sets the type of mouse pointer displayed when over part of an object.
  /*[id(0x68030010)]*/ int get_MousePointer(out short value);
  // Returns/sets the type of mouse pointer displayed when over part of an object.
  /*[id(0x68030010)]*/ int set_MousePointer(short value);
  // Sets a custom mouse icon.
  /*[id(0x6803000F)]*/ int get_MouseIcon(out Picture value);
  // Sets a custom mouse icon.
  /*[id(0x6803000F)]*/ int setref_MouseIcon(Picture value);
  // Returns/sets a value that determines whether a user can make multiple selections in a control.
  /*[id(0x6803000E)]*/ int get_MultiSelect(out short value);
  // Returns the index of the item most recently added to a control.
  /*[id(0x6803000D)]*/ int get_NewIndex(out short value);
  // Returns/Sets whether this object can act as an OLE drop target.
  /*[id(0x6803000C)]*/ int get_OLEDropMode(out short value);
  // Returns/Sets whether this object can act as an OLE drop target.
  /*[id(0x6803000C)]*/ int set_OLEDropMode(short value);
  // Returns/Sets whether this object can act as an OLE drag/drop source, and whether this process is started automatically or under programmatic control.
  /*[id(0x6803000B)]*/ int get_OLEDragMode(out short value);
  // Returns/Sets whether this object can act as an OLE drag/drop source, and whether this process is started automatically or under programmatic control.
  /*[id(0x6803000B)]*/ int set_OLEDragMode(short value);
  // Starts an OLE drag/drop event with the given control as the source.
  /*[id(0x60030033)]*/ int OLEDrag();
  // Removes an item from a ListBox or ComboBox control or a row from a Grid control.
  /*[id(0x60030035)]*/ int RemoveItem(short index);
  // Forces a complete repaint of a object.
  /*[id(0x60030036)]*/ int Refresh();
  // Determines text display direction and control visual appearance on a bidirectional system.
  /*[id(0x6803000A)]*/ int get_RightToLeft(out short value);
  // Determines text display direction and control visual appearance on a bidirectional system.
  /*[id(0x6803000A)]*/ int set_RightToLeft(short value);
  // Returns/sets the selection status of an item in a control.
  /*[id(0x68030009)]*/ int get_Selected(short index, out short value);
  // Returns/sets the selection status of an item in a control.
  /*[id(0x68030009)]*/ int set_Selected(short index, short value);
  // Returns the number of selected items in a ListBox control.
  /*[id(0x68030008)]*/ int get_SelCount(out short value);
  // Returns/sets a value that determines whether checkboxes are displayed inside a ListBox control.
  /*[id(0x68030007)]*/ int get_Style(out short value);
  // Indicates whether the elements of a control are automatically sorted alphabetically.
  /*[id(0x68030006)]*/ int get_Sorted(out short value);
  // Returns/sets the text contained in the control.
  /*[id(0x68030005)]*/ int get_text(out wchar* value);
  // Returns/sets the text contained in the control.
  /*[id(0x68030005)]*/ int set_text(wchar* value);
  // Returns/sets the text displayed when the mouse is paused over the control.
  /*[id(0x68030004)]*/ int get_ToolTipText(out wchar* value);
  // Returns/sets the text displayed when the mouse is paused over the control.
  /*[id(0x68030004)]*/ int set_ToolTipText(wchar* value);
  // Returns/sets which item in a control is displayed in the topmost position.
  /*[id(0x68030003)]*/ int get_TopIndex(out short value);
  // Returns/sets which item in a control is displayed in the topmost position.
  /*[id(0x68030003)]*/ int set_TopIndex(short value);
  // Returns/sets an associated context number for an object.
  /*[id(0x68030002)]*/ int get_WhatsThisHelpID(out int value);
  // Returns/sets an associated context number for an object.
  /*[id(0x68030002)]*/ int set_WhatsThisHelpID(int value);
  // Whether speech recognition is enabled or not.
  /*[id(0x68030001)]*/ int get_SpeechEnabled(out short value);
  // Whether speech recognition is enabled or not.
  /*[id(0x68030001)]*/ int set_SpeechEnabled(short value);
  // This property is used to determine what word or words a user needs to say to get the listbox to recognized individual list items.
  /*[id(0x68030000)]*/ int get_PreCommandString(out wchar* value);
  // This property is used to determine what word or words a user needs to say to get the listbox to recognized individual list items.
  /*[id(0x68030000)]*/ int set_PreCommandString(wchar* value);
}

interface __Sample : IDispatch {
  mixin(uuid("f7d7b2f1-73d2-47ab-8e21-df63a57cd736"));
  //static DWINGUID IID = { 0xf7d7b2f1, 0x73d2, 0x47ab, 0x8e, 0x21, 0xdf, 0x63, 0xa5, 0x7c, 0xd7, 0x36 };
  /+// Occurs when a ListBox control's Style property is set to 1 (checkboxes) and an item's checkbox in the ListBox control is selected or cleared.
  /*[id(0x00000001)]*/ void ItemCheck(ref short Item);+/
  /+// Occurs when an OLE drag/drop operation is initiated either manually or automatically.
  /*[id(0x00000002)]*/ void OLEStartDrag(ref DataObject Data, ref int AllowedEffects);+/
  /+// Occurs at the OLE drag/drop source control when the drop target requests data that was not provided to the DataObject during the OLEDragStart event.
  /*[id(0x00000003)]*/ void OLESetData(ref DataObject Data, ref short DataFormat);+/
  /+// Occurs at the source control of an OLE drag/drop operation when the mouse cursor needs to be changed.
  /*[id(0x00000004)]*/ void OLEGiveFeedback(ref int Effect, ref short DefaultCursors);+/
  /+// Occurs when the mouse is moved over the control during an OLE drag/drop operation, if its OLEDropMode property is set to manual.
  /*[id(0x00000005)]*/ void OLEDragOver(ref DataObject Data, ref int Effect, ref short Button, ref short Shift, ref float X, ref float Y, ref short State);+/
  /+// Occurs when data is dropped onto the control via an OLE drag/drop operation, and OLEDropMode is set to manual.
  /*[id(0x00000006)]*/ void OLEDragDrop(ref DataObject Data, ref int Effect, ref short Button, ref short Shift, ref float X, ref float Y);+/
  /+// Occurs at the OLE drag/drop source control after a manual or automatic drag/drop has been completed or canceled.
  /*[id(0x00000007)]*/ void OLECompleteDrag(ref int Effect);+/
  /+// Occurs when you reposition the scroll box on a control.
  /*[id(0x00000008)]*/ void Scroll();+/
  /+// Occurs when a control loses focus to a control that causes validation.
  /*[id(0x00000009)]*/ void Validate(ref short Cancel);+/
}

// CoClasses

abstract class Sample {
  mixin(uuid("1908375f-0791-4ec3-ad24-93e3a28be3d6"));
  //static DWINGUID CLSID = { 0x1908375f, 0x0791, 0x4ec3, 0xad, 0x24, 0x93, 0xe3, 0xa2, 0x8b, 0xe3, 0xd6 };
  mixin Interfaces!(_Sample);
}
