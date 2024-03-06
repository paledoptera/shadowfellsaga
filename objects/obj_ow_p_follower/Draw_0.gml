if (live_call()) return live_result;

//set drawx, drawy
shadow_draw_x = x;
shadow_draw_y = y+zfloor;

var shadow_frame_multi = (zfloor-z)/400
if z = zfloor {shadow_frame_multi = 0;}
if z < zfloor-20 {shadow_frame_multi = 1;}
if z < zfloor-40 {shadow_frame_multi = 2;}
if z < zfloor-60 {shadow_frame_multi = 3;}

draw_sprite_ext(spr_shadow,0+shadow_frame_multi,shadow_draw_x,shadow_draw_y,2,2,0,c_white,1);
draw_sprite_ext(sprite_index,image_index,x,y+z,2,2,0,c_white,1);


if instance_exists(ctrl_debug)
{
	draw_sprite_ext(spr_papy_hitbox,0,x,y+z,image_xscale,image_yscale,0,c_white,0.3);
	draw_sprite_ext(spr_papy_hitbox,0,x,y,image_xscale,image_yscale,0,c_white,0.3);
}