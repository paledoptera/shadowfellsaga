if !variable_instance_exists(self,"persistant") {persistant = false}

if place_meeting(x,y,obj_ow_player) and cutscene_triggered = false
{
	cs_start(cutscene);
	cutscene_triggered = true;
	if persistant = false {instance_destroy();}
}

