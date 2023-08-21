if !variable_instance_exists(self,"persistant") {persistant = false}

if place_meeting(x,y,obj_ow_player)
{
	create_cutscene_passive(scene_info);
	if persistant = false {instance_destroy();}
}