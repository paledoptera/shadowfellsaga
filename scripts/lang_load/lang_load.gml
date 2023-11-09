// Loads a given language file from the /data/lang folder
function lang_load(){
	var fname= (global.localizationfpath+(global.langfprefix + global.lang) + ".json")
	var key_map=json_decode("{}")
	if(!is_english()){
		show_debug_message("Loading lang: " + fname);
		key_map=load_map_json(fname);
	}
}