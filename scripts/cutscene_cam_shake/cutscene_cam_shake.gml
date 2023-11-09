function cutscene_cam_shake(_time,_magnitude,_decay,cam_obj=ctrl_camera){
	///@param duration
	///@param magnitude
	///@param decay
	cam_obj.shaking = true;
	cam_obj.shake_time = _time;
	cam_obj.shake_magnitude = _magnitude;
	cam_obj.shake_decay = _decay;
	cutscene_end_action()
}