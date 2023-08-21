// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function instance_destroy_nearest(){
	///@description instance_destroy_nearest
	///@arg x
	///@arg y
	///@arg obj_id
	var inst = instance_nearest(argument0, argument1, argument2)
	instance_destroy(inst);
}