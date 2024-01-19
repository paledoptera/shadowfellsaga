//							/////////////////////////////////////////////////
//									------------ VARIABLES ------------
//							/////////////////////////////////////////////////

function cs_change_global_variable()
{
	///@description cs_change_global_variable
	///@arg var_name_as_string
	///@arg value

	if(!variable_global_exists(argument0))
	{
		variable_global_set(argument0,argument1)
	}
	cutscene_end_action();
}

function cs_change_variable()
{
	///@description cs_change_variable
	///@arg obj
	///@arg var_name_as_string
	///@arg value

	with(argument0)
	{
		variable_instance_set(id, argument1, argument2);
	}
	cutscene_end_action();
}

//							/////////////////////////////////////////////////
//									------------ FLAGS ------------
//							/////////////////////////////////////////////////

function cs_flag_set(type,key,value)
{
	///@description cutscene_flag_set
	///@arg  type  - the ds_map of the flag to set (global.flags or global.pflags)
	///@arg  key - the name of the flag as set in the ds_map
	///@arg value - the value to set to the flag
	flag_set(type,key,value);

	cutscene_end_action();
}