// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function during_hardcut(){
if instance_exists(handler_fader)
{
	if handler_fader.hardcut_waiting = true return (true);
	else return (false);
}
}