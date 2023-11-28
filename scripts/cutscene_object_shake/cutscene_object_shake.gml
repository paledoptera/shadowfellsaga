function cutscene_object_shake(argument0,argument1,argument2,argument3,argument4 = true,argument5 = false, argument6 = false, argument7 = "_draw_x", argument8 = "_draw_y"){
///@description cutscene_object_shake
///@arg object
///@arg shake_amplitude
///@arg shake_frequency
///@arg duration
///@arg x_shake?
///@arg y_shake?
///@arg chaotic_shake?
///@arg _draw_x_variable
///@arg _draw_y_variable


//NOTICE: this will ONLY work in objects with "draw_x" and "draw_y" variables.
//The list of objects with this variable is small:
//	- obj_ow_object
//  - obj_ow_object_temp
//  - obj_ow_object_temp2
//  - obj_cutscene_prop


var _obj = argument0;
var _amp = argument1;
var _freq = argument2;
var _dur = argument3 * FRAME_RATE;
var _x_sh = argument4;
var _y_sh = argument5;
var _chaos = argument6;
var _draw_x_var = argument7;
var _draw_y_var = argument8;

var _amp_dur = ((_dur - timer)/_dur)*_amp

if _chaos = false
{
	if _x_sh = true {variable_instance_set(_obj,_draw_x_var,round((_obj.x + wave(-_amp_dur,_amp_dur,_freq,0))/3)*3);}
	if _y_sh = true {variable_instance_set(_obj,_draw_y_var,round((_obj.y + wave(-_amp_dur,_amp_dur,_freq,0))/3)*3);}
}
else
{
	randomize();
	if timer mod 2 = 0
	{
		if _x_sh = true {variable_instance_set(_obj,_draw_x_var,round(_obj.x + random_range(-_dur_,_dur_)))};
		if _y_sh = true {variable_instance_set(_obj,_draw_y_var,round(_obj.y + random_range(-_dur_,_dur_)))}				
	}
}

timer++;
if (timer >= _dur) 
{
	variable_instance_set(_obj,_draw_x_var,_obj.x)
	variable_instance_set(_obj,_draw_y_var,_obj.y)
	timer = 0; 
	cutscene_end_action();
}
}