function cs_camera_pan_ext(argument0, argument1, argument2, argument3 = true, argument4 = EaseLinear){
///@description cs_camera_pan_ext
///@arg x
///@arg y
///@arg time_in_seconds
///@arg relative?
///@arg anim_curve

CAM.following_target = false;
if CAM.init = true {cs_move_instance_ext(CAM,argument0,argument1,argument2,argument3,argument4);}
}