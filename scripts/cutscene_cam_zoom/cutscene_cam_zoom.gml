// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cutscene_cam_zoom(){
///@description cutscene_cam_zoom
///@arg	factor
///@arg relative?
///@arg time

var factor = argument0
var relative = argument1;

var obj = ctrl_camera;

if(player_is_in_battle()) { obj = ctrl_battlecamera };

var targ_width = global.window_res_w/factor;
var targ_height = global.window_res_h/factor;

if zooming = false
{
	zooming = true;
	timer = 0;
	//figuring out spd
	zoom_time = argument2
	zoom_spd_w = (global.window_res_w-targ_width)/zoom_time
	zoom_spd_y = (global.window_res_h-targ_height)/zoom_time
}





with(obj)
{
	other.timer += 1;
	var camW = camera_get_view_width(camera);
	var camH = camera_get_view_height(camera);
	
	camW = approach(camW, targ_width, other.zoom_spd_w);
	camH = approach(camH, targ_height, other.zoom_spd_y);
	
	camera_set_view_size(camera,camW,camH);
	
	if other.timer = other.zoom_time or other.timer > other.zoom_time 
	{
		camera_set_view_size(camera,targ_width,targ_height);
		other.timer = 0;
		other.zoom_time = 0;
		other.zoom_spd_w = 0;
		other.zoom_spd_y = 0;
		other.zooming = false;
		with(other) {cutscene_end_action();}
	}
}

}