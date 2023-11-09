// Loads JSON keys and other data from a given JSON file, used by lang_load()
function load_map_json(fname){
    if file_exists(fname)
    {
        var fbuff = buffer_load(fname)
        var json = buffer_read(fbuff, buffer_string)
        buffer_delete(fbuff)
        return json_decode(json);
    }
    else
    {
        show_debug_message((("file: " + fname) + "does not exist"))
        return json_decode("{}");
    }
}