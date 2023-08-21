/// @description Done
if (done)
{
	if playerExists and !instance_exists(ctrl_cutscene) {PLAYER.active = true; PLAYER.image_speed = 1;}
	if followerExists and !instance_exists(ctrl_cutscene) {FOLLOWER.image_speed = 1;}
	with(obj_dialog_holder){dialogCount+=1;};
	with(obj_speech_bubble){instance_destroy();};
	instance_destroy();
}
input = input_key_pressed(global.key_action);