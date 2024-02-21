//----ANIMATION----
shadow_draw_x = x;
shadow_draw_y = y;
shadowalpha = 1;
local_frame = 0;
state = "default"

sprite_run = -1;
sprite_idle = -1;
sprite_jump = -1;

current_talk_sprite = 0;

sprite_talk[0] = -1;
sprite_talk[1] = -1;
sprite_talk[2] = -1;

current_other_sprite = 0;

char = "noone"

sprite_other[0] = -1;
sprite_other[1] = -1;
sprite_other[2] = -1;
sprite_other[3] = -1;

animation_end = false;
looping_sprite = true;

//----OTHER----
zsp = 0;
grav = 0.95;
z = 0;
zheight = -sprite_height / 2;
zfloor = 0;
inputmagnitude = 0;
direction = 270;