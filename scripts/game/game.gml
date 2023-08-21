// Initializes all game data and functionality, ran at the start
// of the game inside of obj_gamehandler, does not need to be ran more than once
function game_init(){
	#region Audio
	audio_channel_num(128);
	global.mus_emitter				=audio_emitter_create();
	global.musfpath						="data/mus/";
	global.muspriority					=20;
	global.currentmus					=-1;
	#endregion
	#region Localization
	global.lang								="en"
	global.currentlang					="en";
	global.localizationfpath		="data/lang/";
	global.langfprefix					="lang_";
	global.lang_map = ds_map_create();
	global.font_map = ds_map_create();
	global.sprite_map = ds_map_create();
	global.lang_missing_map = ds_map_create();
	init_localization();
	#endregion
	gc_enable(0)
if (os_type != os_macosx)
        exception_unhandled_handler(function(argument0)
        {
            var exs = string(argument0)
            show_debug_message(("Unhandled exception " + exs))
            var f = file_text_open_write("crash.txt")
            file_text_write_string(f, exs)
            file_text_close(f)
            if (os_type != os_android && os_type != os_linux)
                show_message(("Game crashed! Please contact developers.\n\nExtra info: " + exs))
            return;
        }
	)
	global.osflavor = (os_type != os_android ? 0 : 1) 
	math_set_epsilon(0.00001)
	window_set_color(0)
	global.windowmode			= 1;
    global.windowmode_returnto = global.windowmode;
	global.flush_textures			=1;
	global.vsync								=true;
	global.camtype						=0;
	global.canusemenu				=true;
	global.selecteditem				=-1;
	if(global.flush_textures==1){
		texture_flush("FONTS");
		texture_flush("PORTRAITS");
		texture_flush("TILES");
	}
	global.currentroom				=-1;
	global.loadroom					=-1;
	global.currentarea				=-1;
	global.currentareaname		=-1;
	global.timeseconds				=-1; // In-game time stored in seconds
	global.lpartyname					=0;
	global.lcurrentarea				=0;
	global.lloadedroom				=0;
	global.ltime								=0;
	global.tempsave_buffer		= -4
	global.filechoice						=-1;
	global.gamebroke					= -1;
	global.borderenabled			=true;
	global.border							=0;
	global.party								=array_create(2, -1);
	global.partynames				=array_create(2,-1);
	global.partyhp						=array_create(2,-1);
	global.partydf							= array_create(2,-1);
	global.partyequippedwep	= array_create(2,-1);
	global.partyequippedarm	=array_create(6,-1);
	global.exp								=0; // No experience gained
	global.money							=0; //D$
	global.bp									=0; // No bone points
	encounter_init();
	elements_init();
	flags_init(true);
	stats_init(true);
	item_init();
	//item_add(0,1,1);
	//item_add(0,1,1);
	//item_add(0,1,1);
	input_init();
	party_init();
	fsm_init(); // Initialize the finite state machine
	if file_exists("file9")
		persist_load()
	else
		persist_save()
	GAME.garbageTimer=28	
	global.window_init = 0
	window_update();
	 global.window_init = 1
	 display_set_vsync_safe(global.vsync)
	 instance_create(0,0,obj_quitting);
	if file_exists("crash.txt")
    {
        f = file_text_open_read("crash.txt")
        var i = 0
        global.crash_data[0] = "Empty crash.txt"
        while (!file_text_eof(f))
        {
            global.crash_data[i++] = file_text_read_string(f)
            file_text_readln(f)
        }
        file_text_close(f)
        file_copy("crash.txt", "crash-last.txt")
        file_delete("crash.txt")
        global.gamebroke = 11
		room_goto(STAGE_GAME_BROKE);
	}
	if (!data_check_integrity())
    {
        global.gamebroke = 8
        room_goto(STAGE_GAME_BROKE)
        return;
    }
	if(GAME.borderEnabled){
		surface_resize(application_surface,640,480)
		application_surface_enable(true)
		application_surface_draw_enable(false)
	} 
}

function stats_init(argument0){
	global.fun = irandom_range(0,99);
	if argument0==true
	{
		global.inv_item = ds_list_create();
		global.inv_key = ds_list_create();
	} else {
		ds_list_clear(global.inv_item);
		ds_list_clear(global.inv_key);
	}
	ds_list_add(global.inv_item,1);
	ds_list_add(global.inv_key,0);
	return;
}
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