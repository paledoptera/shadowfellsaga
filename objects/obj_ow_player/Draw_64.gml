//----------JUMP CODE--------------
world_flag = flag_get(global.flags,"world")
if world_flag = 1
{
	//key_interact = input_key_pressed(global.key_action);
	if active = true {draw_sprite_ext(spr_jumpbuttons_wheel,0,525+30,27+46,1.3,1.3,-20,c_white,0.35);}

	draw_set_alpha(1);
	if z != zfloor draw_set_alpha(0.4);
	if active = true {draw_sprite(spr_jumpbuttons,key_interact,600-90-15+32,5+10+32);}


	//key_cancel = input_key_pressed(global.key_cancel);

	draw_set_alpha(1);
	//if obj_ow_p_follower.zsp != 0 draw_set_alpha(0.7);
	if active = true {draw_sprite(spr_jumpbuttons,2+key_cancel,600-30-15+32,30+10+32);}
	draw_set_alpha(1);
}

draw_text(10,10,string(fps));