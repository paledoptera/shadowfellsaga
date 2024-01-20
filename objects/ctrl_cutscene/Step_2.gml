globaltimer += 1/60;
timer += 1/60;

action[stage]();

if timer > time_end_action {event_user(0);}


