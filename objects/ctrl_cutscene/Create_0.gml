globaltimer = 0;
timer = 0;
frame = 0;
time_end_action = 1;
start_action = false;

_value[0] = -1; //this usually correlates to the X of an object
_value[1] = -1; //this usually correlates to the Y of an object
_value[2] = -1; //this usually correlates to the speed of an object
_value[3] = -1;
_value[4] = -1;
_value[5] = -1;
_value[6] = -1;
_value[7] = -1;
_value[8] = -1;
_value[9] = -1;

stored_dialogue = 0;
stored_dialogue_start = 0;

action_info = "";
action_info_extra = -1;
action_info_extra_1 = -1;
paused = false;

stage = 0;
stage_end = 0;

var _papactor = instance_create(PLAYER.x,PLAYER.y,actor_papyrus);
PLAYER.x = -200;
PLAYER.y = -200;

if instance_exists(FOLLOWER)
{
	var _sansactor = instance_create(FOLLOWER.x,FOLLOWER.y,actor_sans);
	FOLLOWER.x = -200;
	FOLLOWER.y = -200;
}

