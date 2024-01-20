function cs_camera_pan(argument0, argument1, argument2, argument3){
///@description cs_camera_pan
///@arg x
///@arg y
///@arg spd
///@arg relative?

CAM.following_target = false;
if CAM.init = true {cs_move_instance(CAM,argument0,argument1,argument2,argument3);}
}