function cutscene_music_play(){
///@description cutscene_music_play
///@arg index
///@arg loops?
///@arg startgain
///@arg time
///@arg pitch


index = argument0;
loops = argument1;

ctrl_music.cutscenesong = index;
ctrl_music.cutscenesong_pos = 0;

if (global.currentmus!=-1)
{
	ctrl_music.song_volume = argument2
	ctrl_music.song=mus_playx(mus_load(ctrl_music.cutscenesong),loops,
	ctrl_music.song_volume,ctrl_music.cutscenesong_pos,ctrl_music.cutscenesong_pitch)
}

cutscene_end_action();
}