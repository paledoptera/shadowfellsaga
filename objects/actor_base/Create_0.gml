//----ANIMATION----
shadow_draw_x = x;
shadow_draw_y = y;
shadow_sprite = spr_shadow;
shadowalpha = 1;
local_frame = 0;
state = "default"
visible = true;

killswitch = -1;


image_speed = 0;
img_speed = 1;
image_xscale = 2;
image_yscale = 2;

current_talk_sprite = 0;

sprite_talk[0] = -1;
sprite_talk[1] = -1;
sprite_talk[2] = -1;

_old_sprite = sprite_index;

char = "noone"

sprite_run = 0;
sprite_idle = 0;
sprite_jump = 0;

sprite_custom = -1;

sprite_custom_img_start = 0;
sprite_custom_img_end = -1;
animation_end = false;
looping_sprite = true;

direction_amount = 1;

//----OTHER----
zsp = 0;
grav = 0.95;
z = 0;
zheight = -sprite_height / 2;
zfloor = 0;
inputmagnitude = 0;
direction = 270;