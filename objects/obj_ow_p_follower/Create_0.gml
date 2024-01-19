if (live_call()) return live_result;
record = 7;
imgspd = 1;

target_x = x;
target_y = y;

hsp = 0;
vsp = 0;
zsp = 0;
shadowalpha = 1;

init = 0;

lastinput_x = 0;
lastinput_y = 0;


spawn = true;

global.pfX=0;
global.pfY=0;


sprite_run = spr_sans_ow_move;
sprite_idle = spr_sans_ow_idle;
sprite_jump = spr_sans_ow_jump;

z = 0;
zheight = -sprite_height / 2;
zfloor = 0;



jumpspeed = PLAYER.jumpspeed;
grav = PLAYER.grav;

local_frame = 0;

drawx = x;
drawy = y;