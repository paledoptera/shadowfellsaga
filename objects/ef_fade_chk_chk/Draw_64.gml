if !variable_instance_exists(id,"duration") {variable_instance_set(id,"duration",30)}
if buffer > 0
{
	if timer = 0 {audio_play_sound(snd_noise,10,false);}
	
	timer += 1;

	if timer > duration 
	{
		if buffer = 2 
		{
			audio_play_sound(snd_noise,10,false); 
			if instance_exists(ctrl_cutscene) ctrl_cutscene.timer = 2;
			instance_destroy();
		}
		if buffer = 1 {buffer = 2;}
	}

	if(!ctrl_global.borderEnabled){
		display_set_gui_size(640,480)	
	}

	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_rectangle(0,0,640,480,false);
}

draw_set_alpha(1);
draw_set_color(c_white);
if buffer = 0 {buffer = 1;}