function cutscene_musicarea_fadeout(){
///@description cutscene_musicarea_fadeout
///@arg time

gain = 0
mus_set_volume(global.currentmus,gain,argument0)

currentgain = audio_sound_get_gain(global.currentmus)
if currentgain = gain 
{
	mus_stop(global.currentmus)
	cutscene_end_action();
}
}