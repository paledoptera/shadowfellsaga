
function cutscene_replace_instance_nearest(){
///@description cutscene_replace_instance_nearest
///@arg target_instance
///@arg replacer_instance
///@arg x
///@arg y

var obj1 = instance_nearest(argument2, argument3, argument0), obj2 = argument1;

obj2.x = obj1.x
obj2.y = obj1.y;

with obj1 {instance_destroy();}
cutscene_end_action();
}