//----------UNUSED JUMP CODE--------------
/*if room != LW_skelekitchen
{
	key_interact = keyboard_check(KEY_ACTION);


	draw_set_alpha(1);
	if zsp != 0 draw_set_alpha(0.7);
	draw_sprite(spr_jumpbuttons,key_interact,600-90-15,5+10);


	key_cancel = keyboard_check(KEY_CANCEL);

	draw_set_alpha(1);
	if obj_ow_p_follower.zsp != 0 draw_set_alpha(0.7);
	draw_sprite(spr_jumpbuttons,2+key_cancel,600-30-15,30+10);
	draw_set_alpha(1);
}