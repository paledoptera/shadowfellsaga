/// @description INIT




imgspd = 1;
hsp = 0;
vsp = 0;
zsp = 0;


movespeed = 4;

jumpspeed = 13.5;
grav = 0.9;

z = 0;
zheight = -sprite_height / 2;
zfloor = 0;

active = true;
animated = true;
inputdirection = 3;
inputmagnitude = 0;

cutscene_paused = false;

sprite_run = spr_paps_ow_move;
sprite_idle = spr_paps_ow_idle;
local_frame = 0;

shadowalpha = 1;

global.pX=0;
global.pY=0;

if room = LW_skelekitchen {sprite_run = spr_paps_lw_move; sprite_idle = spr_paps_lw_idle;}
instance_create(x,y,ctrl_camera);
//instance_create(x,y,obj_interact);
instance_create(0,0,ctrl_debug);
if room != LW_skelekitchen and room != DW_wildcliffs1 instance_create(x,y,obj_ow_p_follower); 

for(i = 50; i >=0; i--)
{
	pos_x[i] = x;
	pos_y[i] = y;
	pos_run[i] = 0;
}

_depth = -y