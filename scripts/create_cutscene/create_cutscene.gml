function create_cutscene(){
///@description create_cutscene(scene_info)
///@arg scene_info

var inst = instance_create_layer(0,0,"Instances",ctrl_cutscene)
with(inst) 
{
		scene_info = argument0;
		event_perform(ev_other, ev_user0);
}

}