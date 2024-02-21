flag_set(global.flags,"world",1);
flag_set(global.cflags,"papyrus_jump_enabled",1)


cutscene =
[
{action : function() {cs_dialogue_start(CS.dialogue);}},				//-Dialogue Start-
{action : function() {cs_camera_pan_ext(-200,0,3,true); actor_papyrus.x = tween("easeOut",2,0,-100,true,false,10)}},					//-Camera Pan Left-
{action : function() {cs_pause(3); actor_papyrus.direction=270; tween_reset(10);}},									//-Pause-  
{action : function() {cs_dialogue_resume();}},							//-Dialogue Resume-
{action : function() {cs_camera_pan(200,0,2,true);  actor_papyrus.x = tween("easeOut",1,0,100,true,false,10)}},					//-Camera Pan Right- 
{action : function() {cs_pause(0.1); actor_sans.direction=270; tween_reset(10);}},		
{action : function() {cs_dialogue_resume();}},							//-Dialogue Resume- 
]

cs_start(cutscene)

CS.dialogue =
[
    {char : "papy",							//CHARACTER SWITCH 
	 position : "top",						//POSITION SWITCH
	 line : "PENIS COCK PENIS COCK",},								//LINE 1 
	{line : "penis cock BLUE!!! &NYEH HEH HEH!",},					//LINE 2
	{line : "^",},													//LINE 3 (PAUSE)
	{line : "COCK?! I LOVE COCK!",},									//LINE 4
	{line : "^",},													//LINE 5 (PAUSE)
	{line : "DO YOU LIKE COCK?!",},								//LINE 6
]



