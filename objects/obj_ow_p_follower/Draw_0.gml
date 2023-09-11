drawx = x;
drawy = y+6+zfloor;


draw_sprite_ext(spr_shadow,0,drawx,drawy,0.9,0.9,0,c_white,PLAYER.shadowalpha);
draw_sprite(sprite_index,image_index,x,y+z);

if instance_exists(ctrl_debug)
{
	draw_sprite_ext(spr_paps_hitbox,0,x,y+z,image_xscale,image_yscale,0,c_white,0.3);
	draw_sprite_ext(spr_paps_hitbox,0,x,y,image_xscale,image_yscale,0,c_white,0.3);
}
