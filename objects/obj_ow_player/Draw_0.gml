if (live_call()) return live_result;

if state = active {if shadowalpha < 1 {shadowalpha += 0.05}}
else if shadowalpha > 0 {shadowalpha -= 0.05}

//set drawx, drawy
drawx = x;
drawy = y+5+zfloor;

var shadowmultiplier = (zfloor-z)/300

draw_sprite_ext(spr_shadow,0,drawx+1,drawy-2,0.75-(shadowmultiplier),0.75-(shadowmultiplier),0,c_white,shadowalpha);
draw_sprite(sprite_index,image_index,x,y+z);

//debug

if instance_exists(ctrl_debug)
{
	draw_sprite_ext(spr_paps_hitbox,0,x,y+z,image_xscale,image_yscale,0,c_white,0.3);
	draw_sprite_ext(spr_paps_hitbox,0,x,y,image_xscale,image_yscale,0,c_white,0.3);
}
//draw_text(10,10,string(inputdirection));
//draw_sprite(spr_paps_hitbox,0,x,y);