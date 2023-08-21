function cutscene_flag_set(type,key,value){
///@description cutscene_flag_set
///@arg  type  - the ds_map of the flag to set (global.flags or global.pflags)
///@arg  key - the name of the flag as set in the ds_map
///@arg value - the value to set to the flag
flag_set(type,key,value);

cutscene_end_action();
}