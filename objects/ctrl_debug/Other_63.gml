var _id = ds_map_find_value(async_load,"id")
var _res = ds_map_find_value(async_load, "result")
switch _async_type 
{
	case "rm_index":
		if _id == _async_msg
		{
			if ds_map_find_value(async_load,"status")	
			{
				if ds_map_find_value(async_load, "result") != ""
				{
					room_goto(asset_get_index(ds_map_find_value(async_load, "result")));
				}
			}
		}
	break;
	case "flagp_clr":
		if _id == _async_msg
		{
			if ds_map_find_value(async_load,"status")
			{
				if ds_map_find_value(async_load,"result") != ""
				{
					if !flag_exists(global.pflags,_res) { 
						show_message_async("Flag " +_res +" is invalid!")
					} else if flag_exists(global.pflags,_res) {
						flag_set(global.pflags,_res,false)
						show_message_async("Flag " +_res +" cleared successfully!")	
					}
					break;
				}
			}
		}
	break;
	case "flag_clr":
		if _id == _async_msg
		{
			if ds_map_find_value(async_load,"status")
			{
				if ds_map_find_value(async_load,"result") != ""
				{
					if !flag_exists(global.pflags,_res) { 
						show_message_async("Flag " +_res +" is invalid!")
					} else if flag_exists(global.pflags,_res) {
						show_message_async("Flag " +_res +" cleared successfully!")	
						flag_set(global.pflags,_res,true)
					}
					break;
				}
			}
		}
	break;
	case "flagp_enable":
		if _id == _async_msg
		{
			if ds_map_find_value(async_load,"status")
			{
				if ds_map_find_value(async_load,"result") != ""
				{
					if !flag_exists(global.pflags,_res) { 
						show_message_async("Flag " +_res +" is invalid!")
					} else if flag_exists(global.pflags,_res) {
						show_message_async("Flag " +_res +" enabled successfully!")	
						flag_set(global.pflags,_res,true)
					}
					break;
				}
			}
		}
	case "flag_enable":
		if _id == _async_msg
		{
			if ds_map_find_value(async_load,"status")
			{
				if ds_map_find_value(async_load,"result") != ""
				{
					if !flag_exists(global.flags,_res) { 
						show_message_async("Flag " +_res +" is invalid!")
					} else if flag_exists(global.flags,_res) {
						show_message_async("Flag " +_res +" enabled successfully!")	
						flag_set(global.flags,_res,true)
					}
					break;
				}
			}
		}
	break;
	case "flag_evry":
		if _id == _async_msg
		{
			if ds_map_find_value(async_load,"status")
			{
				if ds_map_find_value(async_load,"result") == "Reset"
				{
					for (var key=ds_map_find_first(global.flags);
					key != undefined; key = ds_map_find_next(global.flags,key))
					{
						flag_set(global.flags,key,false)	
					}
					for (var keyp=ds_map_find_first(global.pflags);
					keyp != undefined; keyp = ds_map_find_next(global.pflags,key))
					{
						flag_set(global.pflags,keyp,false)	
					}
				}
			}
		}
	break;
}
