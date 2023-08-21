
function cutscene_replace_player(){
///@description cutscene_replace_player
///@arg replacer_instance

var obj = argument0

obj.x = obj_ow_player.x
obj.y = obj_ow_player.y;

with obj_ow_player {x = -2000; y = -2000;}
cutscene_end_action();

}