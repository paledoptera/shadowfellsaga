if global.gp_supported
{
	if(global.gp_index && global.gp_device != -1){
		global.gp_index = gamepad_is_connected(global.gp_device);	
	}
	switch ds_map_find_value(async_load, "event_type")
	{
		case "gamepad discovered":
			if(!global.gp_device){
					var _gp_index = ds_map_find_value(async_load, "pad_index")
					global.gp_index=true;
					global.gp_device=_gp_index;
					input_gp_set_button_threshold(_gp_index,global.gp_button_threshold)
			}
			break;
		case "gamepad lost":
			if(global.gp_device==ds_map_find_value(async_load,"pad_index")){
				global.gp_index=false;
				global.gp_device=-1;
			}
			
	}
	
}