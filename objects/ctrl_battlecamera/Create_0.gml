//enable views
view_enabled = true;
view_visible[0] = true;

//create camera
camera = camera_create_view(0,0,RES_W,RES_H);
view_set_camera(0, camera);
clamped = false;

targetX = 320;
targetY = 240;
target_w = 640;
target_h = 480;



//resize window & application surface
if(!obj_gamehandler.borderEnabled){
	window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE);
} else {
	window_set_size(960*RES_SCALE,540*RES_SCALE);	
}
surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);

//camera_set_view_size(camera,800,600);
x = 320;
y = 240;
display_set_gui_size(RES_W, RES_H);