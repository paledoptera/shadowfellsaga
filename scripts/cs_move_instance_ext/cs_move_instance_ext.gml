function cs_move_instance_ext(argument0,argument1,argument2,argument3,argument4 = true,argument5 = "linear"){
///@description cs_move_instance_ext
///@arg obj
///@arg x
///@arg y
///@arg time_in_seconds
///@arg relative?
///@arg anim_curve

var obj = argument0, time_in_seconds = argument3, relative = argument4, anim_curve = argument5;

CS.action_info = "movement"
CS.action_info_extra = obj;

if(CS.start_action = false)
{	
	CS.start_action = true
	if(!relative) {CS._value[0] = argument1; CS._value[1] = argument2;}
	else {CS._value[0] = obj.x + argument1; CS._value[1] = obj.y + argument2;}
}

var xx = CS._value[0];
var yy = CS._value[1];

with(obj)
{ 
	/*tween1 = TweenFire(obj,anim_curve,TWEEN_MODE_ONCE,true,0,time_in_seconds,"x", x, xx);
	tween2 = TweenFire(obj,anim_curve,TWEEN_MODE_ONCE,true,0,time_in_seconds,"y", y, xx);*/
}

}