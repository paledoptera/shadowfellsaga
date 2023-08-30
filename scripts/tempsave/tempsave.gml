// Creates a temporary save buffer, ran inside of savegame()
// Does not take any arguments
function tempsave(){
	if (global.tempsave_buffer != -4 && buffer_exists(global.tempsave_buffer))
        buffer_delete(global.tempsave_buffer)
    global.tempsave_buffer = buffer_create(512, buffer_grow, 1)
    savegame_serialize(global.tempsave_buffer)
    return;
}
	