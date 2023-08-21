//enable views
view_enabled = true;
view_visible[0] = true;

//create camera
camera = camera_create_view(0,0,RES_W,RES_H);
view_set_camera(0, camera);
target = obj_ow_player
zoom = 0;
clamped = false;

zoffset = 0;

//resize window & application surface
if(!obj_gamehandler.borderEnabled){
	window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE);
} else {
	window_set_size(960*RES_SCALE,540*RES_SCALE);	
}
surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);

display_set_gui_size(RES_W, RES_H);