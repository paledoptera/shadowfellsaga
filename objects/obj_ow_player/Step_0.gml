#region INPUT
x_axis = input.right-input.left;
y_axis = input.down-input.up;
	
if input.target == "overworld" {
	inputdirection = input_direction(0, "left","right","up","down");
	inputmagnitude = (x_axis != 0) || (y_axis != 0);
}
#endregion

#region MOVEMENT
//SPEED
var mvspeed = movespeed
if input.run {image_speed = 1.6; mvspeed = movespeed*1.5} else {image_speed = 1;}

hsp = lengthdir_x(inputmagnitude * mvspeed, inputdirection);
vsp = lengthdir_y(inputmagnitude * mvspeed, inputdirection);

//Z AXIS
if zsp < 20 {zsp += grav;}
if z+zsp > zfloor {zsp = 0; z = zfloor;}  

z += zsp;
#endregion

#region INTERACTIONS + JUMPING + C MENU
//setting player mode
mode = defaultmode;
with obj_interact_sensor
{if place_meeting(x,y,obj_ow_interacttrigger) or place_meeting(x,y,obj_ow_interacttriggerb) or place_meeting(x,y,obj_savelamp){PLAYER.mode = 1; alpha = 1} else {alpha = 0.3;}}

if input.interact_pressed
{
    if mode = 0 {if z = zfloor {zsp = -jumpspeed;}} //JUMPING
    
    if mode = 1 {instance_create(x,y,obj_interact);} //INTERACTING WITH OBJECTS
}

//if input.menu_pressed {instance_create(x,y,obj_cmenu_mini)}
if mode = 0 && (zsp < 0) && (!input.interact) zsp = max(zsp,(-jumpspeed/3)) //HELD JUMP
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
if instance_exists(FOLLOWER) and distance_to_point(FOLLOWER.x,y) > 35
{
	if FOLLOWER.x < PLAYER.x and hsp > 0 {hsp = 0}
	if FOLLOWER.x > PLAYER.x and hsp < 0 {hsp = 0}
}
if distance_to_point(x,FOLLOWER.y) > 35
{
	if FOLLOWER.y < PLAYER.y and vsp > 0 {vsp = 0}
	if FOLLOWER.y > PLAYER.y and vsp < 0 {vsp = 0}
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
	fol_input_x = x_axis;
	fol_input_y = y_axis;
	fol_input_run = input.run;
}


#region ANIMATION

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
	
	if z != zfloor {sprite_index = sprite_jump;}
	
	if (_old_sprite != sprite_index) local_frame = 0;
	if room = LW_skelekitchen {player_animate_sprite_half();} else player_animate_sprite();
}
#endregion

//SETTING DEPTH
depth = -y;