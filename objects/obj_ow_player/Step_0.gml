#region ADJUSTING FOR FLAGS
//checking if in light world
	if flag_get(global.flags,"world") = 0  
	{
	sprite_run = spr_paps_lw_move; 
	sprite_idle = spr_paps_lw_idle;
	interact_defaultmode = 1;
	} 
//checking if papyrus can jump yet, ONLY if not in light world
	else if flag_get(global.cflags,"papyrus_jump_enabled") = -1 
	{
	ui_visible = false; //ui visible?
	interact_defaultmode = 0; //enable jump
	}
#endregion


#region INPUT
if input.target = "overworld"
{
	x_axis = input.right-input.left;
	y_axis = input.down-input.up;
	var movement_dir = input.movement_dir
	var interact = input.interact_pressed
	var cancel = input.cancel_pressed
	var thought = input.thought_pressed
	var menu = input.menu_pressed
	inputmagnitude = (x_axis != 0) || (y_axis != 0);
	ui_visible = true;
	image_speed = 1;
}
else
{
	x_axis = 0;
	y_axis = 0;
	var movement_dir = 0;
	var interact = 0;
	var cancel = 0;
	var thought = 0;
	var menu = 0;
	inputmagnitude = 0;
	ui_visible = false;
}
#endregion


#region MOVEMENT
//SPEED
hsp = lengthdir_x(inputmagnitude * movespeed, movement_dir);
vsp = lengthdir_y(inputmagnitude * movespeed, movement_dir);

//Z AXIS
if zsp < 20 {zsp += grav;}
if z+zsp > zfloor {zsp = 0; z = zfloor;}  

z += zsp;
#endregion

#region INTERACTIONS + JUMPING + MENU
//setting player mode
interact_mode = interact_defaultmode;
with obj_interact_sensor
{if place_meeting(x,y,obj_ow_interacttrigger) or place_meeting(x,y,obj_ow_interacttriggerb) or place_meeting(x,y,obj_savelamp){PLAYER.interact_mode = 1; alpha = 1} else {alpha = 0.3;}}


//ALL BUTTON INPUTS
	//interacting + jumping (papyrus)
	if interact
	{
		if interact_mode = 0 {if z = zfloor {zsp = -jumpspeed; if audio_is_playing(snd_jump) {audio_stop_sound(snd_jump)}; audio_play_sound(snd_jump,1,false,0.5);}} //JUMPING
		if interact_mode = 1 {instance_create(x,y,obj_interact);} //INTERACTING WITH OBJECTS
	}
	//jumping (sans)
	if cancel
	{
		if instance_exists(FOLLOWER) {if FOLLOWER.z = FOLLOWER.zfloor {FOLLOWER.zsp = -jumpspeed;}} if audio_is_playing(snd_jump) {audio_stop_sound(snd_jump)}; audio_play_sound(snd_jump,1,false,0.5); //JUMPING SANS
	}
	//full party jump
	if thought
	{
		if z = zfloor {zsp = -jumpspeed;}  if audio_is_playing(snd_jump) {audio_stop_sound(snd_jump)}; audio_play_sound(snd_jump,1,false,0.5);
		if instance_exists(FOLLOWER) {if FOLLOWER.z = FOLLOWER.zfloor {FOLLOWER.zsp = -jumpspeed;}} if audio_is_playing(snd_jump) {audio_stop_sound(snd_jump)}; audio_play_sound(snd_jump,1,false,0.5);
	}
	//open menu
	if menu 
	{
		if !instance_exists(obj_cmenu) {instance_create(x,y,obj_cmenu);}
	}
#endregion

// SETTING 2.5D PLATFORM COLLISION
check_z_collision();

// MAKE SURE FOLLOWER DOESN'T LAG BEHIND
if instance_exists(FOLLOWER)
{
	with FOLLOWER {check_z_collision();}
	if point_distance(x,y,FOLLOWER.x,y)>40
	{
		if FOLLOWER.x < PLAYER.x and hsp > 0 {hsp = 0}
		if FOLLOWER.x > PLAYER.x and hsp < 0 {hsp = 0}
	}
	if point_distance(x,y,x,FOLLOWER.y)>40
	{
		if FOLLOWER.y < PLAYER.y and vsp > 0 {vsp = 0}
		if FOLLOWER.y > PLAYER.y and vsp < 0 {vsp = 0}
	}
}

//EXECUTE MOVEMENT AND REGULAR COLLISIONS
move_and_collide(hsp,vsp,obj_wall,20,0,0,movespeed,movespeed);
	
//EXECUTING MOVEMENT FOR FOLLOWER
if (x!= xprevious or y!= yprevious)
{
	for (var i = fol_array_size-1; i>0;i--)
	{
		fol_pos_x[i] = fol_pos_x[i-1];
		fol_pos_y[i] = fol_pos_y[i-1];
		fol_pos_z[i] = fol_pos_z[i-1];			
	}
	fol_pos_x[0] = x;
	fol_pos_y[0] = y;
	fol_pos_z[0] = z;
}

#region ANIMATION
var _old_sprite = sprite_index;
//checking for input
if (inputmagnitude != 0)
{
	direction = input.movement_dir;
	sprite_index = sprite_run;
}
else {sprite_index = sprite_idle;}
if z != zfloor {sprite_index = sprite_jump;}
if (_old_sprite != sprite_index) local_frame = 0;
//setting world (light world or dark world?)
var _spritenumber = 8 
if flag_get(global.flags,"world") = 0 {_spritenumber = 4} else {_spritenumber = 8}
//animating sprite
player_animate_sprite(_spritenumber);
#endregion

//SETTING DEPTH & POSITION
depth = -y;
global.pX=x;
global.pY=y;

