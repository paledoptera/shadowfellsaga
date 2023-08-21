function cutscene_wait(){
	///@description cutscene_wait
	///@arg seconds

	timer++;
	if (timer >= argument0 * FRAME_RATE) {timer = 0; cutscene_end_action();}
}