module htmlayout.behaviors.test;

import htmlayout.events;
import htmlayout.capi;
import htmlayout.element;
import tango.io.Stdout;

static this()
{
	new HTestBehavior;
}

class HTestBehavior : HBehavior
{
	this(){super("test",HANDLE_MOUSE);}

	bool onMouse(HMouse params) {tango.io.Stdout.Stdout("handling mouse\n");return false;}
}