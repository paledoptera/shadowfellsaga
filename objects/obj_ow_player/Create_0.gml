/// @description INIT



animcounter = 0;
animlimit = 0;
switching_chars = false;

imgspd = 1;
hsp = 0;
vsp = 0;
zsp = 0;


movespeed = 4;

jumpspeed = 13.5;
grav = 0.9;

drawx = x;
drawy = y;


z = 0;
zheight = -sprite_height / 2;
zfloor = 0;

active = true;
animated = true;
inputdirection = 3;
inputmagnitude = 0;

cutscene_paused = false;

if global.leadchar = 0
{
	sprite_run = spr_paps_ow_move;
	sprite_idle = spr_paps_ow_idle;
	sprite_jump = spr_paps_ow_jump;
}
else
{
	sprite_run = spr_sans_ow_move;
	sprite_idle = spr_sans_ow_idle;
}

local_frame = 0;

shadowalpha = 1;

gui_local_frame = 0;

fol_input_x = 0;
fol_input_y = 0;
fol_input_run = 0;

global.pX=0;
global.pY=0;

instance_create(x,y,obj_interact_sensor);

mode = 0;
defaultmode = 0;

if room = LW_skelekitchen {sprite_run = spr_paps_lw_move; sprite_idle = spr_paps_lw_idle;}

_depth = -y

dir="down";