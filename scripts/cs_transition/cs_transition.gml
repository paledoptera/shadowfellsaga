// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cs_transition(type,seconds,start_alpha = 1, end_alpha = 0, anim_curve = "linear", round_to_tenths = true){
///@description cs_transition
///@arg type
///@arg seconds
///@arg anim_curve

if(CS.start_action = false)
{
	CS.action_info = "transition"
	CS.start_action = true;
	CS.time_end_action = seconds;
	
	switch type
	{
		case "fade":
			handler_fader.round_to_tenths = round_to_tenths;
			handler_fader.state = "fade";
			handler_fader.start_alpha = start_alpha;
			handler_fader.end_alpha = end_alpha;
			handler_fader.time_in_seconds = seconds;
			handler_fader.anim_curve = anim_curve;
			tween_reset_all(handler_fader);
		break;
		
		case "hardcut":
			handler_fader.state = "hardcut";
			handler_fader.hardcut_timer = 0;
			handler_fader.hardcut_waiting = false;
			handler_fader.time_in_seconds = seconds;
			tween_reset_all(handler_fader);
		break;
	}
}





}