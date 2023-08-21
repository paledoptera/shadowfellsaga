function cutscene_wait_for_dialogue(){
	///@description cutscene_wait_for_dialogue

	global.canusemenu=false;
	timer++;
	if !instance_exists(obj_dialogue) {timer = 0;  cutscene_end_action() ;}
}