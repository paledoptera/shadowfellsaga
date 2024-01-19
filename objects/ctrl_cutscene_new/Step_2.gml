globaltimer += 1/60;
timer += 1/60;

if stage > stage_end {instance_destroy();}
else action[stage]();

if timer > time_end_action {stage += 1}


