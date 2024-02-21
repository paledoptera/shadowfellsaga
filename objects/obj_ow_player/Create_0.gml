//----ANIMATION----
shadow_draw_x = x;
shadow_draw_y = y;
local_frame = 0;
shadowalpha = 1;
ui_visible = true;
gui_local_frame = 0;
sprite_run = spr_paps_ow_move;
sprite_idle = spr_paps_ow_idle;
sprite_jump = spr_paps_ow_jump;

ui_y = -20;
ui_opacity = 0;
tween_setup();



//----MOVEMENT VARIABLES----
hsp = 0;
vsp = 0;
zsp = 0;
movespeed = 5;
alt_movespeed = 3;
jumpspeed = 13;
grav = 0.95;
z = 0;
zheight = -sprite_height / 2;
zfloor = 0;
inputmagnitude = 0;
direction = 270;
spawned = false;


//----PLAYER STATE----
state = "active";


//----FOLLOWER INPUT----
fol_array_size = 30;
for (var i = fol_array_size-1; i >= 0; i--)
{
	fol_pos_x[i] = x;
	fol_pos_y[i] = y;
	fol_pos_z[i] = z;	
}


//----INTERACTIONS---
interact_mode = 0;
interact_defaultmode = 0;
instance_create(x,y,obj_interact_sensor);
instance_create(x,y,obj_platformrange);