timer += 1
if timer > (time_end*60) {instance_destroy();}
if sound_played = false {sound_played = true; audio_play_sound(sound,10,false);}

if timer > 2 {draw_y = y-6;}
if timer > 4 {draw_y = y-16;}
if timer > 8 {draw_y = y-14;}
if timer > 12 {draw_y = y-12;}
//if timer > 20 {draw_y = y-10;}

draw_sprite_ext(sprite_index,image_index,draw_x+draw_x_adj,draw_y+draw_y_adj,image_xscale,image_yscale,0,c_white,1);