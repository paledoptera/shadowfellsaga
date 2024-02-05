if (live_call()) return live_result;

//setting stage shit
//STAGE 0 - START OF CUTSCENE
if stage = 0 {/*do nothing*/}
//STAGE 1 - PAPYRUS STARTS TALKING
if stage = 1 
{
	if instance_exists(ctrl_dialogue) image_index = base_frame+ctrl_dialogue.facetimer
	else {image_index = base_frame; image_index_end = base_frame;}
	image_index_start = base_frame;
	image_index_end = base_frame+1;
	image_speed = 0;
}
//STAGE 2 - PAPYRUS GETS UP
if stage = 2
{
	image_index_start = 2;
	image_index_end = 2;
	image_speed = 0;
	//EXTRA SPRITE 1
	image_index_start_1 = 0
	image_index_end_1 = 6;
	animation_loops_1 = false;
	image_speed_1 = 1;
}
//STAGE 3 - PAPYRUS PUTS ON FOOT
if stage = 3
{
	base_frame = 8;
	if instance_exists(ctrl_dialogue) image_index = base_frame+ctrl_dialogue.facetimer
	else {image_index = base_frame; image_index_end = base_frame;}
	image_index_start = base_frame;
	image_index_end = base_frame+1;
	image_speed = 0;
	//EXTRA SPRITE 1
	image_index_start_1 = 7;
	image_index_end_1 = 8;
	image_speed_1 = 0.6;
	animation_loops_1 = true;
}
//STAGE 4 - PAPYRUS PUTS ON HAND
if stage = 4
{
	if instance_exists(ctrl_dialogue) image_index = base_frame+ctrl_dialogue.facetimer
	else {image_index = base_frame; image_index_end = base_frame;}
	image_index_start = base_frame;
	image_index_end = base_frame+1;
	//EXTRA SPRITE 1
	image_index_start_1 = 9;
	image_index_end_1 = 10;
}
//STAGE 5 - PAPYRUS MONOLOGUES AFTER PUTTING ON HAND
if stage = 5
{
	if instance_exists(ctrl_dialogue) image_index = base_frame+ctrl_dialogue.facetimer
	else {image_index = base_frame; image_index_end = base_frame;}
	image_index_start = base_frame;
	image_index_end = base_frame+1;
	//EXTRA SPRITE 1
	image_index_start_1 = 11;
	image_index_end_1 = 11;
	image_speed_1 = 0;
	animation_loops_1 = false;
}
//STAGE 6 - PAPYRUS VERY SLIGHTLY WALKS TOWARDS HEAD
if stage = 6
{
	//EXTRA SPRITE 1
	image_index_start_1 = 12;
	image_index_end_1 = 12;
	image_speed_1 = 0;
	animation_loops_1 = false;
	execute_tween(id, "_draw_x_1", 170, "easeInOut", 0.07);
}
//STAGE 7 - PAPYRUS PICKS UP HEAD
if stage = 7
{
	image_index = 16;
	image_index_start = 16;
	image_index_end = 16;
	image_speed = 0;
	animation_loops = false;
	//EXTRA SPRITE 1
	_draw_x_1 = x;
	image_index_start_1 = 13;
	image_index_end_1 = 15;
	if instance_exists(ctrl_dialogue) image_speed_1 = 1;
	animation_loops_1 = false;
}
//STAGE 8 - PAPYRUS TALKING HEAD
if stage = 8
{
	//EXTRA SPRITE 1
	if instance_exists(ctrl_dialogue) image_index_1 = base_frame+ctrl_dialogue.facetimer
	else {image_index_1 = base_frame; image_index_end_1 = base_frame;}
	image_index_start_1 = base_frame;
	image_index_end_1 = base_frame+1;
}
//STAGE 9 - PAPYRUS PUTS ON HEAD
if stage = 9
{
	//EXTRA SPRITE 1
	image_index_start_1 = 20;
	image_index_end_1 = 24;
	image_speed_1 = 1;
	animation_loops_1 = false;
}
//STAGE 10 - PAPYRUS LOOKS DOWN AT CLOTHES
if stage = 10
{
	//EXTRA SPRITE 1
	image_index_start_1 = 25;
	image_index_end_1 = 25;
	image_speed_1 = 0;
	animation_loops_1 = false;
}
//STAGE 11 - PAPYRUS IS SUSPICIOUS
if stage = 11
{
	//EXTRA SPRITE 1
	if instance_exists(ctrl_dialogue) image_index_1 = base_frame+ctrl_dialogue.facetimer
	else {image_index_1 = base_frame; image_index_end_1 = base_frame;}
	image_index_start_1 = base_frame;
	image_index_end_1 = base_frame+1;
}
//STAGE 12 - PAPYRUS WALKS OFF
if stage = 12
{
	//EXTRA SPRITE 1
	image_index_start_1 = 31;
	image_index_end_1 = 36;
	image_speed_1 = 1;
	animation_loops_1 = false;
}
//STAGE 13 - PAPYRUS FINDS HAT
if stage = 13
{
	//EXTRA SPRITE 1
	if instance_exists(ctrl_dialogue) image_index_1 = base_frame+ctrl_dialogue.facetimer
	else {image_index_1 = base_frame; image_index_end_1 = base_frame;}
	image_index_start_1 = base_frame;
	image_index_end_1 = base_frame+1;
	image_speed_1 = 0;
}
//STAGE 14 - PAPYRUS PUTS ON HAT
if stage = 14
{
	image_alpha = 0;
	//EXTRA SPRITE 1
	if !instance_exists(ef_fade_chk_chk) image_speed_1 = 1;
	image_index_start_1 = 39;
	image_index_end_1 = 42;
	animation_loops_1 = false;
}
//STAGE 15 - PAPYRUS BASKING IN GLORY
if stage = 15
{
	//EXTRA SPRITE 1
	image_speed_1 = 1;
	image_index_start_1 = 43;
	image_index_end_1 = 46;
	animation_loops_1 = true;
}






//START
if stage_last != stage {stage_last = stage; start = false;}
if start = false {start = true; image_index = image_index_start; image_index_1 = image_index_start_1;}

if floor(image_index) > image_index_end and image_index_end != -1 {if animation_loops = false {image_speed = 0; image_index = image_index_end;} else image_index = image_index_start;}

//essentially what we have here is one object with two sprites, with both of those sprites having their own variables.
//this can be expanded upon even further, with three or more sprites appearing in one object by adding
//another set of variables like this.
//ie: image_index_2, image_index_3...
image_index_1 += (sprite_get_speed(sprite_index_1) / FRAME_RATE) * image_speed_1; //progress animation according to image speed of sprite
if animation_loops_1 = false {if image_index_1 > image_index_end_1 and image_index_end_1 != -1 {image_speed_1 = 0; image_index_1 = image_index_end_1;}}
else {image_index_1 = wrap(image_index_1,image_index_start_1,image_index_end_1+0.99);}