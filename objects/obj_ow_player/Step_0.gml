//INPUT
	if(!gamepad_is_connected(global.gp_device)){
	key_left				= input_key_held(global.key_left);
	key_right			 = input_key_held(global.key_right);
	key_up				= input_key_held(global.key_up);
	key_down			= input_key_held(global.key_down);
	key_interact		= input_key_pressed(global.key_action);
	key_interact_held	= input_key_held(global.key_action);
	key_switchmode		= input_key_pressed(global.key_swap1);
	key_switchchar		= input_key_pressed(global.key_swap2);
	key_cancel		= input_key_pressed(global.key_cancel);
	key_cancel_held		= input_key_held(global.key_cancel);
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


//CHAR SWITCHING
if key_switchchar and z = zfloor and inputmagnitude = 0 //and FOLLOWER.z = FOLLOWER.zfloor
{
	if global.leadchar = 0
	{
		global.leadchar = 1;
		sprite_run = spr_sans_ow_move;
		sprite_idle = spr_sans_ow_idle;
		FOLLOWER.sprite_run = spr_paps_ow_move;
		FOLLOWER.sprite_idle = spr_paps_ow_idle;
	}
	else
	{
		global.leadchar = 0;
		sprite_run = spr_paps_ow_move;
		sprite_idle = spr_paps_ow_idle;
		FOLLOWER.sprite_run = spr_sans_ow_move;
		FOLLOWER.sprite_idle = spr_sans_ow_idle;
	}
}




//ACTIVE GAMEPLAY
if active = true
{	
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
//setting player mode
mode = defaultmode;
with obj_interact_sensor
{if place_meeting(x,y,obj_ow_interacttrigger) or place_meeting(x,y,obj_ow_interacttriggerb) {PLAYER.mode = 1; alpha = 1} else {alpha = 0.3;}}

if key_interact 
{
	if mode = 0 {if z = zfloor {zsp = -jumpspeed;}} //JUMPING
	
	if mode = 1 {instance_create(x,y,obj_interact);} //INTERACTING WITH OBJECTS
}
if mode = 0 && (zsp < 0) && (!key_interact_held) zsp = max(zsp,(-jumpspeed/3)) //HELD JUMP

//MOVEMENT
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
//checking if player CAN move
//var _can_move = true
//with obj_ow_p_follower 
/*{
	if place_meeting(x+PLAYER.hsp,y,obj_wall) {PLAYER._can_move = false; PLAYER.hsp = 0;}
	if place_meeting(x,y+PLAYER.vsp,obj_wall) {PLAYER._can_move = false; PLAYER.vsp = 0;}	
	if place_meeting(x+PLAYER.hsp,y,obj_wall_h1) and z < PLAYER.z {PLAYER._can_move = false; PLAYER.hsp = 0;}
	if place_meeting(x,y+PLAYER.vsp,obj_wall_h1) and z < PLAYER.z {PLAYER._can_move = false; PLAYER.vsp = 0;}
}*/
//moving
move_and_collide(hsp,vsp,obj_wall,20);


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
		dir = "undefined"; // Set "dir" override variable to undefined so that we can manually set direction as we walk around the room
		direction = inputdirection;
		sprite_index = sprite_run;
	}
	else {sprite_index = sprite_idle;}
	if (_old_sprite != sprite_index) local_frame = 0;
	
	//switch dir {
	//	case "down":
	//		direction = 270;
	//	break;
	//	case "up":
	//		direction = 90;
	//	break;
	//	case "right":
	//		direction = 360;
	//	break;
	//	case "left": 
	//		direction = 180;
	//	break;
	//}
	
	if room = LW_skelekitchen {player_animate_sprite_half();} else player_animate_sprite();
}

depth = -y;