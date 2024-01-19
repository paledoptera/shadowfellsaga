//enable views
view_enabled = true;
view_visible[0] = true;

//create camera
camera = camera_create_view(0,0,global.resolution_current.w/2,global.resolution_current.h/2);		
view_set_camera(0, camera);

following_target = true;
target = obj_ow_player
zoom = 0;
clamped = false;
init = false;

zoffset = 0;

/// SHAKE VARIABLES
shake_magnitude = 0; // How far the screen shakes
shake_time  = 0; // The length of the shake
shake_decay = 0; // How fast shake ends
shaking = false; // Is the camera shaking?

//resize window & application surface
if(!ctrl_global.borderEnabled){
	window_set_size(global.resolution_current.w * RES_SCALE, global.resolution_current.h * RES_SCALE);
} 
surface_resize(application_surface, global.window_res_w * RES_SCALE, global.window_res_h * RES_SCALE);

display_set_gui_size(RES_W, RES_H);