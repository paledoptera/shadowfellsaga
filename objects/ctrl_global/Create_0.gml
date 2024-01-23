global.activeLandmark=-1;

ticks=0;
seconds=0;

hideScreen=false
target_door = -1;

game_init();

function check_world_type()
{
	if(asset_has_tags(room, "dark_world", asset_room))
	{
		flag_set(global.flags,"world",1);
	} 
	
	else if(asset_has_tags(room, "light_world", asset_room))
	{
		flag_set(global.flags,"world",0);
	}
}
