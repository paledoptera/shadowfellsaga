
function cs_move_instance(){
///@description cutscene_move_instance
///@arg obj
///@arg x
///@arg y
///@arg relative?
///@arg spd

var obj = argument0, relative = argument3, spd = argument4;

CS.time_end_action = CS.timer+999;

if(CS.start_action = false)
{	
	CS.start_action = true
	if(!relative) {CS._value[0] = argument1; CS._value[1] = argument2;}
	else {CS._value[0] = obj.x + argument1; CS._value[1] = obj.y + argument2;}
}

var xx = CS._value[0]
var yy = CS._value[1]

with(obj)
{ 
	x = approach(x,xx,spd);
	y = approach(y,yy,spd);
	
	if x = xx and y = yy
	{
		with(CS) {event_user(0);}
	}
}

}