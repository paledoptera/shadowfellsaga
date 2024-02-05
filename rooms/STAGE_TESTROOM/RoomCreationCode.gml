//BORDER._sprite=-1;

flag_set(global.flags,"world",1);


cutscene =
[
{action : function()				/*-Camera Establish-*/ {cs_camera_pan(0,-400,-1,true);}},	
{action : function()				/*-Camera Pan Left-*/ {cs_camera_pan(0,200,2,true);}},
{action : function()				/*-Camera Pan Down-*/ {cs_camera_pan_ext(0,200,3,true,"cubicOut");}},		
{action : function()				/*-Pause 3 seconds-*/ {cs_pause(1);}},
{action : function()				/*-Dialogue Start-*/ {cs_dialogue_start(CS.dialogue);}},
//{action : function()				/*-Camera Shake-*/ {cs_camera_shake(10,2,1);}},	
{action : function()				/*-Camera Pan Left-*/ {cs_camera_pan(-200,0,2,true);}},
{action : function()				/*-Pause 3 seconds-*/ {cs_pause(3);}},
{action : function()				/*-Dialogue Resume-*/ {cs_dialogue_resume();}},
{action : function()				/*-Camera Pan Right-*/ {cs_camera_pan(200,0,2,true);}},		
{action : function()				/*-Dialogue Resume-*/ {cs_dialogue_resume();}},
]

cs_start(cutscene)
CS.dialogue =
[
    {/*CHARACTER SWITCH --->*/ char : "toquelle", 
	 /*TEXTBOX POSITION SWITCH --->*/ position : "bottom",
	 line : "aaaaaaaa, test test",							/*--------------------*/}, //LINE 1 
	{line : "penis cock blue",							/*--------------------*/}, //LINE 2
	{line : "^",							/*--------------------*/}, //LINE 3 (PAUSE)
	{line : "test test penis",							/*--------------------*/}, //LINE 4
	{line : "^",							/*--------------------*/}, //LINE 5 (PAUSE)
	{line : "test test penis TWO",							/*--------------------*/}, //LINE 6
]


