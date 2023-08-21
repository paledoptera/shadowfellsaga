/// Shortcut for string_length
// Simply fetches the length of a given string
function str_len(argument0) 
{
    return string_length(argument0);
}

function substring() 
{
	///@arg str - string
	///@arg pos - position within string
    var str = argument[0]
    var pos = argument[1]
    if (pos < 0)
        pos = ((str_len(str) + 1) + pos)
    if (argument_count == 2)
        var len = ((str_len(str) - pos) + 1)
    else
        len = argument[2]
    if (len > 0)
        return string_copy(str, pos, len);
    else
        return "";
}

// Initializes localization data, ran once in game_init()
function init_localization(){
		var _lang=global.currentlang;
		global.lang=_lang;
		if file_exists("config.ini"){
				ini_open("config.ini")
				global.lang=ini_read_string("LANGUAGE","Language",_lang);
				ini_close();
		}
		if(!variable_global_exists("lang_loaded"))
			global.lang_loaded=""
		if(global.lang_loaded != global.lang){
			global.lang_loaded=global.lang
			if variable_global_exists("lang_map")
				 ds_map_destroy(global.lang_map)
				 ds_map_destroy(global.font_map)
				 ds_map_destroy(global.sprite_map);
		}
		global.lang_map = ds_map_create();
		global.font_map = ds_map_create();
		global.sprite_map = ds_map_create();
		global.lang_missing_map = ds_map_create();
		lang_load()
		if(global.lang=="en"){
			var fm = global.font_map	
			ds_map_add(fm,"main",fnt_main);
			ds_map_add(fm,"papyrus",fnt_papyrus);
			ds_map_add(fm,"comicsans",fnt_sans);
			ds_map_add(fm, "semisheriff",fnt_semi);
			var sm = global.sprite_map
			ds_map_add(sm, "bkg_flavortown",bkg_flavortown);
			ds_map_add(sm,"bkg_flavortown_BATTLE",bkg_flavortown_BATTLE);
		}
		return;
}

// Used by str_set_loc, gets a given localized key from the json file for the game language
function get_lang_string(argument0) 
{
    var lang_string_id = argument0
    var str = ds_map_find_value(global.lang_map, lang_string_id)
    if is_undefined(str)
    {
        if (!(ds_map_find_value(global.lang_missing_map, lang_string_id)))
        {
            ds_map_add(global.lang_missing_map, lang_string_id, 1)
            show_debug_message((((("ERROR: string id " + lang_string_id) + " for language ") + global.lang) + " is missing"))
        }
        str = "--missing-string--"
    }
    return str;
}

// Used by lang_set_draw_font()
// Returns a font stored in your language
function get_font(font) {
    return ds_map_find_value(global.font_map, font);
}

// Draws a given font, if it exists in your language data
function lang_set_draw_font(font){
		 draw_set_font(get_font(font))
}

// Checks if global.lang is equal to english
// Used in lang load to provide debugging information and load other language files
function is_english(){
    return ((!variable_global_exists("lang")) || global.lang == "en");
}

// Loads a given language file from the /data/lang folder
function lang_load(){
	var fname= (global.localizationfpath+(global.langfprefix + global.lang) + ".json")
	var key_map=json_decode("{}")
	if(!is_english()){
		show_debug_message("Loading lang: " + fname);
		key_map=load_map_json(fname);
	}
}

// Replaces a given default string with a localized version for your language
function str_set_loc(str,key){
	///@arg str - string as listed in the indexed key
	///@arg key - the json key to index
    if (!is_english())
        str = get_lang_string(key)
    return str;
	
}

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