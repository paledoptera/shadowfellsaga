function cs_camera_pan(argument0, argument1, argument2, argument3 = true, argument4 = false){
///@description cs_camera_pan
///@arg x
///@arg y
///@arg spd
///@arg relative?
///@arg clamp?

CAM.following_target = false;

var _target_cam_x = argument0
var _target_cam_y = argument1

if argument4 = true
{
	_target_cam_x = clamp(_target_cam_x,320,room_width-320);
	_target_cam_y = clamp(_target_cam_y,240,room_height-240);
}

if CAM.init = true {cs_move_instance(CAM,_target_cam_x,_target_cam_y,argument2,argument3);}

}