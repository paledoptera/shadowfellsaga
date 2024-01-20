//BORDER._sprite=-1;

flag_set(global.flags,"world",1);

//dialogue_0 = 
//[
//    {/*CHARACTER SWITCH --->*/ char : "toquelle", 
//	 /*TEXTBOX POSITION SWITCH --->*/ position : "bottom",
//	 line : "aaaaaaaa, test test",							/*--------------------*/}, //LINE 1 
//]

//newChat(dialogue_0);

cutscene =
[
	//{action : function()				/*-Camera Pan Down-*/ {cs_camera_pan(0,50,2);}},	
	{action : function()				/*-Pause 3 seconds-*/ {cs_pause(3);}},
	{action : function()				/*-Pause 3 seconds-*/ {cs_camera_pan(-40,0,true,2);}},
	{action : function()				/*-Pause 3 seconds-*/ {cs_pause(3);}},
	{action : function()				/*-Pause 3 seconds-*/ {cs_camera_pan(40,0,true,2);}},	
	//{action : function()				/*-Camera Pan Down-*/ {cs_camera_pan(0,-50,0.5);}},		
]

cs_start(cutscene)


