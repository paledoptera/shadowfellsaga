global.chapter=0;
global.activeLandmark=-1;

_game_res_scale = 0.72;
_game_res_precision = 1.0;

ticks=0;
minutes=0;
seconds=0;
drawnseconds=0;
drawmninutes=0;
hideScreen=false

invSlot=0;
itemID=0;

borderEnabled=false;
//border_setEnabled(borderEnabled);

garbageTimer=0;

game_init();

function defaultDrawScreen()
{
	draw_surface_ext(application_surface,screenXOffset,screnYOffset,screenXScale,screenYScale,0,c_white,1)	
	return;
}

function changeWindowResolution(_index)
{
	///@arg resolution_index
	global.resolution_current = global.resolutions[_index];
}

function check_world_type(){
	if(asset_has_tags(room, "dark_world", asset_room)){
		flag_set(global.flags,"world",1);
	} else if(asset_has_tags(room, "light_world", asset_room)){
		flag_set(global.flags,"world",0);
	}
}
