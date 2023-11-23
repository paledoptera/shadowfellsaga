// --------ACTIVE STATE: used for basic overworld gameplay.
// - the bulk of the code is in here
// - input is also in here, but is only checked if interact.target is overworld.
//   this is in cases like opening the c menu or savemenu, where you don't necassarily want the player
//   to be in an inactive state, but just to be unable to use controls.
active = function()
{

	#region INPUT
	if input.target = "overworld"
	{
		x_axis = input.right-input.left;
		y_axis = input.down-input.up;
		var movement_dir = input.movement_dir
		var interact = input.interact_pressed
		
		inputmagnitude = (x_axis != 0) || (y_axis != 0);
	}
	else
	{
		x_axis = 0;
		y_axis = 0;
		var movement_dir = 0;
		var interact = 0;
		inputmagnitude = 0;
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

	#region INTERACTIONS + JUMPING + C MENU
	//setting player mode
	interact_mode = interact_defaultmode;
	with obj_interact_sensor
	{if place_meeting(x,y,obj_ow_interacttrigger) or place_meeting(x,y,obj_ow_interacttriggerb) or place_meeting(x,y,obj_savelamp){PLAYER.interact_mode = 1; alpha = 1} else {alpha = 0.3;}}

	if interact
	{
		if interact_mode = 0 {if z = zfloor {zsp = -jumpspeed; audio_play_sound(snd_txtpapyrus,1,false,0.5);}} //JUMPING
		if interact_mode = 1 {instance_create(x,y,obj_interact);} //INTERACTING WITH OBJECTS
	}

	if input.menu_pressed {instance_create(x,y,obj_cmenu)}
	#endregion

	#region SETTING 2.5D PLATFORM COLLISION
	//establishing if the player is at a z level higher than any platforms
	if instance_exists(obj_wall_h1) with obj_wall_h1
	{	 
		//all this is being executed in "obj_wall_h1"
		//SETTING PLAYER HEIGHT AND WALLS
		if floor(obj_ow_player.z) < -height
		{
			if instance_exists(obj_walltemp) {with obj_walltemp {if x = other.x and y = other.y {instance_destroy();}}}
			walkable = true;
			wallspawn = false;
		}
		else 
		{	
			if wallspawn = false 
			{
				___inst = instance_create(x,y,obj_walltemp);
				___inst.depth = depth-1
			}
			wallspawn = true;
			walkable = false;
		}
		//SETTING FOLLOWER HEIGHT AND WALLS
		if floor(FOLLOWER.z) < -height
		{
			if instance_exists(obj_walltemp_f) {with obj_walltemp_f {if x = other.x and y = other.y {instance_destroy();}}}
			fol_walkable = true;
			fol_wallspawn = false;
		}
		else 
		{	
			if fol_wallspawn = false 
			{
				___inst2 = instance_create(x,y,obj_walltemp_f);
				___inst2.depth = depth-1
			}
			fol_wallspawn = true;
			fol_walkable = false;
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
	#endregion

	hsp = round(hsp);
	vsp = round(vsp);

	x = round(x);
	y = round(y);

	#region SETTING FOLLOWER 2.5D PLATFORM COLLISION
	//checking if follower can go up to obj_wallh1
	if instance_exists(FOLLOWER) and fol_pos.z[FOLLOWER.record] > FOLLOWER.z
	{
		if FOLLOWER.x < PLAYER.x and hsp > 0 {hsp = 0}
		if FOLLOWER.x > PLAYER.x and hsp < 0 {hsp = 0}
	}
	if distance_to_point(x,FOLLOWER.y) > 35
	{
		if FOLLOWER.y < PLAYER.y and vsp > 0 {vsp = 0}
		if FOLLOWER.y > PLAYER.y and vsp < 0 {vsp = 0}
	}
	}

	with FOLLOWER
	{
	//if place meeting with a heighted wall, make zfloor the height of the wall.
	//place meeting with a heighted wall should NEVER happen UNLESS sans is on top of the wall, which is why we set his zfloor.
	if place_meeting(x,y,obj_wall_h1)
	{
		var wall_h1 = instance_place(x, y, obj_wall_h1)
		var wall_h2 = instance_place(x, y, obj_wall_h2)
		var wall_h3 = instance_place(x, y, obj_wall_h3)
		if wall_h1 != noone {if wall_h1.fol_walkable = true {zfloor = -wall_h1.height-0.1}}
		else {zfloor = 0;}
		if wall_h2 != noone {if wall_h1.fol_walkable = true {zfloor = -wall_h2.height-0.1}}
		if wall_h3 != noone {if wall_h1.fol_walkable = true {zfloor = -wall_h3.height-0.1}}
	}
	else {zfloor = 0;}	
	}
	#endregion

	//EXECUTE MOVEMENT AND REGULAR COLLISIONS
	move_and_collide(hsp,vsp,obj_wall,20);

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
	if (inputmagnitude != 0)
	{
		dir = "undefined"; // Set "dir" override variable to undefined so that we can manually set direction as we walk around the room
		direction = input.movement_dir;
		sprite_index = sprite_run;
	}
	else {sprite_index = sprite_idle;}
	
	if z != zfloor {sprite_index = sprite_jump;}
	
	if (_old_sprite != sprite_index) local_frame = 0;
	if room = LW_skelekitchen {player_animate_sprite_half();} else player_animate_sprite();
	#endregion
}

//CUTSCENE_ACTOR STATE: used when in a cutscene, but still walking around.
// - nonfunctional, but still uses overworld animations.
cutscene_actor = function()
{
	//Z AXIS
	//the reason we keep z axis stuff, as well as 2.5 platform collision is we don't want 
	//papyrus to clip into the terrain, we want him to stand on top of it.
	//if he jumps in a cutscene, we also want to keep his gravity.
	if zsp < 20 {zsp += grav;}
	if z+zsp > zfloor {zsp = 0; z = zfloor;}  

	#region SETTING 2.5D PLATFORM COLLISION
	//establishing if the player is at a z level higher than any platforms
	if instance_exists(obj_wall_h1) with obj_wall_h1
	{	 
		//all this is being executed in "obj_wall_h1"
		//SETTING PLAYER HEIGHT AND WALLS
		if floor(obj_ow_player.z) < -height
		{
			if instance_exists(obj_walltemp) {with obj_walltemp {if x = other.x and y = other.y {instance_destroy();}}}
			walkable = true;
			wallspawn = false;
		}
		else 
		{	
			if wallspawn = false 
			{
				___inst = instance_create(x,y,obj_walltemp);
				___inst.depth = depth-1
			}
			wallspawn = true;
			walkable = false;
		}
		//SETTING FOLLOWER HEIGHT AND WALLS
		if floor(FOLLOWER.z) < -height
		{
			if instance_exists(obj_walltemp_f) {with obj_walltemp_f {if x = other.x and y = other.y {instance_destroy();}}}
			fol_walkable = true;
			fol_wallspawn = false;
		}
		else 
		{	
			if fol_wallspawn = false 
			{
				___inst2 = instance_create(x,y,obj_walltemp_f);
				___inst2.depth = depth-1
			}
			fol_wallspawn = true;
			fol_walkable = false;
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
	#endregion
	
	z += zsp;
	
	#region ANIMATION
	var _old_sprite = sprite_index;
	if x != xprevious or y != yprevious 
	{
		dir = "undefined"; // Set "dir" override variable to undefined so that we can manually set direction as we walk around the room
		inputmagnitude = 1
		direction = point_direction(xprevious,yprevious,x,y);
		sprite_index = sprite_run;
	}
	else {sprite_index = sprite_idle;}
	if z != zfloor {sprite_index = sprite_jump;}
	if (_old_sprite != sprite_index) local_frame = 0;
	if room = LW_skelekitchen {player_animate_sprite_half();} else player_animate_sprite();
	#endregion
}


//INACTIVE STATE: used when in cutscene and sprite needs to change.
// - COMPLETELY nonfunctional
inactive = function()
{
	//do nothing
}


if !instance_exists(ctrl_cutscene) state = active;
if instance_exists(obj_savemenu) state = cutscene_actor;

state(); //executing the state
//choosing the state is done by other objects, but active is the default.

//SETTING DEPTH
//this is important regardless of state
depth = -y;