
function cutscene_replace_instance(){
///@description cutscene_replace_instance
///@arg target_instance
///@arg replacer_instance

var obj1 = argument0, obj2 = argument1;

obj2.x = obj1.x
obj2.y = obj1.y;

with obj1 {instance_destroy();}
cutscene_end_action();

}