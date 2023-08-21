//get current camera position
var camX = camera_get_view_x(camera);
var camY = camera_get_view_y(camera);
var camW = camera_get_view_width(camera);
var camH = camera_get_view_height(camera);


//smoooth shmoovin
camW += round((target_w-camW)/10);
camH += round((target_h-camH)/10);
camX = x - camW/2;
camY = y - camH/2;

//apply cam position
camera_set_view_pos(camera,camX,camY);
camera_set_view_size(camera,camW,camH);