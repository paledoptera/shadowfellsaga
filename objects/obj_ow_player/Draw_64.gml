//SETTING BORDER SIZE
if(!ctrl_global.borderEnabled) {display_set_gui_size(global.gui_res_w, global.gui_res_h);}  

// !!! UI IS ONLY VISIBLE IN DARK WORLD !!!
world_flag = flag_get(global.flags,"world")
if world_flag = 1
{
	draw_set_alpha(ui_opacity);
	//tween buttons on/off screen depending on if player is active
	if state = active && input.target="overworld"
	{
		//smooth tween of buttons coming in from the top
		ui_y = 0;
		ui_opacity = 1;
	}
	else
	{
		//smooth tween of buttons coming in from the top
		ui_y = -20;
		ui_opacity = 0;
	}	
	
	
	//little jump animation for the jump arrows
	var jumpmultiplier = (zfloor-z)/10
	if instance_exists(FOLLOWER) var jumpmultiplier2 = (FOLLOWER.zfloor-FOLLOWER.z)/10
	else var jumpmultiplier2 = 0;
	if jumpmultiplier > 2 {jumpmultiplier = 2}
	if jumpmultiplier2 > 2 {jumpmultiplier2 = 2}
		
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
		if obj_interact_sensor.instance_tag_hit == "interact_generic" {draw_sprite(spr_jumpbuttons,7+gui_local_frame,537,ui_y+79);}		
		if obj_interact_sensor.instance_tag_hit == "save_lamp" {draw_sprite(spr_jumpbuttons,10,537,ui_y+79);}
	}
	draw_sprite(spr_jumpbuttons,4,537,ui_y+79); //Z
}

draw_set_alpha(1);
//draw_text(10,10,string(fps));
