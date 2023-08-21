function cutscene_end(){
	if instance_exists(obj_ow_player) 
	{
		PLAYER.active = true; 
		PLAYER.image_speed = 1;
		if instance_exists(FOLLOWER){
			var count = FOLLOWER.record
		}
		var reversecount = 0;
		
		if instance_exists(FOLLOWER){
			for (i=count;i>-1;i--)
			{
				PLAYER.pos_x[i] = FOLLOWER.x + (((PLAYER.x - FOLLOWER.x)/count)*reversecount)
				PLAYER.pos_y[i] = FOLLOWER.y + (((PLAYER.y - FOLLOWER.y)/count)*reversecount)
				PLAYER.pos_run[0] = 0;
				reversecount += 1;
			}
		}
		
	}
	
	if instance_exists(FOLLOWER) {FOLLOWER.image_speed = 1;}
	instance_destroy(ctrl_cutscene);
	instance_destroy(ctrl_cutscene_passive);
}