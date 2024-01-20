
function cs_move_instance(argument0,argument1,argument2,argument3,argument4 = true){
///@description cs_move_instance
///@arg obj
///@arg x
///@arg y
///@arg spd
///@arg relative?

var obj = argument0, spd = argument3, relative = argument4;

CS.action_info = "movement"
CS.action_info_extra = obj;

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
	if spd = -1 {x = xx; y = yy;}
}

}