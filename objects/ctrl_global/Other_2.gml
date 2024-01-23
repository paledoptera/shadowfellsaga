var _WIDTH = global.resolution_current.w
var _HEIGHT = global.resolution_current.h

if(global.borderenabled) {display_set_gui_size(640,480);}
window_set_size(_WIDTH,_HEIGHT);
display_set_gui_maximize();
window_center();

room_goto_next();
//input_player_import()

/*if(!global.borderEnabled)
{
	texture_flush("BORDERS");
}*/