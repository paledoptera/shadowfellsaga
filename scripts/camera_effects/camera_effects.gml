/// @description sets up screen shake
/// @function camera_screenshake()
/// @param duration
/// @param magnitude
/// @param decay
function camera_screenshake(_time,_magnitude,_decay,cam_obj=ctrl_camera)
{
		cam_obj.shaking = true;
		cam_obj.shake_time = _time;
		cam_obj.shake_magnitude = _magnitude;
		cam_obj.shake_decay = _decay;
}