function cutscene_object_shake(argument0,argument1,argument2,argument3,argument4 = true,argument5 = false, argument6 = false){
///@description cutscene_object_shake
///@arg object
///@arg shake_amplitude
///@arg shake_frequency
///@arg duration
///@arg x_shake?
///@arg y_shake?
///@arg chaotic_shake?


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

var _dur_ = _dur - timer

if _chaos = false
{
	if _x_sh = true {_obj.draw_x = _obj.x + wave(-_dur_,_dur_,_freq,0);}
	if _y_sh = true {_obj.draw_y = _obj.y + wave(-_dur_,_dur_,_freq,0);}
}
else
{
	randomize();
	if timer mod 2 = 0
	{
		if _x_sh = true {_obj.draw_x = _obj.x + random_range(-_dur_,_dur_)}		
		if _y_sh = true {_obj.draw_y = _obj.y + random_range(-_dur_,_dur_)}				
	}
}

timer++;
if (timer >= _dur) {timer = 0; cutscene_end_action();}
}