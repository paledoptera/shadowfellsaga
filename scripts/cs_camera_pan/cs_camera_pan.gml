function cs_camera_pan(argument0,argument1,argument2,argument3 = true,argument4 = "linear")
{
///@description cs_camera_pan(x,y,speed,relative,animcurve)
///@arg x
///@arg y
///@arg speed
///@arg relative

timer_end_action = timer+1

//calculating variables
var spd = argument2;
var relative = argument3;
var tween = false;
if argument4 != "linear" tween = true;

//calculating speed


//setting up destination
if(stored_value[0] == -1)
{
	if(!relative){stored_value[0] = argument0; stored_value[1] = argument1;}
	else {stored_value[0] = ctrl_camera.x + argument0; stored_value[1] = ctrl_camera.y + argument1;}}
}


var xx = stored_value[0];
var yy = stored_value[1];

//panning the camera
with(ctrl_camera)
{ 
	if(point_distance(x,y,xx,yy) >= spd)
	{
		var dir = point_direction(x,y,xx,yy);
		var ldirx = lengthdir_x(spd,dir);
		var ldiry = lengthdir_y(spd,dir);
		x += ldirx;
		y += ldiry;
	}
	else
	{
		x = xx;
		y = yy;
		with(other) {x_dest = -1; y_dest = -1;}
	}
}

}