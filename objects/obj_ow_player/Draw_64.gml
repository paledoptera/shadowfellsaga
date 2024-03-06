if (live_call()) return live_result;

// !!! UI IS ONLY VISIBLE IN DARK WORLD !!!
world_flag = flag_get(global.flags,"world")
if world_flag = 1
{
	draw_set_alpha(ui_opacity);
	//tween buttons on/off screen depending on if player is active
	if ui_visible = true
	{
		tween_reset(11);
		tween_reset(12);
		//smooth tween of buttons coming in from the top
		ui_y = tween(1,-20,0,false,1,"cubicInOut");
		ui_opacity = tween(1,0,1,false,2,"cubicInOut");
	}
	else
	{
		tween_reset(1);
		tween_reset(2);
		//checking if ui isn't already hidden
		if ui_y != -20
		{	
			//smooth tween of buttons going up from the bottom
			ui_y = tween(1,0,-20,false,11,"cubicInOut");
			ui_opacity = tween(1,1,0,false,12,"cubicInOut");
		}
		

	}	
	

	//draw_sprite_ext(spr_jumpbuttons,2+input.cancel,537,ui_y+14,1,1,0,c_white,ui_opacity/2);
	//POTENTIAL SEMI BUTTON????
	
	
	//little jump animation for the jump arrows
	var jumpmultiplier = (zfloor-z)/10
	if instance_exists(FOLLOWER) var jumpmultiplier2 = (FOLLOWER.zfloor-FOLLOWER.z)/10
	else var jumpmultiplier2 = 0;
	if jumpmultiplier > 4 {jumpmultiplier = 4}
	if jumpmultiplier2 > 4 {jumpmultiplier2 = 4}
		
	//drawing bkg
	draw_sprite_ext(spr_jumpbuttons_bkg,0,525+30+4,ui_y+27+48+4,1,1,0,c_white,ui_opacity);
	
	
	//drawing sans' buttons
	draw_sprite(spr_jumpbuttons,2+input.cancel,585,ui_y+47);
	draw_sprite(spr_jumpbuttons,6,585,ui_y+49-jumpmultiplier2);
	draw_sprite(spr_jumpbuttons,5,585,ui_y+47); //X
	
	//drawing papyrus' buttons
	draw_sprite(spr_jumpbuttons,input.interact,537,ui_y+79);
	if interact_mode = 0 {draw_sprite(spr_jumpbuttons,6,537,ui_y+79-jumpmultiplier);} //jump icon
	else if interact_mode = 1 //interact icons
	{
		if gui_local_frame < 1.9 {gui_local_frame += 0.1} else {gui_local_frame = 0}
		if obj_interact_sensor.instance_tag_hit == "interact_generic" {draw_sprite(spr_jumpbuttons,7+gui_local_frame,537,ui_y+79-4);}		
		if obj_interact_sensor.instance_tag_hit == "save_lamp" {draw_sprite(spr_jumpbuttons,10,537,ui_y+79-4);}
	}
	draw_sprite(spr_jumpbuttons,4,537,ui_y+79); //Z
}

draw_set_alpha(1);
