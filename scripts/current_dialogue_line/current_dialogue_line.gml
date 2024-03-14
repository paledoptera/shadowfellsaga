// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function current_dialogue_line(){

if instance_exists(ctrl_dialogue)
{
	if ctrl_dialogue.message_current = argument0 {return (true);}
	else return (false);
}
else return (false);
}