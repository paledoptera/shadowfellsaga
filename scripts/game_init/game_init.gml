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
	
	#region Window/Resolution Stuff
	window_set_color(0)
	global.windowmode			= 1;
    global.windowmode_returnto = global.windowmode;
	
	global.window_res_w = 640; //1280
	global.window_res_h = 480; //960
	
	global.aspect_ratio = "4:3"
	
	global.camasp = 0; // 0 - 4:3 1 - 16:9
	#endregion

	#region Define accessible window resolutions
	#region Widescreen Resolutions
	global.resolutions2 = [
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
	#region Non-widescreen resolutions
	global.resolutions = [ 
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
	#endregion
	#region Setting current resolution
	global.resolution_index = 5;

	if global.camasp == 0 
	{
		global.resolution_current = global.resolutions[global.resolution_index];
	}
	else 
	{  
		global.resolution_current = global.resolutions2[global.resolution_index];
	}
	
	#endregion
	
	#region Register internal game global variables
	
	global.game_chapter				= 1;
	global.vsync								= true;
	global.currentroom				= -1;
	global.currentarea				= -1;
	global.timeseconds				= -1; // In-game time stored in seconds
	global.loaded							= false;
	global.filechoice						= 0;
	
	global.borderenabled			=	false;
	global.border							= 0;
	
	global.gp_supported=gamepad_is_supported();
	global.gp_index=0;	
	global.gp_device=-1;
	#endregion
	
	//encounter_init();
	//elements_init();
	flags_init();
	item_init();
	party_init();

	global.window_init = 0
	window_update();
	global.window_init = 1
	display_set_vsync_safe(global.vsync)  // Set VSync
	instance_create(0,0,obj_quitting);
	
	window_center();
}