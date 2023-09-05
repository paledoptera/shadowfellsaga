record = 10;

imgspd = 1;


spawn = true;

global.pfX=0;
global.pfY=0;

if global.leadchar = 0
{
	sprite_run = spr_sans_ow_move;
	sprite_idle = spr_sans_ow_idle;
}
else
{
	sprite_run = spr_paps_ow_move;
	sprite_idle = spr_paps_ow_idle;
}

z = 0;
zheight = -sprite_height / 2;
zfloor = 0;

zsp = 0;

jumpspeed = 13.5;
grav = 0.9;

local_frame = 0;

drawx = x;
drawy = y;