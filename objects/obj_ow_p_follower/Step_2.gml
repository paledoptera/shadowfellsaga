if (live_call()) return live_result;

if !instance_exists(ctrl_cutscene)
{
	record = 10;
	image_speed = 1;

	//setting base target x & y to behind player
	target_x = PLAYER.fol_pos_x[record]; target_y = PLAYER.fol_pos_y[record]; target_z = PLAYER.fol_pos_z[record];
	//MATH SHIT
	if target_z = z or target_z < z
	{
		x = target_x
		y = target_y	
	}

	
	
	/*xx += (target_x-x)/2
	yy += (target_y-y)/2
	
	xx = round(xx);
	yy = round(yy);
	
	hsp = approach(0, xx-x, movespeed);
	vsp = approach(0, yy-y, movespeed);
	
	hsp = round(hsp);
	vsp = round(vsp);
	x = round(x);
	y = round(y);*/
	
	move_and_collide(hsp,vsp,obj_wall_f,20);

	
	global.pfX=FOLLOWER.x
	global.pfY=FOLLOWER.y
	
	//Z AXIS SHIT
	if zsp < 20 {zsp += grav;}
	if z+zsp > zfloor {zsp = 0; z = zfloor;}  

	z += zsp;
	
	if input.target = "overworld"
	{
		if input.cancel_pressed
		{
			if PLAYER.interact_mode = 0 {if z = zfloor {zsp = -jumpspeed;  audio_play_sound(snd_txtsans,1,false,0.5);}} //JUMPING
		}
	}
	
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
	

	if z != zfloor {sprite_index = sprite_jump;}
	
	
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