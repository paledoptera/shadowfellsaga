global.canusemenu=true;
flag_set(global.flags,"world",1);

#region DIALOGUE DATA
key1 = "WILDCLIFFS_INTROCUTSCENE"
dialogue_0 = 
[
    {char : "papy_messedup", position : "bottom",
	 line : str_set_loc("UUUURGH...", key1 + "0"),},
    {line : str_set_loc("AM I ALL BROKEN &UP AGAIN?", key1 + "1"), port : "sly",}, 
	{line : str_set_loc("I HATE WHEN &THIS HAPPENS!!!", key1 + "2"), port : "displeased",},
]
// PAUSE ///////////////////////////////////////////
#endregion


t_scene_info = [
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
	[cutscene_end]
];

create_cutscene(t_scene_info);