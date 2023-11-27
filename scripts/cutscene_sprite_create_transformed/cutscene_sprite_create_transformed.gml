function cutscene_sprite_create_transformed(){
///@description cutscene_sprite_create_transformed
///@arg x
///@arg y
///@arg layer_id
///@arg sprite_index
///@arg image_index
///@arg anim_speed
///@arg animation_loops?
///@arg image_xscale
///@arg image_yscale

var inst = instance_create_layer(argument0, argument1, argument2, obj_cutscene_prop)
inst.sprite_index = argument3;
inst.image_index = argument4;
inst.image_speed = argument5;
inst.animation_loops = argument6;
inst.image_xscale = argument7;
inst.image_yscale = argument8;

cutscene_end_action();

return inst;

}