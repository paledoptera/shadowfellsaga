if !instance_exists(ctrl_cutscene)
{
	if PLAYER.fol_input_run = 1 
	//if PLAYER.pos_run[record] = 1 
	{image_speed = 1.7;}
	else {image_speed = 1;}
	
	//setting target x & y
	//getting input from player
	if PLAYER.fol_input_x != 0 and PLAYER.fol_input_y = 0 {lastinput_x = PLAYER.fol_input_x; lastinput_y = 0;}
	if PLAYER.fol_input_y != 0 and PLAYER.fol_input_x = 0 {lastinput_y = PLAYER.fol_input_y; lastinput_x = 0;}
	if PLAYER.fol_input_x != 0 and PLAYER.fol_input_y != 0 {lastinput_x = PLAYER.fol_input_x; lastinput_y = PLAYER.fol_input_y;}
	//setting base target x & y to behind player
	target_x = PLAYER.x-(lastinput_x*38); target_y = PLAYER.y-(lastinput_y*38);
	if PLAYER.x != PLAYER.xprevious {target_x = PLAYER.x-(lastinput_x*20); target_y = PLAYER.y}
	else if PLAYER.y != PLAYER.yprevious {target_y = PLAYER.y-(lastinput_y*20); target_x = PLAYER.x}	
	if PLAYER.x != PLAYER.xprevious and PLAYER.y != PLAYER.yprevious {target_x = PLAYER.x-(lastinput_x*10); target_y = PLAYER.y-(lastinput_y*10);}

	//MATH SHIT
	var xx = x
	var yy = y
	xx += (target_x-x)/5;
	yy += (target_y-y)/5;
	
	xx = round(xx);
	yy = round(yy);
	
	var mvspeed = movespeed;
	if PLAYER.fol_input_run != 0 {mvspeed = mvspeed *1.5}
	
	hsp = approach(0, xx-x, mvspeed);
	vsp = approach(0,yy-y,mvspeed);
	
	hsp = round(hsp);
	vsp = round(vsp);

	x = round(x);
	y = round(y);
	
	move_and_collide(hsp,vsp,obj_wall_f,20);

	
	global.pfX=FOLLOWER.x
	global.pfY=FOLLOWER.y
	
	//Z AXIS SHIT
	if zsp < 20 {zsp += grav;}
	if z+zsp > zfloor {zsp = 0; z = zfloor;}  

	z += zsp;
	
	if PLAYER.key_cancel  && !instance_exists(obj_cmenu) && !instance_exists(obj_cmenu_mini) && !instance_exists(obj_savemenu) && !instance_exists(obj_loadmenu)
	{
		if PLAYER.mode = 0 {if z = zfloor {zsp = -jumpspeed;}} //JUMPING
	}
	if PLAYER.mode = 0 && (zsp < 0) && (!PLAYER.key_cancel_held) zsp = max(zsp,(-jumpspeed/3)) //HELD JUMP

	
	//MOVEMENT
	//establishing if the player is at a z level higher than any platforms
	//setting collissions
	var wall_h1 = instance_place(x, y, obj_wall_h1)
	var wall_h2 = instance_place(x, y, obj_wall_h2)
	var wall_h3 = instance_place(x, y, obj_wall_h3)
	if wall_h1 != noone {if wall_h1.walkable = true {zfloor = -wall_h1.height-0.1}}
	else {zfloor = 0;}
	if wall_h2 != noone {if wall_h2.walkable = true {zfloor = -wall_h2.height-0.1}}
	if wall_h3 != noone {if wall_h3.walkable = true {zfloor = -wall_h3.height-0.1}}
	
	var inputmagnitude = 0;

	if round(x) != round(xprevious) or round(y) != round(yprevious) 
	{
		inputmagnitude = 1;

	}
	//if zsp != 0 {inputmagnitude = 1;}

	var _old_sprite = sprite_index;
	
	if (inputmagnitude != 0)
	{
		direction = point_direction(x,y,obj_ow_player.x,obj_ow_player.y);
		sprite_index = sprite_run;
	}
	
	else {sprite_index = sprite_idle;}
	
	
	if (_old_sprite != sprite_index) local_frame = 0;
	
	
	
	player_animate_sprite();
}

/*if spawn = true
{
	record = 11;
	spawn = false;
}
*/
depth = -y;