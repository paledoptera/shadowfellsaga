function cutscene_musicarea_resume(){
///@description cutscene_musicarea_resume
///@arg startgain
///@arg time
	
	
if !audio_is_playing(ctrl_music.areasong)
{
	song = audio_play_sound(ctrl_music.areasong,20,true,ctrl_music.song_volume,ctrl_music.areasong_pos,1);
	audio_sound_gain(ctrl_music.areasong,argument0,0);
	audio_sound_gain(ctrl_music.areasong,ctrl_music.song_volume,argument1);
}

currentgain = audio_sound_get_gain(ctrl_music.areasong)
if currentgain = ctrl_music.song_volume {cutscene_end_action();}
}