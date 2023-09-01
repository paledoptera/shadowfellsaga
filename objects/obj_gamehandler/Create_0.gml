global.chapter=0;
global.activeLandmark=-1;
ticks=0;
minutes=0;
seconds=0;
drawnseconds=0;
drawmninutes=0;
hideScreen=false

invSlot=0;
itemID=0;

borderEnabled=true;
garbageTimer=0;

game_init();

border_setEnabled(borderEnabled);

function defaultDrawScreen()
{
	draw_surface_ext(application_surface,screenXOffset,screnYOffset,screenXScale,screenYScale,0,c_white,1)	
	return;
}

function check_world_type(){
	if(asset_has_tags(room, "dark_world", asset_room)){
		flag_set(global.flags,"world",1);
	} else if(asset_has_tags(room, "light_world", asset_room)){
		flag_set(global.flags,"world",0);
	}
}
