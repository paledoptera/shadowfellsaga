if (live_call()) return live_result;

instance_create(0,0,handler_parallax);
handler_parallax.finetune_y1 = 90;
handler_parallax.finetune_x1 = 200;
handler_parallax.finetune_y2 = -50;
handler_parallax.finetune_y3 = -190;

//UNCOMMENT THIS IF YOU WANT TO SKIP INTRO
flag_set(global.cflags,"wildcliffs_intro",0);
global.canusemenu=true;
flag_set(global.flags,"world",1);
PLAYER.state = "active"
PLAYER.x = 404-20
PLAYER.y = 600+8

var _flag = flag_get(global.cflags,"wildcliffs_intro")
if _flag = 0 {instance_destroy(obj_cutsc_bonepile);}

else
{
global.canusemenu=true;
flag_set(global.flags,"world",1);

#region DIALOGUE DATA
dialogue_0 = 
[
    {char : "papy_messedup", position : "top",
	 line : "UUUURGH...",},
    {line : "AM I ALL BROKEN &UP AGAIN?", port : "sly",
	 runcode : function() {obj_cutsc_bonepile.base_frame = 4;}}, 
	{line : "I HATE WHEN &THIS HAPPENS!!!", port : "displeased",
	 runcode : function() {obj_cutsc_bonepile.base_frame = 6;}},
]

	base_frame = 10;
dialogue_1_0 =
[
	{char : "papy_messedup", position: "top",
	 line : "FIRST THE FALL &FROM THE &STAIRS...", port : "displeased"},
]

dialogue_1_1 =
[
	{char : "papy_messedup", position: "top",
	 line : "THEN THAT TERRIBLE &SLIP-OFF THE &SLIPPERY ROOF...", port : "sly",},
	{char : "papy_messedup", position: "top",
	 line : "DARK, CRUEL WORLD, &SPARE ME FROM &THIS MOCKERY!!!", port : "goofycry",
	 runcode : function() {obj_cutsc_bonepile.stage = 5; obj_cutsc_bonepile.base_frame = 12;}},
	{line : "WHERE'S MY &BLASTED SKULL?", port : "displeased",
	 runcode : function() {obj_cutsc_bonepile.base_frame = 14;}},
]
dialogue_1_2 =
[
	{char : "papy_messedup", position: "top",
	 line: "AHA!", port: "happy",
	 runcode : function() {audio_play_sound(snd_grab,10,false,0.5)}},
]

dialogue_2 =
[
	{char : "papy_messedup", position: "top",
	 line: "NO CRACKS, &THANK GOODNESS!!!", port: "happy"},
	{line: "...BUT MY CRANIUM &FEELS ODDLY...", port: "sly",
	 runcode : function() {obj_cutsc_bonepile.base_frame = 18;}},
	{line: "...#2HAIRIER #0THAN &USUAL.", port: "sly",},
	{line: "HAVE THOSE LONG &YEARS OF APPLYING &HAIR-GROWTH SPRAY", port: "sly"},
	{line: "...FINALLY &PAID OFF?!", port: "happy",
	 runcode : function() {obj_cutsc_bonepile.base_frame = 16;}},
]

dialogue_3_0 =
[
	{char : "papy_messedup", position: "top",
	 line: "NO, THAT CAN'T &BE IT...", port: "sly"},
	{line: "HAIR-GROWTH SPRAY &DOESN'T SPAWN &COWBOY CLOTHES.", port: "sly"},
	{line: "SAAANS!!!", port: "displeased", talksound : snd_txtpapyrus_echo,
	 runcode : function() {obj_cutsc_bonepile.base_frame = 28;}},
	{line: "ARE YOU PLAYING &ONE OF YOUR &PRANKS AGAIN?!", port: "displeased", talksound : snd_txtpapyrus_echo},
]

dialogue_3_1 = 
[
	{char : "papy_messedup", position: "top",
	 line: "SANS...?", port: "sly",
	 runcode : function() {obj_cutsc_bonepile.base_frame = 30;}},
]

dialogue_3_2 = 
[
	{char : "papy_messedup", position: "top",
	 line: "I'D BETTER GO &FIND HIM...", port: "sly"},
]

dialogue_3_3 = 
[
	{char : "papy_messedup", position: "top",
	 line: "OOOH!!! &SANS CAN WAIT... &COOL HAT!!", port: "happy"},
]

dialogue_3_4 = 
[
	{char : "papy", position: "top",
	 line: "NYEH HEH HEH!!!!", port: "confident"},
	{line: "MASTER CHEF &PAPYRUS, THE &ICON OF FASHION!!!", port:"confident"},
]


// PAUSE ///////////////////////////////////////////
#endregion

runcode = 0;
endcode = 0;

t_scene_info = [
	[cutscene_instance_create, 0, 0, "Instances", ef_fadein_black_veryslow],
	[cutscene_change_player_state, "inactive"],
	[cutscene_move_camera, 320, 240, false, 99999],
	[cutscene_move_camera, 320, 550, false, 1],
	[cutscene_wait,3],
	[cutscene_change_variable,obj_cutsc_bonepile,"image_index",1],
	[cutscene_wait,0.2],
	[cutscene_change_variable,obj_cutsc_bonepile,"image_index",0],
	[cutscene_wait,0.5],
	[cutscene_change_variable,obj_cutsc_bonepile,"image_index",1],
	[cutscene_wait,3],
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",1],
	[cutscene_newChat, dialogue_0],
	[cutscene_wait_for_dialogue],
	[cutscene_change_variable,obj_cutsc_bonepile,"image_speed",0],
	[cutscene_play_sound,snd_struggle,10,false],
	[cutscene_object_shake,obj_cutsc_bonepile,1.5,0.1,1,true,false,false,"_draw_x_1"],
	[cutscene_wait,0.2],
	[cutscene_play_sound,snd_struggle,10,false],
	[cutscene_object_shake,obj_cutsc_bonepile,4,0.1,1,true,false,false,"_draw_x_1"],
	[cutscene_play_sound,snd_bump,10,false],
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",2],
	[cutscene_wait,1],	
	[cutscene_chk_chk,0.3],
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",3],
	[cutscene_wait_for_chk_chk],
	[cutscene_newChat, dialogue_1_0],
	[cutscene_wait_for_dialogue],	
	[cutscene_chk_chk,0.1],
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",4],
	[cutscene_change_variable,obj_cutsc_bonepile,"base_frame",10],
	[cutscene_wait_for_chk_chk],
	[cutscene_newChat, dialogue_1_1],
	[cutscene_wait_for_dialogue],		
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",6],
	[cutscene_wait,0.3],
	[cutscene_chk_chk,0.8],
	[cutscene_wait,0.7],
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",7],
	[cutscene_wait_for_chk_chk],
	[cutscene_newChat, dialogue_1_2],
	[cutscene_wait_for_dialogue],	
	[cutscene_wait,0.5],	
	[cutscene_change_variable,obj_cutsc_bonepile,"base_frame",16],
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",8],
	[cutscene_newChat, dialogue_2],
	[cutscene_wait_for_dialogue],	
	[cutscene_play_sound,snd_smallswing,10,false],
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",9],
	[cutscene_wait,1],	
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",10],
	[cutscene_wait,0.5],	
	[cutscene_change_variable,obj_cutsc_bonepile,"base_frame",26],
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",11],
	[cutscene_newChat, dialogue_3_0],
	[cutscene_wait_for_dialogue],	
	[cutscene_wait,1.5],
	[cutscene_play_sound,snd_crickets,10,false,2],
	[cutscene_wait,1],
	[cutscene_newChat, dialogue_3_1],
	[cutscene_wait_for_dialogue],
	[cutscene_wait,0.7],
	[cutscene_newChat, dialogue_3_2],
	[cutscene_wait_for_dialogue],	
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",12],
	[cutscene_wait,0.3],
	[cutscene_play_sound,snd_attention,10,false],
	[cutscene_wait,0.7],
	[cutscene_change_variable,obj_cutsc_bonepile,"base_frame",37],
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",13],
	[cutscene_newChat, dialogue_3_3],
	[cutscene_wait_for_dialogue],	
	[cutscene_chk_chk,0.1],
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",14],
	[cutscene_wait_for_chk_chk],
	[cutscene_wait,1],
	[cutscene_change_variable,obj_cutsc_bonepile,"stage",15],
	[cutscene_newChat, dialogue_3_4],
	[cutscene_wait_for_dialogue],
	[cutscene_replace_instance_offset, obj_cutsc_bonepile,PLAYER,404-20,600+8,true],
	[cutscene_flag_set, global.cflags, "wildcliffs_intro", 0],
	[cutscene_change_player_state, "active"],
	[cutscene_end]
];

create_cutscene(t_scene_info);
}