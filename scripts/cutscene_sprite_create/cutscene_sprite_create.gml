function cutscene_sprite_create(){
///@description cutscene_sprite_create
///@arg x
///@arg y
///@arg layer_id
///@arg sprite_index
///@arg image_index
///@arg anim_speed
///@arg animation_loops?

var inst = instance_create_layer(argument0, argument1, argument2, obj_ow_object_temp)
inst.sprite_index = argument3;
inst.image_index = argument4;
inst.image_speed = argument5;
inst.animation_loops = argument6;



cutscene_end_action();

}