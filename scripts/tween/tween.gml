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
	
	if !instance_exists(handler_tweens) {instance_create(0,0,handler_tweens);}
	
	var curve = animcurve_get_channel(anc_easings,anim_curve);
	var pos = animcurve_channel_evaluate(curve,handler_tweens.tween_id[tween_id]);
	if pos = 1 and loops {pos = 0;}
	var distance = var_end_value - var_start_value;
	
	if pos < 1
	{
		var time_incr = ((1/60)/(time_in_seconds*2));

		handler_tweens.tween_id[tween_id] += time_incr
		if (handler_tweens.tween_id[tween_id] > 1) {handler_tweens.tween_id[tween_id] = 1}
	}

	return (var_start_value + (distance * pos));

}