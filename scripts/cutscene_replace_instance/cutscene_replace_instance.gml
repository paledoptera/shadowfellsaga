
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



function cutscene_replace_instance_offset(argument0, argument1, argument2 = 0, argument3 = 0, argument4 = false){
///@description cutscene_replace_instance
///@arg target_instance
///@arg replacer_instance
///@arg offset_y
///@arg offset_x
///@arg NOT-relative

var obj1 = argument0, obj2 = argument1;

if argument4 = false
{
	obj2.x = obj1.x+argument2;
	obj2.y = obj1.y+argument3;
}
else
{
	obj2.x = argument2;
	obj2.y = argument3;
}
with obj1 {instance_destroy();}
cutscene_end_action();

}