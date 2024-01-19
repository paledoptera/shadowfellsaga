

//set drawx, drawy
drawx = x;
drawy = y+5+zfloor;

var shadowmultiplier = (zfloor-z)/400
if z = zfloor {shadowalpha = 0;}
if z < zfloor-10 {shadowalpha = 0.2;}
if z < zfloor-20 {shadowalpha = 0.5;}
if z < zfloor-30 {shadowalpha = 0.7;}
if z < zfloor-30 {shadowalpha = 1;}

draw_sprite_ext(spr_shadow,0,drawx+1,drawy-2,0.62-(shadowmultiplier),0.62-(shadowmultiplier),0,c_white,shadowalpha);
draw_sprite(sprite_index,image_index,x,y+z);

//debug

if instance_exists(ctrl_debug)
{
	draw_sprite_ext(spr_paps_hitbox,0,x,y+z,image_xscale,image_yscale,0,c_white,0.3);
	draw_sprite_ext(spr_paps_hitbox,0,x,y,image_xscale,image_yscale,0,c_white,0.3);
}
//draw_text(10,10,string(inputdirection));
//draw_sprite(spr_paps_hitbox,0,x,y);