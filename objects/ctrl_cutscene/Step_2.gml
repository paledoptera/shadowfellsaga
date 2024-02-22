globaltimer += 1/60;
timer += 1/60;
frame += 1;

action[stage]();


switch (action_info)
{
	case "pause":
		if timer > time_end_action {event_user(0);}
	break;
	case "movement_ext":
		if timer > time_end_action 
		{
			if action_info_extra = CAM {tween_reset_all(CAM);}
			event_user(0);
		}
	break;
	case "movement":
		if 	action_info_extra.x = _value[0] and action_info_extra.y = _value[1] {event_user(0);}
	break;
	case "screenshake":
		if CAM.shaking = false {event_user(0);}
	break;
	case "dialogue":
		if !instance_exists(ctrl_dialogue) {event_user(0);}
	break;
	case "buffer":
		event_user(0);
	break;
}




