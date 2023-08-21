ticks += 1
minutes = floor(((ticks / room_speed) / 60))
seconds = (floor((ticks / room_speed)) - (minutes * 60))
// WASD input test
//input_key_rebind(global.key_up,ord("W"))
//input_key_rebind(global.key_left,ord("A"))
//input_key_rebind(global.key_down,ord("S"))
//input_key_rebind(global.key_right,ord("D"))

if(instance_exists(FOLLOWER)){
	party_add_follower(1); // 	Add sans to the party array given obj_ow_p_follower exists and is active
}

//if (input_key_pressed(global.key_fscrn))
//	window_set_fullscreen(!window_get_fullscreen());
display_set_gui_maximize();

if(global.canusemenu==true){
	if input_key_pressed(global.key_menu) || input_gp_button_pressed(global.gp_menu) 
	{instance_create(0,0,obj_cmenu); if(instance_exists(obj_cmenu)) {active=true} }
} 

show_debug_message(string(global.selecteditem));