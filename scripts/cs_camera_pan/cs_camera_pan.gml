
function cs_camera_pan(){
///@description cs_camera_pan
///@arg x
///@arg y
///@arg relative?
///@arg spd

var relative = argument2, spd = argument3;

CAM.following_target = false;
CS.time_end_action = CS.timer+999;

if(CS.start_action = false)
{	
	CS.start_action = true
	if(!relative) {CS._value[0] = argument0; CS._value[1] = argument1;}
	else {CS._value[0] = CAM.x + argument0; CS._value[1] = CAM.y + argument1;}
}

var xx = CS._value[0]
var yy = CS._value[1]

with(CAM)
{ 
	x = approach(x,xx,spd);
	y = approach(y,yy,spd);
	
	if x = xx and y = yy
	{
		with(CS) {event_user(0);}
	}
}

}