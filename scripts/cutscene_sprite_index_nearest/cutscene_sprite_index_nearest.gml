function cutscene_sprite_index_nearest(){
///@description cutscene_sprite_index
///@arg obj
///@arg x
///@arg y
///@arg sprite_index
///@arg image_speed


var inst = instance_nearest(argument0, argument1, argument2)

with(inst) 
{
	sprite_index = argument3;
	image_speed = argument4;
}
cutscene_end_action();
}