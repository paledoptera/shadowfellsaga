if !instance_exists(ctrl_cutscene)
{
	if obj_ow_player.pos_run[record] = 1 {image_speed = 1.7;} else {image_speed = 1;}
	
	
	x += round((PLAYER.pos_x[record]-x)/3)
	y += round((PLAYER.pos_y[record]-y)/3)
	
	global.pfX=FOLLOWER.x
	global.pfY=FOLLOWER.y
	
	var inputmagnitude = 0;

	if x != xprevious or y != yprevious 
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

