///@arg encounter_id
///@arg anim*
function cutscene_start_encounter(encounter,anim){
	encounter_start(encounter,anim)
	
	cutscene_end_action();
}