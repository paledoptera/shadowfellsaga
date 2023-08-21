//INPUT
if active = true
{
	if(!gamepad_is_connected(global.gp_device)){
	key_left				= input_key_held(global.key_left);
	key_right			 = input_key_held(global.key_right);
	key_up				= input_key_held(global.key_up);
	key_down			= input_key_held(global.key_down);
	key_interact		= input_key_pressed(global.key_action);
	key_interact_held	= input_key_held(global.key_action);
	key_cancel		= input_key_pressed(global.key_cancel);
	key_run				= input_key_held(global.key_run);
	
	x_axis = key_right-key_left;
	y_axis = key_down-key_up;
	
	} else if(gamepad_is_connected(global.gp_device)) {
		key_left				= input_gp_button_held(global.gp_device,global.gp_left) 
		key_right			= input_gp_button_held(global.gp_device,global.gp_right) 
		key_up				= input_gp_button_held(global.gp_device,global.gp_up) 
		key_down			= input_gp_button_held(global.gp_device,global.gp_down) 
		key_interact		= input_gp_button_pressed(global.gp_device,global.gp_action);
		key_cancel			= input_gp_button_pressed(global.gp_device,global.gp_cancel);
		key_run				= input_gp_button_held(global.gp_device,global.gp_run);
		x_axis = key_right-key_left;
		y_axis = key_down-key_up;
	}
	
	inputdirection = point_direction(0,0,x_axis, y_axis);
	inputmagnitude = (x_axis != 0) || (y_axis != 0);
	
	//SPEED
	var mvspeed = movespeed
	if key_run {image_speed = 1.6; mvspeed = movespeed*1.5} else {image_speed = 1;}

	hsp = lengthdir_x(inputmagnitude * mvspeed, inputdirection);
	vsp = lengthdir_y(inputmagnitude * mvspeed, inputdirection);

//Z AXIS
if zsp < 20 {zsp += grav;}
if z+zsp > zfloor {zsp = 0; z = zfloor;}  

z += zsp;

//INTERACTIONS

if key_interact 
{
	//JUMPING
	if z = zfloor {zsp = -jumpspeed;}
	//instance_create(x,y,obj_interact);
}
if (zsp < 0) && (!key_interact_held) zsp = max(zsp,(-jumpspeed/3))


//MOVEMENT
if active = true 
{	
	//establishing if the player is at a z level higher than any platforms
	if instance_exists(obj_wall_h1) with obj_wall_h1
	{
		//all this is being executed in "obj_wall_h1"
		if floor(obj_ow_player.z) < -height
		{
			if instance_exists(obj_tempwall) {with obj_tempwall {if x = other.x and y = other.y {instance_destroy();}}}
			walkable = true;
			wallspawn = false;
		}
		else 
		{	
			if wallspawn = false 
			{
				___inst = instance_create(x,y,obj_tempwall);
				___inst.depth = depth-1
			}
			wallspawn = true;
			walkable = false;
		}
	}
	//setting collissions
	var wall_h1 = instance_place(x, y, obj_wall_h1)
	var wall_h2 = instance_place(x, y, obj_wall_h2)
	var wall_h3 = instance_place(x, y, obj_wall_h3)
	if wall_h1 != noone {if wall_h1.walkable = true {zfloor = -wall_h1.height-0.1}}
	else {zfloor = 0;}
	if wall_h2 != noone {if wall_h2.walkable = true {zfloor = -wall_h2.height-0.1}}
	if wall_h3 != noone {if wall_h3.walkable = true {zfloor = -wall_h3.height-0.1}}
	
	//EXECUTING MOVEMENT + COLLISION
	move_and_collide(hsp,vsp,obj_wall,20);
}

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