//enable views
view_enabled = true;
view_visible[0] = true;

//create camera
if global.camasp == 0 {
	if global.resolution_index >= 7 {
	camera = camera_create_view(0,0,global.resolution_current.w/4,global.resolution_current.h/4);		
	} else {
	camera = camera_create_view(0,0,global.resolution_current.w-640,global.resolution_current.h-480);
	}
} else {
	if global.resolution_index >= 4 {
	camera = camera_create_view(0,0,global.resolution_current.w/4,global.resolution_current.h/4);		
	} else {
	camera = camera_create_view(0,0,global.resolution_current.w,global.resolution_current.h);
	}

}
view_set_camera(0, camera);
target= obj_ow_player
zoom = 0;
clamped = false;

zoffset = 0;

camera_state  = cameraStates.FOLLOW;

hold_x = 0;
hold_y = 0;

enum cameraStates {
	HOLD,
	FOLLOW,
	CENTER,
	DISABLE,	
}

/// SHAKE VARIABLES
shake_magnitude = 0; // How far the screen shakes
shake_time  = 0; // The length of the shake
shake_decay = 0; // How fast shake ends

shaking = true; // Is the camera shaking?
// end shake variables

//resize window & application surface
if(!ctrl_global.borderEnabled){
	window_set_size(global.resolution_current.w * RES_SCALE, global.resolution_current.h * RES_SCALE);
} 
surface_resize(application_surface, global.window_res_w * RES_SCALE, global.window_res_h * RES_SCALE);

display_set_gui_size(RES_W, RES_H);