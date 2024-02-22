// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tween(time_in_seconds, var_start_value, var_end_value, loops = false, tween_id = 0, anim_curve = "linear")
{
	/// @description tween
	/// @arg time_in_seconds
	/// @arg var_start_value
	/// @arg var_end_value
	/// @arg loops?
	/// @arg tween_id
	/// @arg anim_curve
		
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

function tween_obj_movement(obj, time_in_seconds, start_x, end_x, start_y, end_y, relative = true, tween_id_1 = 0, tween_id_2 = 1, anim_curve = "linear") 
{
	with obj
	{
		//MAKING SURE TWEEN IS INITIALIZED
		var _tween_init = true
		if !variable_instance_exists(self,"_tween_start_x") 
		{
			_tween_init = false
		}
		else
		{
			if _tween_start_x = -1
			{
				_tween_init = false
			}
		}
		
		//SETTING TWEEN START AND END X & Ys
		if _tween_init = false
		{
			if relative = true
			{
				_tween_start_x = obj.x+start_x;
				_tween_start_y = obj.y+start_y;
				_tween_end_x = _tween_start_x+end_x;
				_tween_end_y = _tween_start_y+end_y;
			}
			else
			{
				_tween_start_x = start_x;
				_tween_start_y = start_y;
				_tween_end_x = end_x;
				_tween_end_y = end_y;
			}
		}
		
		x = tween(time_in_seconds,_tween_start_x,_tween_end_x,false,tween_id_1,anim_curve)
		y = tween(time_in_seconds,_tween_start_y,_tween_end_y,false,tween_id_2,anim_curve)
	}
}


function tween_setup(number = 20)
{
	/// @description tween_setup
	/// @arg array_length
	if !variable_instance_exists(self,"_tween") {_tween = array_create(number,0)}
}

function tween_reset(tween_id,obj = self)
{
	/// @description tween_reset
	/// @arg tween_id
	if !variable_instance_exists(obj,"_tween") {_tween = array_create(20,0)}
	else 
	{
		obj._tween[tween_id] = 0;
	}
}

function tween_reset_x_y(obj)
{
	with obj {if variable_instance_exists(self,"_tween_start_x") {_tween_start_x = -1}}
}

function tween_reset_all(obj)
{
	if !variable_instance_exists(obj,"_tween") {_tween = array_create(20,0)}
	else
	{
		for (i=0;i<(array_length(obj._tween));i++)
		{
			obj._tween[i] = 0;
		}
		tween_reset_x_y(obj);
	}

}

