if !instance_exists(ctrl_cutscene)
{
	if PLAYER.pos_run[record] = 1 
	{image_speed = 1.7;}
	else {image_speed = 1;}
	
	//setting target x & y
	var target_x = PLAYER.pos_x[record]
	var target_y = PLAYER.pos_y[record]

	//clamping target x & y
	var _clampvalue = 45;
	if PLAYER.inputmagnitude != 0 {_clampvalue = 35;}
	if PLAYER.x_axis != 0 and PLAYER.y_axis != 0 {_clampvalue = 28;}
	target_x = clamp(target_x, PLAYER.x-_clampvalue,PLAYER.x+_clampvalue)
	target_y = clamp(target_y, PLAYER.y-_clampvalue,PLAYER.y+_clampvalue)
	
	//if PLAYER.x_axis > 0 and PLAYER.pos_x[record] < PLAYER.x-35 {PLAYER.pos_x[record] = round(PLAYER.x-35)}
	//if PLAYER.x_axis < 0 and PLAYER.pos_x[record] > PLAYER.x+35 {PLAYER.pos_x[record] = round(PLAYER.x+35)}
	//if PLAYER.y_axis > 0 and PLAYER.pos_y[record] < PLAYER.y-35 {PLAYER.pos_y[record] = round(PLAYER.y-35)}
	//if PLAYER.y_axis < 0 and PLAYER.pos_y[record] > PLAYER.y+35 {PLAYER.pos_y[record] = round(PLAYER.y+35)}
	
	x += (target_x-x)/3;
	y += (target_y-y)/3;
	
	if _clampvalue != 28 {x = round(x); y = round(y);}
	
	//x += round((PLAYER.pos_x[record]-x)/3)
	//y += round((PLAYER.pos_y[record]-y)/3)
	
	global.pfX=FOLLOWER.x
	global.pfY=FOLLOWER.y
	
	//Z AXIS SHIT
	if zsp < 20 {zsp += grav;}
	if z+zsp > zfloor {zsp = 0; z = zfloor;}  

	z += zsp;
	
	if PLAYER.key_cancel 
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

