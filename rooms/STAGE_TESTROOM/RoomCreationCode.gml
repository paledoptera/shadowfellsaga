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
	{action : function()				/*-Camera Pan Down-*/ {cs_camera_pan();}}						 
 	{action : function()				/*-Pause 3 Seconds-*/ {if paused = false{pause = 3;} paused = true;}									 
 	{action : function()				/*-Play Animation-*/ {sequence_create(x,y,sq_cutscene1_paps)}	
 	{action : function()				/*-Start Dialogue-*/ {dialogue_start(dialogue)}}
]

cutscene_start()


