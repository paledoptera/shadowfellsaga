// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function layer_sequence_destroy_entirely(){

var _layer = layer_get_id(argument0)

var a = layer_get_all_elements(_layer);
for (var i = 0; i < array_length(a); i++;)
{
    if layer_get_element_type(a[i]) == layerelementtype_sequence
    {
        layer_sequence_destroy(a[i]);
    }
}
}