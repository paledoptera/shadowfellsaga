//----ANIMATION----
animcounter = 0;
animlimit = 0;
imgspd = 1;
drawx = x;
drawy = y;
local_frame = 0;
shadowalpha = 1;
gui_local_frame = 0;
sprite_run = spr_paps_ow_move;
sprite_idle = spr_paps_ow_idle;
sprite_jump = spr_paps_ow_jump;
ui_y = -10;
ui_opacity = 0;



//----MOVEMENT VARIABLES----
hsp = 0;
vsp = 0;
zsp = 0;
movespeed = 5;
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

//----GLOBAL POSITION----
global.pX=0;
global.pY=0;


//----INTERACTIONS---
interact_mode = 0;
interact_defaultmode = 0;

instance_create(x,y,obj_interact_sensor);
instance_create(x,y,obj_platformrange);



if room = LW_skelekitchen {sprite_run = spr_paps_lw_move; sprite_idle = spr_paps_lw_idle;}

_depth = -y

dir="down";