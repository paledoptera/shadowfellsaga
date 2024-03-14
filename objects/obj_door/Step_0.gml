///@desc Trigger
if(place_meeting(x,y,PLAYER)){
	if room_exists(target_room){
		handler_fader.color=fade_in_color;
		fader_fade(-1,1,fade_in_time);
		alarm[0]=fade_in_time+warp_wait+1;
	}
}
