#region "INPUT" & MOVEMENT
if input.target = "overworld"
{
	//X AND Y AXIES
	target_x = PLAYER.fol_pos_x[record]; 
	target_y = PLAYER.fol_pos_y[record]; 
	target_z = PLAYER.fol_pos_z[record];
	var target_x_value = PLAYER.movespeed * sign(target_x-x);
	var target_y_value = PLAYER.movespeed * sign(target_y-y);
	if !place_meeting(x+target_x_value,y,obj_wall_f) hsp = approach(0, target_x-x, PLAYER.movespeed); else hsp = 0;
	if !place_meeting(x,y+target_y_value,obj_wall_f) vsp = approach(0, target_y-y, PLAYER.movespeed); else vsp = 0;
	move_and_collide(hsp,vsp,obj_wall_f,20);
}
else
{
	inputmagnitude = 0;	
}

//Z AXIS
if zsp < 20 {zsp += PLAYER.grav;}
if z+zsp > zfloor {zsp = 0; z = zfloor;}  

z += zsp;
#endregion
	
#region ANIMATION	
var _old_sprite = sprite_index;
//checking for input
if (PLAYER.inputmagnitude != 0)
{
	image_speed = 1;
	direction = point_direction(x,y,obj_ow_player.x,obj_ow_player.y);
	sprite_index = sprite_run;
}
else {sprite_index = sprite_idle;}
if z != zfloor {sprite_index = sprite_jump;}
if (_old_sprite != sprite_index) local_frame = 0;
//animating sprite
player_animate_sprite();
#endregion
	
//SETTING DEPTH
depth = -y;