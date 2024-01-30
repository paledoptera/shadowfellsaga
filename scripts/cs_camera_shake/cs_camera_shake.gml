/// @description sets up screen shake

function cs_camera_shake(_time,_magnitude,_decay)
{
/// @description cs_camera_shake
/// @arg duration
/// @arg magnitude
/// @arg decay
	with CS {action_info = "screenshake"}
		CAM.shaking = true;
		CAM.shake_time = _time;
		CAM.shake_magnitude = _magnitude;
		CAM.shake_decay = _decay;
}