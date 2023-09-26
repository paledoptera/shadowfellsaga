// Cleans up any data that no longer needs to be used before closing the game
function game_cleanup(){
	if (global.mus_emitter != -4)
    {
        audio_emitter_free(global.mus_emitter)
        global.mus_emitter = -4
    }
	if (global.gamebroke == 8 || global.gamebroke == 11)
        return;
	ds_map_destroy(global.flags)
    ds_map_destroy(global.pflags)
	if (global.tempsave_buffer != -4 && buffer_exists(global.tempsave_buffer))
    {
        buffer_delete(global.tempsave_buffer)
        global.tempsave_buffer = -4
    }
	global.lang_loaded=0;
}