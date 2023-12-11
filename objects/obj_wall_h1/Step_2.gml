if place_meeting(x,y,obj_platformrange)
{
	if floor(PLAYER.z) < -height
	{
		if instance_exists(_inst_spawn) {instance_destroy(_inst_spawn)}
		walkable = true; wallspawn = false;
	}
	else 
	{	
		if wallspawn = false {spawn_walls();}
		wallspawn = true; walkable = false;
	}
	if floor(FOLLOWER.z) < -height
	{
		if instance_exists(_inst_spawn_fol) {instance_destroy(_inst_spawn_fol)}
		fol_walkable = true; fol_wallspawn = false;
	}
	else 
	{	
		if fol_wallspawn = false {spawn_fol_walls();}
		fol_wallspawn = true; fol_walkable = false;
	}
}



