if (live_call()) return live_result;

cutscene =
[
{action : function()			{cs_camera_pan(actor_papyrus.x,actor_papyrus.y,999999,false,true);}},	
{action : function()			{cs_camera_pan_ext(-20,0,0.5,true);											
										tween_obj_movement(actor_papyrus,0.5,0,-100,0,0,true,0,1,"easeOut")}},
{action : function()			{cs_dialogue_start(CS.dialogue);}},		
{action : function()			{cs_buffer();											
										actor_papyrus.direction = 0;  
										audio_play_sound(snd_attention,1,false);
										tween_reset_all(actor_papyrus);
								}},
{action : function()			{cs_sequence_play(sq_papyrus_dance,"Sequences",actor_papyrus.x,actor_papyrus.y,actor_papyrus);
										actor_papyrus.direction = 270;
								}},
{action : function()			{cs_pause(0.3)}},
{action : function()			{cs_dialogue_resume();}},							
{action : function()			{cs_camera_pan_ext(10,0,0.3,true,"easeInOut");				
										tween_obj_movement(actor_papyrus,0.3,0,50,0,0+1,true,0,1,"easeIn")}},		
{action : function()			{cs_buffer(); tween_reset_all(actor_papyrus);}},
{action : function()			{cs_camera_pan_ext(10,0,0.3,true,"easeInOut");				
										tween_obj_movement(actor_papyrus,0.3,0,50,0,0,true,0,1,"easeIn")}},
{action : function()			{cs_pause(0.3); actor_papyrus.direction = 270;}},
]


//LIST OF PARAMETERS IN DIALOGUE

dialogue =
[
    {char : "papy",							
	 position : "top",						
	 line : "PENIS COCK PENIS &PENIS COCK PENIS &PENIS COCK PENIS",},								
	{line : "^",},																								
	{char : "sans",
	 position: "bottom",
	 line: "* i'm joe from &family guy",},							
]