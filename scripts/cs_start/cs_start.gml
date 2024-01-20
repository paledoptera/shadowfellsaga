
function cs_start()
{
	
	var inst = instance_create_layer(0,0,"Instances",ctrl_cutscene)
	with(inst) 
	{
		stage_end = array_length(argument0)-1;
		for (i=0;i<stage_end+1;i++)
		{
			action[i] = argument0[i].action;
		}
	}
}