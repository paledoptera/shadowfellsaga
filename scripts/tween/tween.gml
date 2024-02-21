// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tween(anim_curve = "linear", time_in_seconds, var_start_value, var_end_value, relative = false, loops = false, tween_id = 0)
{
	/// @description tween
	/// @arg anim_curve
	/// @arg time_in_seconds
	/// @arg var_start_value
	/// @arg var_end_value
	/// @arg relative
	/// @arg loops?
	/// @arg tween_id
	
	if !variable_instance_exists(self,"_tween") {_tween = array_create(20,0)}
	
	var curve = animcurve_get_channel(anc_easings,anim_curve);
	var pos = animcurve_channel_evaluate(curve,_tween[tween_id]);
	var distance = var_end_value - var_start_value;
	
	if pos = 1 
	{
		if loops {tween_id = 0;}
		else {return (var_start_value + (distance * 1));}
	}
	else if pos < 1
	{
		var time_incr = ((1/60)/(time_in_seconds));

		_tween[tween_id] += time_incr
		if (_tween[tween_id] > 1) {_tween[tween_id] = 1;}
		return (var_start_value + (distance * pos));
	}
}

function tween_setup(number = 20)
{
	/// @description tween_setup
	/// @arg array_length
	if !variable_instance_exists(self,"_tween") {_tween = array_create(number,0)}
}

function tween_reset(tween_id)
{
	/// @description tween_reset
	/// @arg tween_id
	if !variable_instance_exists(self,"_tween") {_tween = array_create(20,0)}
	else {_tween[tween_id] = 0;}
}

function tween_reset_all()
{
	if !variable_instance_exists(self,"_tween") {_tween = array_create(20,0)}
	
	for (i=0;i<(array_length(_tween)+1);i++)
	{
		_tween[i] = 0;
	}
}