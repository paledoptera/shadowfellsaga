function cutscene_wait(){
	///@description cutscene_wait
	///@arg seconds

	timer++;
	if (timer >= argument0 * FRAME_RATE) {timer = 0; cutscene_end_action();}
}

function cutscene_wait_frames(){
	///@description cutscene_wait_frames
	///@arg frames

	timer++;
	if (timer >= argument0) {timer = 0; cutscene_end_action();}
}
