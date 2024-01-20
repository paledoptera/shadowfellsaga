// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cs_pause(){
if(CS.start_action = false)
{
	CS.action_info = "pause"
	CS.start_action = true;
	CS.time_end_action = argument0
}
}