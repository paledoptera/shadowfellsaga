//							/////////////////////////////////////////////////
//									------------ CAMERA CORRECTION ------------
//							/////////////////////////////////////////////////

function cs_cam_center(cam_obj=ctrl_camera)
{
	with(cam_obj) {camera_state=cameraStates.CENTER;}
	cutscene_end_action()
}
function cs_cam_hold(cam_obj=ctrl_camera)
{
	with(cam_obj) {camera_state=cameraStates.HOLD;}
	cutscene_end_action()
}

//							/////////////////////////////////////////////////
//									------------ CAMERA EFFECTS ------------
//							/////////////////////////////////////////////////

function cs_cam_shake(_time,_magnitude,_decay,cam_obj=ctrl_camera)
{
	///@param duration
	///@param magnitude
	///@param decay
	cam_obj.shaking = true;
	cam_obj.shake_time = _time;
	cam_obj.shake_magnitude = _magnitude;
	cam_obj.shake_decay = _decay;
	cutscene_end_action()
}

function cs_cam_zoom()
{
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

//							/////////////////////////////////////////////////
//									------------ CAMERA MOVEMENT ------------
//							/////////////////////////////////////////////////


//note to self: the code below is fucking hurrendous and should be cleaned up
//camera revamp soon maybe? mostly for battle, that camera is kinda messed up
function cutscene_move_camera()
{
	///@description cutscene_move_camera
	///@arg x
	///@arg y
	///@arg relative?
	///@arg spd

	var relative = argument2, spd = argument3;

	if(!player_is_in_battle()){
		if(x_dest == -1){if(!relative){x_dest = argument0; y_dest = argument1;}
			else {x_dest = ctrl_camera.x + argument0; y_dest = ctrl_camera.y + argument1;}}
		var xx = x_dest;
		var yy = y_dest;

		with(ctrl_camera)
		{ 
			if(point_distance(x,y,xx,yy) >= spd)
			{
				var dir = point_direction(x,y,xx,yy);
				var ldirx = lengthdir_x(spd,dir);
				var ldiry = lengthdir_y(spd,dir);
				inputdirection = point_direction(x,y,xx,yy); 
				inputmagnitude = 2;
				x += ldirx;
				y += ldiry;

			}
			else
			{
				x = xx;
				y = yy;
				inputmagnitude = 0;
				with(other) {x_dest = -1; y_dest = -1; cutscene_end_action();}
			}
		}
} else if(player_is_in_battle()){
		if(x_dest == -1){if(!relative){x_dest = argument0; y_dest = argument1;}
			else {x_dest = ctrl_battlecamera.x + argument0; y_dest = ctrl_battlecamera.y + argument1;}}
		var xx = x_dest;
		var yy = y_dest;

		with(ctrl_battlecamera)
		{ 
			if(point_distance(x,y,xx,yy) >= spd)
			{
				var dir = point_direction(x,y,xx,yy);
				var ldirx = lengthdir_x(spd,dir);
				var ldiry = lengthdir_y(spd,dir);
				inputdirection = point_direction(x,y,xx,yy); 
				inputmagnitude = 2;
				x += ldirx;
				y += ldiry;

			}
			else
			{
				x = xx;
				y = yy;
				inputmagnitude = 0;
				with(other) {x_dest = -1; y_dest = -1; cutscene_end_action();}
			}
		}
}


}