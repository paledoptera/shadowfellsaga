/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_f4))	
window_set_fullscreen(!window_get_fullscreen());

if global.camasp == 0 {
	if global.resolution_index >= 7 {
	camera_set_view_size(0,global.resolution_current.w/4,global.resolution_current.h/4) 
	} else {
	camera_set_view_size(0,global.resolution_current.w,global.resolution_current.h) 
	}
	surface_resize(application_surface, global.window_res_w * RES_SCALE, global.window_res_h * RES_SCALE);
}
if global.camasp== 1{
if global.resolution_index >= 4 {
camera = camera_set_view_size(0,global.resolution_current.w,global.resolution_current.h);		
} else {
camera = camera_set_view_size(0,global.resolution_current.w,global.resolution_current.h);
}
surface_resize(application_surface, global.window_res_w *2* RES_SCALE, global.window_res_h *2* RES_SCALE);
}

//show_debug_message("Window Width: " + string(global.window_res_w)+"\n Window Height: " + string(global.window_res_h) )

