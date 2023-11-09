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

display_set_gui_maximize();

if(global.canusemenu==true){
	if pressed("menu") and !instance_exists(obj_cmenu) and !instance_exists(obj_cmenu_mini) and global.aspect_ratio == "16:9"
	{instance_create(0,0,obj_cmenu); input.target="cmenu"}
	if pressed("menu") and !instance_exists(obj_cmenu) and !instance_exists(obj_cmenu_mini) and global.aspect_ratio == "4:3"
	{instance_create(0,0,obj_cmenu_mini); input.target="cmenu"}
} 

//if global.camasp == 1 { obj_borderhandler._enabled = false; } else {obj_borderhandler._enabled = true; } 