//INPUT
if active = true
{
	if(!gamepad_is_connected(global.gp_device)){
	key_left				= input_key_held(global.key_left);
	key_right			 =input_key_held(global.key_right);
	key_up				= input_key_held(global.key_up);
	key_down			= input_key_held(global.key_down);
	key_interact		= input_key_pressed(global.key_action);
	key_cancel		=input_key_pressed(global.key_cancel);
	key_run				= input_key_held(global.key_run);
	
	x_axis=key_right-key_left;
	y_axis=key_down-key_up;
	
	} else if(gamepad_is_connected(global.gp_device)) {
		key_left				= input_gp_button_held(global.gp_device,global.gp_left) 
		key_right			= input_gp_button_held(global.gp_device,global.gp_right) 
		key_up				= input_gp_button_held(global.gp_device,global.gp_up) 
		key_down			= input_gp_button_held(global.gp_device,global.gp_down) 
		key_interact		= input_gp_button_pressed(global.gp_device,global.gp_action);
		key_cancel			=input_gp_button_pressed(global.gp_device,global.gp_cancel);
		key_run				= input_gp_button_held(global.gp_device,global.gp_run);
		x_axis=key_right-key_left;
		y_axis=key_down-key_up;
	}
	
	inputdirection = point_direction(0,0,x_axis, y_axis);
	inputmagnitude = (x_axis != 0) || (y_axis != 0);
	
	//SPEED
	var mvspeed = movespeed
	if key_run {image_speed = 1.6; mvspeed = movespeed*1.5} else {image_speed = 1;}

	hsp = lengthdir_x(inputmagnitude * mvspeed, inputdirection);
	vsp = lengthdir_y(inputmagnitude * mvspeed, inputdirection);

//INTERACTIONS
if key_interact {instance_create(x,y,obj_interact);}


if active = true move_and_collide(hsp,vsp,obj_wall,mvspeed);

//----------UNUSED JUMP CODE--------------
//Z MOVEMENT
//if zsp != 0 {image_speed = imgspd*2} else {image_speed = imgspd;}
//if zsp != 0 and key_run {image_speed = imgspd*1.5}
//if zsp < 20 {zsp += grav;}
//if z+zsp > floorZ {zsp = 0; z = floorZ;}  
//z += zsp;

//PLAYER FOLLOWERS
if (x!= xprevious or y!= yprevious)
{
	for(i = 50; i > 0; i--)
	{
		pos_x[i] = pos_x[i-1];
		pos_y[i] = pos_y[i-1];
		pos_run[i] = pos_run[i-1];
	}
	pos_x[0] = x;
	pos_y[0] = y;
	pos_run[0] = key_run;
}

}
else
{
if cutscene_paused = false
	{
	cutscene_paused = true
	var mvspeed = 0;
	hsp = 0;
	vsp = 0;
	inputmagnitude = 0
	}
}

//ANIMATION
if animated = true
{
	var _old_sprite = sprite_index;
	if (inputmagnitude != 0)
	{
		direction = inputdirection;
		sprite_index = sprite_run;
	}
	else {sprite_index = sprite_idle;}
	if (_old_sprite != sprite_index) local_frame = 0;
	
	if room = LW_skelekitchen {player_animate_sprite_half();} else player_animate_sprite();
}
depth = -y;