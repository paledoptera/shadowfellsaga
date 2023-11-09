// Initializes all game data and functionality, ran at the start
// of the game inside of obj_gamehandler, does not need to be ran more than once
function game_init(){
	#region Audio
	audio_channel_num(128);
	global.mus_emitter				=audio_emitter_create();
	global.musfpath						="data/mus/";
	global.muspriority					=20;
	global.currentmus					=-1;
	audio_group_load(Talksounds)
	audio_group_load(sfx)
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
	#region Create Crash Logs (Windows, Android and Linux)
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
	#endregion
	global.osflavor = (os_type != os_android ? 0 : 1) 
	math_set_epsilon(0.00001)
	#region Window/Resolution Stuff
	window_set_color(0)
	global.windowmode			= 1;
    global.windowmode_returnto = global.windowmode;
	
	global.window_res_w = 1280;
	global.window_res_h = 960;
	
	global.gui_res_w = 640;  // same size as camera
	global.gui_res_h = 480; 
	
	global.aspect_ratio = "4:3"
	
	global.camasp = 0; // 0 - 4:3 1 - 16:9
	
	
#region Define accessible window resolutions
#region Widescreen Resolutions
global.resolutions2 = [
{ w:320 ,  h:180 }, //16:9
{ w:640 ,  h:360 },
{ w:800,   h:450 },
{ w:960,   h:540 },
{ w:1024, h:576 },
{ w:1152, h:648 },
{ w:1280 , h:720 },
{ w:1440, h:810 },
{ w:1600, h:900 },
{ w:1856, h:1044 },
{ w:1920 , h:1080 },
{ w:2048,  h:1152},
{ w:2560 , h:1440 },
{ w:2880,  h:1620 },
{ w:3072,  h:1728 },
{ w:3840,  h:2160 },
{ w:4096,  h:2304 },
{ w:5120,  h:2880 },
{ w:6144,  h:3456},
{ w:7680,  h:4320},
{ w:8192,  h:4608}
]
#endregion
#region Non-widescreen resoltuons
global.resolutions = [ 
{ w:320,	 h:240 }, // 4:3
{ w:640,   h:480 },
{ w:800,   h:600 },
{ w:960,   h:720 },
{ w:1024, h:768 },
{ w:1152, h:864 },
{ w:1280, h:960 },
{ w:1400, h:1050 },
{ w:1440, h:1080 },
{ w:1600, h:1200 },
{ w:1856, h:1392 },
{ w:1920, h:1440 },
{ w:2048, h:1536 },
{ w:2560, h:1920 },
{ w:2880, h:2160 },
{ w:3072, h:2304 },
{ w:3840, h:2880 },
{ w:4096, h:3072 },
{ w:5120, h:3840 },
{ w:6144, h:4608 },
{ w:7680, h:5760 },
{ w:8192, h:6144 }, 
]
#endregion

global.resolution_index = 6;
if global.camasp == 0 {
global.resolution_current = global.resolutions[global.resolution_index];
} else {  global.resolution_current = global.resolutions2[global.resolution_index];
}
#endregion
	#endregion
	global.flush_textures			=1;
	global.vsync								=true;
	global.lowvfx							=false;
	global.camtype						=1;
	global.canusemenu				=true;
	global.selecteditem				=-1;
	global.selectedarm				=-1;
	global.selectedwep				=-1;
	if(global.flush_textures==1){
		texture_flush("FONTS");
		texture_flush("PORTRAITS");
		texture_flush("TILES");
	}
	#region Register internal game global variables
	global.currentroom				=-1;
	global.loadroom					=-1;
	global.currentarea				=-1;
	global.currentareaname		=-1;
	global.timeseconds				=-1; // In-game time stored in seconds
	global.lpartyname					=0;
	global.loaded							=false;
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
	global.partyat							=array_create(2,-1);
	global.partydf							= array_create(2,-1);
	global.partyequippedwep	= array_create(2,-1);
	global.partyequippedarm	=array_create(6,-1);
	global.leadchar = 0;
	global.exp								=0; // No experience gained
	global.money							=0; //D$
	global.bp									=0; // No bone points
	
	global.gp_supported=gamepad_is_supported();
	global.gp_index=0;	
	global.gp_device=-1;
	#endregion
	encounter_init();
	elements_init();
	flags_init(true);
	stats_init(true);
	item_init();
	item_add(0,1,99);
	item_add(1,1,99);	item_add(2,1,99);
		item_add(3,1,99); 	item_add(4,1,99);
			item_add(5,1,99); 	item_add(6,1,99);	item_add(7,1,99);
				item_add(8,1,99); 	item_add(9,1,99);  	item_add(10,1,99); 	item_add(11,1,99);
				key_item_add(0,100)
	armor_add(0, 200)
	weapon_add(0, 300)
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
	 display_set_vsync_safe(global.vsync)  // Set VSync
	 instance_create(0,0,obj_quitting);
	 #region CRASH AND ERROR HANDLES
	 #region Read Crash Log
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
	#endregion
	 #region Integrity Exception Handler
	if (!data_check_integrity())
    {
        global.gamebroke = 8
        room_goto(STAGE_GAME_BROKE)
        return;
    }
	#endregion
	#endregion
	if(GAME.borderEnabled){
		//surface_resize(application_surface,640,480)
		application_surface_enable(true)
		application_surface_draw_enable(false)
	} 
}