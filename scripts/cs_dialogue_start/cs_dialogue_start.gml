// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cs_dialogue_start(){


if CS.action_info = ""
{
	dialogue_start(argument0);
	
	CS.stored_dialogue = argument0;
	CS.stored_dialogue_start = 0;
	CS.action_info = "dialogue";
	
}
}


function cs_dialogue_resume(){

if CS.action_info = ""
{
	dialogue_start(CS.stored_dialogue);
	ctrl_dialogue.message_current = CS.stored_dialogue_start;
	CS.action_info = "dialogue"
	
}
}