globaltimer += 1/60;
timer += 1/60;

action[stage]();


switch (action_info)
{
	case "pause":
		if timer > time_end_action {event_user(0);}
	break;
	case "movement":
		if 	action_info_extra.x = _value[0] and action_info_extra.y = _value[1] {event_user(0);}
	break;
}



