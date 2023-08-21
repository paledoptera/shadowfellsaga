function cutscene_music_fadeout(){
///@description cutscene_music_fadeout
///@arg time

gain = 0
audio_sound_gain(ctrl_music.cutscenesong,gain,argument0)

currentgain = audio_sound_get_gain(ctrl_music.cutscenesong)
if currentgain = gain 
{
	ctrl_music.cutscenesong_pos = audio_sound_get_track_position(ctrl_music.areasong);
	audio_stop_sound(ctrl_music.cutscenesong);
	cutscene_end_action();
}
}