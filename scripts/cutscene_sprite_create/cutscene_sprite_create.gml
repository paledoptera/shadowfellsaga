function cutscene_sprite_create(){
///@description cutscene_sprite_create
///@arg x
///@arg y
///@arg layer_id
///@arg sprite_index
///@arg image_index_start
///@arg image_index_end
///@arg anim_speed
///@arg animation_loops?

with obj_ow_object_temp
{
	if x = argument0 and y = argument1 {instance_destroy();}
}


var inst = instance_create_layer(argument0, argument1, argument2, obj_ow_object_temp)
inst.sprite_index = argument3;
inst.image_index_start = argument4;
inst.image_index_end = argument5;
inst.image_speed = argument6;
inst.animation_loops = argument7;




cutscene_end_action();

}