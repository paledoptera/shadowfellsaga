ticks += 1
minutes = floor(((ticks / room_speed) / 60))
seconds = (floor((ticks / room_speed)) - (minutes * 60))

if(instance_exists(FOLLOWER)){
	party_add_follower(1); // 	Add sans to the party array given obj_ow_p_follower exists and is active
}

display_set_gui_maximize();



//if global.camasp == 1 { obj_borderhandler._enabled = false; } else {obj_borderhandler._enabled = true; } 