
function cutscene_start()
{
	
	var inst = instance_create_layer(0,0,"Instances",ctrl_cutscene)
	with(inst) 
	{
		action = argument0;
		stage_end = array_length(action);
	}
}