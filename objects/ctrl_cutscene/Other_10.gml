/// @description Refresh Actions
timer = 0;
time_end_action = 1;
frame = 0;

start_action = false;
action_info = "";
action_info_extra = -1;
action_info_extra_1 = -1;


stage += 1
if stage > stage_end 
{
	actor_papyrus.direction = 270;
	PLAYER.x = actor_papyrus.x;
	PLAYER.y = actor_papyrus.y;
	PLAYER.direction = 270;
	
	if instance_exists(FOLLOWER)
	{
		actor_sans.direction = 270;
		FOLLOWER.x = actor_sans.x;
		FOLLOWER.y = actor_sans.y;
		FOLLOWER.direction = 270;
	}
	
	instance_destroy();
}

for (i=0;i<10;i++) {_value[i] = -1;}