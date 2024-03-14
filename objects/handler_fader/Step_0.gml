switch state 
{
	case "fade":
		alpha = tween(time_in_seconds,start_alpha,end_alpha,false,0,anim_curve);
	break;
	
	case "hardcut":
		
		if hardcut_timer = 0 and hardcut_waiting = false 
		{
			alpha = 1; 
			audio_play_sound(snd_noise,10,false);
			hardcut_waiting = true;
		}
		
		if hardcut_waiting = true
		{
			hardcut_timer = tween(time_in_seconds,0,1,false,0);
		}
		
		if hardcut_timer = 1 and hardcut_waiting = true
		{
			alpha = 0; 
			audio_play_sound(snd_noise,10,false);
			hardcut_waiting = false;
		}
		
	break;
}

if round_to_tenths = true {final_alpha = round(alpha*10)/10;}
else {final_alpha = alpha;}	