function cutscene_chk_chk(){
///@description cutscene_instance_create
///@arg duration
var inst = instance_create_layer(0, 0, "Instances", ef_fade_chk_chk)
inst.duration = (argument0 * FRAME_RATE)

cutscene_end_action();

return inst;
}




function cutscene_wait_for_chk_chk(){
	///@description cutscene_wait_for_chk_chk

	global.canusemenu=false;
	timer++;
	if !instance_exists(ef_fade_chk_chk) {timer = 0;  cutscene_end_action() ;}
}