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