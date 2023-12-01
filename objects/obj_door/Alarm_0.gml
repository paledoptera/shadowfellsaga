global.activeLandmark = target_door;
if instance_exists(PLAYER) {
	
	ctrl_global.target_door = target_door;
	
	var sdir = "down"
	if player_dir == -1{
		sdir =	PLAYER.dir;
	} else {
		sdir =player_dir;	
	}
	global.playerWarpDir = sdir;
}
room_goto(target_room)
global.currentroom = room 
ef_fader_generic.color = fade_out_color
fader_fade(-1,0,fade_out_time)