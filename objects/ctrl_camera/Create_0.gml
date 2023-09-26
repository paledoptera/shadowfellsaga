//enable views
view_enabled = true;
view_visible[0] = true;

//create camera
if global.resolution_index >= 4 {
camera = camera_create_view(0,0,global.resolution_current.w/4,global.resolution_current.h/4);		
} else {
camera = camera_create_view(0,0,global.resolution_current.w/2,global.resolution_current.h/2);
}
view_set_camera(0, camera);
target= obj_ow_player
zoom = 0;
clamped = false;

zoffset = 0;

//resize window & application surface
if(!obj_gamehandler.borderEnabled){
	window_set_size(global.resolution_current.w * RES_SCALE, global.resolution_current.h * RES_SCALE);
} else {
	window_set_size(global.resolution_current.w*RES_SCALE,global.resolution_current.w*RES_SCALE);	
}
surface_resize(application_surface, global.window_res_w * RES_SCALE, global.window_res_h * RES_SCALE);

display_set_gui_size(RES_W, RES_H);