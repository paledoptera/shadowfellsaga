// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cs_sequence_play(sequence, layer_id, play_x, play_y,obj_to_replace = -1, obj_x_after_sq = play_x,obj_y_after_sq = play_y)
{
	if(CS.start_action = false)
	{
		if obj_to_replace != -1 
		{
			CS.action_info_extra_1 = obj_to_replace;
			
			if obj_x_after_sq != play_x {CS._value[0] = obj_x_after_sq}
			else {CS._value[0] = obj_to_replace.x;}
			if obj_y_after_sq != play_y {CS._value[1] = obj_y_after_sq}
			else {CS._value[1] = obj_to_replace.y;}
		}
		
		layer_sequence_create(layer_id,play_x,play_y,sequence);
		var _seq = sequence_get(sequence);
		_seq.loopmode = seqplay_oneshot; 
		_seq.playbackSpeedType = spritespeed_framespersecond
		CS.action_info = "sequence"
		CS.action_info_extra = sequence;
		CS.start_action = true;
		CS.time_end_action = _seq.length/_seq.playbackSpeed;
	}

}