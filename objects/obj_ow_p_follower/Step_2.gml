if !instance_exists(ctrl_cutscene)
{
	image_speed = 1;

	//setting base target x & y to behind player
	target_x = PLAYER.fol_pos_x[record]; 
	target_y = PLAYER.fol_pos_y[record]; 
	target_z = PLAYER.fol_pos_z[record];
	//MATH SHIT
	
	var target_x_value = PLAYER.movespeed * sign(target_x-x);
	var target_y_value = PLAYER.movespeed * sign(target_y-y);

	if !place_meeting(x+target_x_value,y,obj_wall_f) hsp = approach(0, target_x-x, PLAYER.movespeed); else hsp = 0;
	if !place_meeting(x,y+target_y_value,obj_wall_f) vsp = approach(0, target_y-y, PLAYER.movespeed); else vsp = 0;
	
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
			if PLAYER.interact_mode = 0 {if z = zfloor {zsp = -jumpspeed;  if audio_is_playing(snd_jump) {audio_stop_sound(snd_jump)}; audio_play_sound(snd_jump,1,false,0.5);}} //JUMPING
		}
	}
	
	var _old_sprite = sprite_index;
	
	if (PLAYER.inputmagnitude != 0)
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