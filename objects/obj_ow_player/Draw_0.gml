if active = true and shadowalpha < 1 {shadowalpha += 0.05}
if active = false and shadowalpha > 0 {shadowalpha -= 0.05}

//set drawx, drawy
drawx = x;
drawy = y+5+zfloor;


draw_sprite_ext(spr_shadow,0,drawx,drawy,1,1,0,c_white,shadowalpha);
draw_sprite(sprite_index,image_index,x,y+z);

//debug
/*draw_sprite(spr_paps_hitbox,0,x,y+z);
draw_sprite(spr_paps_hitbox,0,x,y);

//draw_text(10,10,string(inputdirection));
//draw_sprite(spr_paps_hitbox,0,x,y);