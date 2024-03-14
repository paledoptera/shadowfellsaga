/// @description sets up screen shake

function cs_camera_shake(_time,_magnitude,_decay = 0)
{
/// @description cs_camera_shake
/// @arg duration
/// @arg magnitude
/// @arg decay

if(CS.start_action = false)
{
	CS.action_info = "screenshake"
	CS.start_action = true;
	CS.time_end_action = argument0
	
	CAM.shaking = true;
	CAM.shake_time = _time;
	CAM.shake_magnitude = _magnitude;
	CAM.shake_decay = _decay;
}

}