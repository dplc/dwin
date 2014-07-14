//contributed by Simen Haugen

/*
BEHAVIOR: gripper
    
  starts draging of its parent upon receving of MOUSE_DOWN event

TYPICAL USE CASE:
   < div .toolbar >
     <div style="behavior:gripper; width:8px; height:*;" />
     <widget .button>...</widget>
     <widget .button>...</widget>
     <widget .button>...</widget>
   </div>
*/
module htmlayout.behaviors.ti.gripper;

import htmlayout.events;
import htmlayout.capi;
import htmlayout.element;

static this()
{
	new HBehaviorGripper;
}

class HBehaviorGripper : HBehavior
{
	this()
	{
		super( "gripper", HANDLE_MOUSE );
	}

	bool onMouse(HMouse evt)
	{
		if( evt.cmd == MOUSE_DOWN && evt.button_state == 1 )
		{
			evt.event.dragging = evt.element.parent.handle;
			evt.event.dragging_mode = DRAGGING_MOVE;
			return true;
		}
		return false;
	}
}
