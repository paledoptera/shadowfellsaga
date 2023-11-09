//----------JUMP CODE--------------
if(live_call()) return live_result;
if(!obj_gamehandler.borderEnabled){
	display_set_gui_size(global.gui_res_w, global.gui_res_h);
}  
world_flag = flag_get(global.flags,"world")
if world_flag = 1
{
	//key_interact = input_key_pressed(global.key_action);;}

	draw_set_alpha(1);
	if active = true  && input.target="overworld"
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
			if global.leadchar = 0 && obj_interact_sensor.instance_tag_hit == "interact_generic" {draw_sprite(spr_jumpbuttons,7+gui_local_frame,600-90-15+32,5+10+32);}
			else if global.leadchar = 1 &&  obj_interact_sensor.instance_tag_hit == "interact_generic"  {draw_sprite(spr_jumpbuttons,9,600-90-15+32,5+10+32);} 			
			switch(global.leadchar){
				case 0:
					draw_sprite(spr_jumpbuttons,10,600-90-15+32,5+10+32);
				break;
				case 1:
					draw_sprite(spr_jumpbuttons,10,600-90-15+32,5+10+32);
				break;
			}
		}
		draw_sprite(spr_jumpbuttons,4,600-90-15+32,5+10+32);
		//drawing sans' buttons
		if global.leadchar = 0 {draw_sprite(spr_jumpbuttons,2+key_cancel,600-30-15+32,30+10+32);}
		else {draw_sprite(spr_jumpbuttons,key_cancel,600-30-15+32,30+10+32);}
		draw_sprite(spr_jumpbuttons,6,600-30-15+32,30+10+32-jumpmultiplier2);
		draw_sprite(spr_jumpbuttons,5,600-30-15+32,30+10+32);
	}
}

//draw_text(10,10,string(fps));
