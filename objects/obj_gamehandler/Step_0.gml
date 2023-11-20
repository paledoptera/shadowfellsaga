ticks += 1
minutes = floor(((ticks / room_speed) / 60))
seconds = (floor((ticks / room_speed)) - (minutes * 60))

if(instance_exists(FOLLOWER)){
	party_add_follower(1); // 	Add sans to the party array given obj_ow_p_follower exists and is active
}

display_set_gui_maximize();

if(global.canusemenu==true){
	/*if input.menu and !instance_exists(obj_cmenu) and !instance_exists(obj_cmenu_mini) and global.aspect_ratio == "16:9"
	{instance_create(0,0,obj_cmenu); input.target="cmenu"}
	if input.menu and !instance_exists(obj_cmenu) and !instance_exists(obj_cmenu_mini) and global.aspect_ratio == "4:3"
	{instance_create(0,0,obj_cmenu_mini); input.target="cmenu"}*/
	if input.menu and !instance_exists(obj_cmenu) {instance_create(0,0,obj_cmenu); input.target="cmenu"}
	
} 

//if global.camasp == 1 { obj_borderhandler._enabled = false; } else {obj_borderhandler._enabled = true; } 