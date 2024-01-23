// Cleans up any data that no longer needs to be used before closing the game
function game_cleanup(){
	if (global.mus_emitter != -4)
    {
        audio_emitter_free(global.mus_emitter)
        global.mus_emitter = -4
    }
	ds_map_destroy(global.flags)
    ds_map_destroy(global.pflags)
	ds_map_destroy(global.cflags)
}