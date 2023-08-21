function cutscene_end_and_change_room()
{
	///@description cutscene_end_and_change_room
	///@arg room
	
	if instance_exists(obj_ow_player) {obj_ow_player.active = true; obj_ow_player.image_speed = 1;}
	if instance_exists(obj_ow_p_follower) {obj_ow_p_follower.image_speed = 1;}
	
	room = argument0;
	
	instance_destroy(ctrl_cutscene);
	instance_destroy(ctrl_cutscene_passive);
}