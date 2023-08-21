function create_cutscene_passive(){
///@description create_cutscene_passive
///@arg scene_info

var inst = instance_create_layer(0,0,"Instances",ctrl_cutscene_passive)
with(inst) 
{
		scene_info = argument0;
		event_perform(ev_other, ev_user0);
}

}