if (live_call()) return live_result;

var _flag = flag_get(global.cflags,"wildcliffs_intro")
if _flag = 0 {instance_destroy(obj_cutsc_bonepile);}

else
{
global.canusemenu=true;
flag_set(global.flags,"world",1);

#region DIALOGUE DATA
dialogue_0 = 
[
    {char : "papy_messedup", position : "bottom",
	 line : "UUUURGH..."},
    {line : "AM I ALL BROKEN &UP AGAIN?", port : "sly",}, 
	{line : "I HATE WHEN &THIS HAPPENS!!!", port : "displeased",},
]

dialogue_1_0 =
[
	{char : "papy_messedup", position: "bottom",
	 line : "FIRST THE FALL &FROM THE &STAIRS...", port : "displeased"},
]

dialogue_1_1 =
[
	{char : "papy_messedup", position: "bottom",
	 line : "THEN THAT TERRIBLE &SLIP-OFF THE &SLIPPERY ROOF...", port : "sly"},
]

dialogue_1_2 =
[
	{char : "papy_messedup", position: "bottom",
	 line : "DARK, CRUEL WORLD, SPARE ME FROM &THIS MOCKERY!!!", port : "goofycry"},
	{line : "WHERE'S MY BLASTED &SKULL?", port : "displeased"},
]

dialogue_1_3 =
[
	{char : "papy_messedup", position: "bottom",
	 line: "AHA!", port: "happy"},
]

dialogue_2 =
[
	{char : "papy_messedup", position: "bottom",
	 line: "NO CRACKS, &THANK GOODNESS!!!", port: "happy"},
	{line: "...BUT MY CRANIUM &FEELS ODDLY...", port: "sly"},
	{line: "...HAIRIER THAN &USUAL.", port: "sly"},
	{line: "HAVE THOSE LONG &YEARS OF APPLYING &HAIR-GROWTH SPRAY...", port: "sly"},
	{line: "...FINALLY &PAID OFF?!", port: "happy"},
]

dialogue_3_0 =
[
	{char : "papy_messedup", position: "bottom",
	 line: "NO, THAT CAN'T &BE IT...", port: "sly"},
	{line: "HAIR-GROWTH SPRAY &DOESN'T SPAWN &COWBOY CLOTHES.", port: "sly"},
	{line: "SAAANS!!!", port: "displeased"},
	{line: "ARE YOU PLAYING &ONE OF YOUR &PRANKS AGAIN?!", port: "displeased"},
]

dialogue_3_1 = 
[
	{char : "papy_messedup", position: "bottom",
	 line: "SANS...?", port: "sly"},
]

dialogue_3_2 = 
[
	{char : "papy_messedup", position: "bottom",
	 line: "I'D BETTER GO &FIND HIM...", port: "sly"},
]

dialogue_3_3 = 
[
	{char : "papy_messedup", position: "bottom",
	 line: "OOOH!!! &SANS CAN WAIT... &COOL HAT!!", port: "happy"},
]

dialogue_3_4 = 
[
	{char : "papy", position: "bottom",
	 line: "NYEH HEH HEH!!!!", port: "confident"},
	{line: "MASTER CHEF &PAPYRUS, THE &ICON OF FASHION!!!", port:"confident"},
]


// PAUSE ///////////////////////////////////////////
#endregion

t_scene_info = [
	[cutscene_instance_create, 0, 0, "Instances", ef_fadein_black_veryslow],
	[cutscene_change_player_state, "inactive"],
	[cutscene_move_camera, 320, 240, false, 99999],
	[cutscene_sprite_create, 152, 440, "Instances", spr_papyrus_gettingup1,0,-1,0,false],
	[cutscene_sprite_create, 152, 442, "Instances", spr_papyrus_groundpieces1,0,-1,0,false],
	[cutscene_move_camera, 320, 550, false, 1],
	[cutscene_wait,3],
	[cutscene_sprite_create, 152, 442, "Instances", spr_papyrus_groundpieces1,1,-1,false],
	[cutscene_wait,0.2],
	[cutscene_sprite_create, 152, 442, "Instances", spr_papyrus_groundpieces1,0,-1,false],
	[cutscene_wait,0.5],
	[cutscene_sprite_create, 152, 442, "Instances", spr_papyrus_groundpieces1,1,0,false],
	[cutscene_wait,3],
	[cutscene_sprite_create, 152, 442, "Instances", spr_papyrus_groundpieces2,1,1,true],
	[cutscene_newChat, dialogue_0],
	[cutscene_wait_for_dialogue],
	[cutscene_newChat, dialogue_1_0],
	[cutscene_wait_for_dialogue],	
	[cutscene_newChat, dialogue_1_1],
	[cutscene_wait_for_dialogue],		
	[cutscene_newChat, dialogue_1_2],
	[cutscene_wait_for_dialogue],	
	[cutscene_newChat, dialogue_1_3],
	[cutscene_wait_for_dialogue],	
	[cutscene_newChat, dialogue_2],
	[cutscene_wait_for_dialogue],	
	[cutscene_newChat, dialogue_3_0],
	[cutscene_wait_for_dialogue],	
	[cutscene_newChat, dialogue_3_1],
	[cutscene_wait_for_dialogue],
	[cutscene_newChat, dialogue_3_2],
	[cutscene_wait_for_dialogue],	
	[cutscene_newChat, dialogue_3_3],
	[cutscene_wait_for_dialogue],	
	[cutscene_newChat, dialogue_3_4],
	[cutscene_wait_for_dialogue],
	[cutscene_move_instance,PLAYER,600,600,false,999999],
	[cutscene_flag_set, global.cflags, "wildcliffs_intro", 0],
	[cutscene_change_player_state, "active"],
	[cutscene_end]
];

create_cutscene(t_scene_info);
}