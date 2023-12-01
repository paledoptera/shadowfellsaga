if ctrl_global.target_door = door_id
{
	PLAYER.x = x;
	PLAYER.y = y;
	
	if instance_exists(FOLLOWER)
	{
		FOLLOWER.x = x;
		FOLLOWER.y = y;
	}
}

