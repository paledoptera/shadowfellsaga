#region SND
// This script plays a sound on a specific emitter.
function snd_play(soundid, priority=8, loopable, volume = 1, offset = 0, pitch) {
	if(!audio_is_playing(soundid)){
		audio_play_sound(soundid, priority, loopable, volume, offset, pitch);	
	}
}

// This script stops a sound.
function snd_stop(soundid) {
	return audio_stop_sound(soundid);
}

/// @arg soundid
/// @param level
/// @param time - The amount of time (in frames/ms) it takes to increase volume
function snd_gain(soundid, level, time=0){
	return audio_sound_gain(soundid, level, time);
}

/// @arg soundid
/// @param pitch
function snd_pitch(soundid,pitch=1){
	return audio_sound_pitch(soundid,pitch);
}

/// @arg soundid
function snd_get_pitch(soundid){
	return audio_sound_get_pitch(_snd);	
}
#endregion
#region Music
///@arg filename
// Loads an external music file and creates a stream
function mus_load(fname){
	var type=".ogg"
	return audio_create_stream(global.musfpath + fname+type);
}

///@arg streamid
// Denitializes an external music file and destroys the stream
function mus_stop(streamid){
	return audio_destroy_stream(streamid);
}

///@arg streamid
function mus_pause(streamid){
	return audio_pause_sound(streamid);	
}

function mus_resume_current() 
{
    if (global.currentmus != -4)
        mus_resume(global.currentmus)
    return;
}

///@arg streamid
function mus_resume(streamid){
	return audio_resume_sound(streamid);	
}

///@arg streamid
///@param {int} pitch
function mus_set_pitch(streamid,pitch=1){
	return audio_sound_pitch(streamid, pitch);
}	

///@arg streamid
///@param {int} volume
///@param {int} time
///@param {boolean} instant - is the fade over time or instantenous end of track?
/// Sets the volume of the given stream over a period of time
function mus_set_volume(streamid,volume=1,time=0,instant=false){
	return audio_sound_gain(streamid, volume, instant ? 0:(10 / room_speed) * 1000);
}

///@arg filename
///@param {boolean} loopable
///@param {int} gain
///@param {int} offset
///@param {int} pitch
function mus_playx(fname, loopable, gain=1, offset=0, pitch=1){
	global.currentmus=audio_play_sound(fname,global.muspriority,loopable, gain, offset, pitch);
	mus_set_pitch(global.currentmus,pitch);
	mus_set_volume(global.currentmus,gain);
}
	
///@arg filename
///@param {boolean} loopable
///@param {int} gain
///@param {int} offset
///@param {int} pitch
///@param {int} time 
///@param {int} instant
function mus_playx_on(fname,loopable, gain=1, offset=0, pitch=1,time=0, instant=true){
	global.currentmus=audio_play_sound_on(global.mus_emitter,loopable, gain, offset, pitch);
	mus_set_volume(global.currentmus,gain,time=0,instant=true);
	mus_set_pitch(global.currentmus, pitch);
	return global.currentmus;
}

///@arg filename
function mus_is_playing(fname){
	return audio_is_playing(fname);
}
	
///@arg filename
function mus_is_current(fname) 
{
    if (global.currentmus == noone)
        return 0;
    switch fname
    { 
        default:
            return global.currentmus== fname;
    }

}

///@arg filename
///@arg filetype
///@param {boolean} loopable 
///@param {int} gain
///@param {int} offset
///@param {int} pitch
function mus_lcplay(fname,loopable, gain=1, offset=0, pitch=1) 
{
    var s = mus_load(fname)
    global.currentmus = s
    if (s == noone)
        return -4;
    return mus_playx(s, loopable,gain,offset,pitch);
}
#endregion