gpu_set_blendmode(bm_subtract);
draw_sprite_ext(spr_intro_boat_reflect,0,x,y,wave(0.98,1,0.5,0),1,0,c_white,0.7);
gpu_set_blendmode(bm_normal);



draw_self();
draw_sprite(spr_intro_boat_papyrus,internalframe,x+110,y+45);
draw_sprite(spr_intro_boat_sans,0,x+85,y+60);
draw_sprite(spr_intro_boat_ferry,0,x-100,y+29);