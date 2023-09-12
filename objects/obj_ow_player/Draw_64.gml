world_flag = flag_get(global.flags,"world")
if world_flag = 1
{
	key_interact = input_key_held(global.key_action);
	key_cancel = input_key_held(global.key_cancel);

	draw_set_alpha(1);
	if active = true 
	{
		var jumpmultiplier = (zfloor-z)/10
		var jumpmultiplier2 = (FOLLOWER.zfloor-FOLLOWER.z)/10
		if jumpmultiplier > 2 {jumpmultiplier = 2}
		if jumpmultiplier2 > 2 {jumpmultiplier2 = 2}
		
		//drawing bkg
		draw_sprite_ext(spr_jumpbuttons_wheel,0,525+30,27+48,1.4,1.35,-20,c_white,0.35);
		//drawing papyrus' buttons
		if global.leadchar = 0 {draw_sprite(spr_jumpbuttons,key_interact,600-90-15+32,5+10+32);}
		else {draw_sprite(spr_jumpbuttons,2+key_interact,600-90-15+32,5+10+32);}
		if mode = 0 {draw_sprite(spr_jumpbuttons,6,600-90-15+32,5+10+32-jumpmultiplier);}
		else if mode = 1
		{
			if gui_local_frame < 1.9 {gui_local_frame += 0.1} else {gui_local_frame = 0}
			if global.leadchar = 0 {draw_sprite(spr_jumpbuttons,7+gui_local_frame,600-90-15+32,5+10+32);}
			else {draw_sprite(spr_jumpbuttons,9,600-90-15+32,5+10+32);}
		}
		draw_sprite(spr_jumpbuttons,4,600-90-15+32,5+10+32);
		//drawing sans' buttons
		if global.leadchar = 0 {draw_sprite(spr_jumpbuttons,2+key_cancel,600-30-15+32,30+10+32);}
		else {draw_sprite(spr_jumpbuttons,key_cancel,600-30-15+32,30+10+32);}
		draw_sprite(spr_jumpbuttons,6,600-30-15+32,30+10+32-jumpmultiplier2);
		draw_sprite(spr_jumpbuttons,5,600-30-15+32,30+10+32);
	}
}