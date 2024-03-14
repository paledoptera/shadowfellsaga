if (live_call()) return live_result;

cutscene =
[
{action : function()			{cs_camera_establish(actor_papyrus.x,actor_papyrus.y)}},	
{action : function()			{cs_transition("fade",0.8,1,0,"easeIn",true);
										actor_sans.x = actor_papyrus.x+60;
										actor_sans.direction = 270;
								}},
{action : function()			{cs_camera_pan_ext(-20,0,0.5,true);											
										tween_obj_movement(actor_papyrus,0.5,0,-100,0,0,true,0,1,"easeOut")}},
{action : function()			{cs_dialogue_start(CS.dialogue);
										if current_dialogue_line(2) {actor_custom_sprite(actor_sans,spr_sans_jazz_hand,1,false);}
										else actor_custom_sprite(actor_sans,-1);
										actor_sans.direction = 270;
								}},		
{action : function()			{cs_transition("hardcut",0.2);
										if during_hardcut() {CAM.x = actor_sans.x-20;}
								}},
{action : function()			{cs_buffer();											
										actor_papyrus.direction = 0;  
										audio_play_sound(snd_attention,1,false);
										tween_reset_all(actor_papyrus);
								}},
{action : function()			{cs_sequence_play(sq_papyrus_dance,"Sequences",actor_papyrus.x,actor_papyrus.y,actor_papyrus,actor_papyrus.x+164);
										actor_papyrus.direction = 270;
								}},
{action : function()			{cs_emote(actor_papyrus,1,snd_attention)}},
{action : function()			{cs_buffer();											
										actor_papyrus.direction = 0;  
										actor_custom_sprite(actor_papyrus,spr_papy_battle_hurt);
								}},
{action : function()			{cs_camera_shake(1,3)}},					
{action : function()			{cs_camera_pan_ext(10,0,0.3,true,"easeInOut");				
										tween_obj_movement(actor_papyrus,0.3,0,50,0,0+1,true,0,1,"easeIn")
										actor_custom_sprite(actor_sans,-1);
										actor_custom_sprite(actor_papyrus,-1);
								}},		
{action : function()			{cs_buffer(); 
										tween_reset_all(actor_papyrus);
								}},
{action : function()			{cs_camera_pan_ext(10,0,0.3,true,"easeInOut");				
										tween_obj_movement(actor_papyrus,0.3,0,50,0,0,true,0,1,"easeIn")
								}},
{action : function()			{cs_pause(0.3); actor_papyrus.direction = 270;}},
]


dialogue =
[
    {char : "papy",							
	 position : "bottom",						
	 line : "PENIS COCK PENIS| &PENIS... COCK PENIS.| &PENIS COCK. PENIS",},		
	{line : "PENIS. COCK PENIS", 
	 interrupted : true}, 	
	//{line : "^",},																								
	{char : "sans",							
	 position : "top",		
	 line : "* abcdefghijklma&nopqrstuvwxyz&!,.'",},	
	{line : "* cock.",},		
	{line : "* ya like jazz?"}
]