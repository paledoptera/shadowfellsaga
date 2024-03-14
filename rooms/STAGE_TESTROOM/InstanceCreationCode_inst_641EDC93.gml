if (live_call()) return live_result;

cutscene =
[
{action : function()			{cs_camera_establish(actor_papyrus.x,actor_papyrus.y)}},	
{action : function()			{cs_transition("fade",0.8,1,0,"easeIn",true);
										actor_sans.x = actor_papyrus.x+60;
										actor_sans.direction = 270;
								}},
{action : function()			{cs_emote(actor_papyrus,1,snd_attention)}},
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