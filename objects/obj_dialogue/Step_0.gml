/// @description Done
if (done)
{
	if playerExists and !instance_exists(ctrl_cutscene) {PLAYER.active = true; PLAYER.image_speed = 1;}
	if followerExists and !instance_exists(ctrl_cutscene) {FOLLOWER.image_speed = 1;}
	instance_destroy();
}

_input = input.interact_pressed;