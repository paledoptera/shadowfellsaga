global.chapter=0;

ticks=0;
minutes=0;
seconds=0;
drawnseconds=0;
drawmninutes=0;
hideScreen=false

invSlot=0;
itemID=0;

borderEnabled=false;
garbageTimer=0;

game_init();

function check_world_type(){
	if(asset_has_tags(room, "dark_world", asset_room)){
		flag_set(global.flags,"world",1);
	} else if(asset_has_tags(room, "light_world", asset_room)){
		flag_set(global.flags,"world",0);
	}
}
