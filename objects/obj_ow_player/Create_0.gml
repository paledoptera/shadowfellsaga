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
movespeed = 4;
jumpspeed = 13.5;
grav = 0.9;
z = 0;
zheight = -sprite_height / 2;
zfloor = 0;
inputmagnitude = 0;

//----PLAYER STATE----
state = -1;

//----FOLLOWER INPUT----
fol_input_x = 0;
fol_input_y = 0;
fol_input_run = 0;

//----GLOBAL POSITION----
global.pX=0;
global.pY=0;


//----INTERACTIONS---
interact_mode = 0;
interact_defaultmode = 0;

instance_create(x,y,obj_interact_sensor);



if room = LW_skelekitchen {sprite_run = spr_paps_lw_move; sprite_idle = spr_paps_lw_idle;}

_depth = -y

dir="down";