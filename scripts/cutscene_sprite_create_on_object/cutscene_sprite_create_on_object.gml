function cutscene_sprite_create_on_object(){
///@description cutscene_sprite_create_on_object
///@arg object_replacing
///@arg layer_id
///@arg sprite_index
///@arg image_index
///@arg anim_speed
///@arg animation_loops?

obj = argument0

var inst = instance_create_layer(obj.x, obj.y, argument1, obj_ow_object_temp2)
inst.sprite_index = argument2;
inst.image_index = argument3;
inst.image_speed = argument4;
inst.animation_loops = argument5;

with obj
{
	sprite_index = spr_blank;
}

cutscene_end_action();

return inst;
}