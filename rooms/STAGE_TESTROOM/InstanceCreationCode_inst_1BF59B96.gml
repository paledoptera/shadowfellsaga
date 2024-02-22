if (live_call()) return live_result;

cutscene =
[
{action : function()			{cs_dialogue_start(CS.dialogue);}},					
{action : function()			{cs_camera_pan_ext(-20,0,2,true);											
										tween_obj_movement(actor_papyrus,1,0,-300,0,0,true,0,1,"easeOut")}},	
{action : function()			{cs_buffer();											
										actor_papyrus.direction = 270;  
										audio_play_sound(snd_attention,1,false);
										tween_reset_all(actor_papyrus);}},
{action : function()			{cs_dialogue_resume();}},									
{action : function()			{cs_pause(1)
										tween_obj_movement(actor_sans,0.5,0,0,0,100,true,2,3,"linear")}},
{action : function()			{cs_dialogue_resume();}},									
{action : function()			{cs_camera_pan_ext(20,0,0.5,true,"easeInOut");							
										tween_obj_movement(actor_papyrus,0.5,0,300,0,0,true,2,3,"overshoot")	
										tween_obj_movement(actor_sans,0.5,0,0,0,-100,true,2,3,"linear")}},
{action : function()			{cs_dialogue_resume();}},								
]


//LIST OF PARAMETERS IN DIALOGUE

dialogue =
[
    {char : "papy",							
	 position : "top",						
	 line : "PENIS COCK PENIS",},								
	{line : "^",},													
	{line : "TEST TEST &PENIS",},									
	{line : "^",},													
	{char : "sans",
	 position: "bottom",
	 line: "* i'm joe from &family guy",},	
	{line : "^",},		
	{char : "papy",
	 position: "top",
	 line : "TEST TEST &PENIS TWO",},							
]