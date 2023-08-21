#region Dialogue Data
#region Lines
dialogue_0[0,0]=str_set_loc("HMMM...&LET'S SEE...", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_0_0")
dialogue_0[1,0] =str_set_loc("'SAUTE THE ONIONS&AND GARLIC UNTIL&THEY SHIMMER WITH-", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_1_0")
dialogue_0[2,0] = str_set_loc("A DEEP&... &GOLDEN BROWN...'", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_2_0")
// PAUSE ///////////////////////////////////////////
dialogue_1[0,0] =str_set_loc("THEY LOOK&PRETTY... &CHARRED", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_3_0")
dialogue_1[1,0] = str_set_loc("BUT THAT&DOESN'T MATTER!", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_4_0")
dialogue_1[2,0] =str_set_loc("I MUST ADD&THAT FLAIR...&THAT PIZAZZ...", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_5_0")
dialogue_1[3,0] =str_set_loc("...THAT THIS DISH&UTTERLY DESERVES!!!", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_6_0")
// PAUSE ///////////////////////////////////////////
dialogue_2[0,0] = str_set_loc("SANS! &THE MASTER CHEF&IS AT WORK!!!", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_7_0")
dialogue_2[1,0] = str_set_loc("PLEASE DO NOT&INTERRUPT THE COOK.", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_8_0")
// PAUSE ///////////////////////////////////////////
dialogue_3[0,0] =str_set_loc("* hey bro,&just remindin' you.", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_9_0")
dialogue_3[1,0] =str_set_loc("* tori and the kid&are comin', give it&like 5 minutes.", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_10_0")
dialogue_3[2,0] = str_set_loc("* you, uh,&done cooking yet?", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_11_0")
dialogue_3[3,0] =str_set_loc("A CHEF'S WORK IS&NEVER DONE, SANS!", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_12_0")
dialogue_3[4,0] =str_set_loc("I HAVE YET&TO ONLY COMPLETE...", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_13_0")
dialogue_3[5,0] =str_set_loc("...A MERE AMOUNT&OF 5 COURSES.", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_14_0")
dialogue_3[6,0] = str_set_loc("* how many of those&are edible?", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_15_0")
dialogue_3[7,0]  = str_set_loc("PATIENCE, SANS.", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_16_0")
dialogue_3[8,0] = str_set_loc("* alrighty.", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_17_0")
dialogue_3[9,0]  =str_set_loc("* just make sure&you wrap things&up soon.", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_18_0")
// PAUSE ///////////////////////////////////////////
dialogue_4[0,0] =str_set_loc("* just so you know...", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_19_0")
dialogue_4[1,0] =str_set_loc("* ice-e's won't&take orders&from us anymore.", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_20_0")
dialogue_4[2,0] =str_set_loc("...AND I WONDER&WHY THAT IS", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_21_0")
dialogue_4[3,0] = str_set_loc("* what?", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_22_0")
dialogue_4[4,0]= str_set_loc("* everyone needs an&ice breaker every&now and then.", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_23_0")
dialogue_4[5,0] = str_set_loc("SANS, I CANNOT&WORK IN THIS&ENVIRONMENT!!!", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_24_0")
dialogue_4[6,0] =str_set_loc("I AM TRYING&TO FOCUS...", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_25_0")
dialogue_4[7,0] = str_set_loc("AND YOU ARE&DAMAGING&MY STREAK!!!", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_26_0")
dialogue_4[8,0] = str_set_loc("* knock em dead, bro.", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_27_0")
// PAUSE ///////////////////////////////////////////
dialogue_5[0,0] =str_set_loc("NOW, WHERE WAS I....", "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_28_0")
#endregion

#region DIALOGUE DATA
key1 = "COOKING_WITH_PAPYRUS_FIRSTPASS_"

dialogue_0 = 
[
    {char : "chefp", position : "bottom",
	 line : str_set_loc("HMMM...&LET'S SEE...", key1 + "0" ),},
    {line : str_set_loc("'SAUTE THE ONIONS&AND GARLIC UNTIL&THEY SHIMMER WITH-", key1 + "1"),}, 
    {line : str_set_loc("A DEEP&... &GOLDEN BROWN...'", key1 + "2"), port : "shock",
	 runcode : function() {audio_play_sound(snd_revolver, 10, false);}},
]
// PAUSE ///////////////////////////////////////////
dialogue_1 = 
[
    {char : "chefp", position : "bottom",
	 line : str_set_loc("THEY LOOK&PRETTY... &CHARRED", key1 + "3"), port : "shock_lookleft",},
    {line : str_set_loc("BUT THAT&DOESN'T MATTER!", key1 + "4"), port : "nervous",}, 
    {line : str_set_loc("I MUST ADD&THAT FLAIR...&THAT PIZAZZ...", key1 + "5"), port : "confident",},
	{line : str_set_loc("...THAT THIS DISH&UTTERLY DESERVES!!!", key1 + "6"), port : "confident2",
	 runcode : function()
	 {
		 audio_play_sound(snd_txtsans, 10, false);
		 PLAYER.sprite_index = spr_paps_lw_hero;
		 PLAYER.x = 320;
		 PLAYER.y = 240;
	 }},
]
// PAUSE ///////////////////////////////////////////
dialogue_2 = 
[
    {char : "chefp", position : "bottom",
	 line : str_set_loc("SANS! &THE MASTER CHEF&IS AT WORK!!!", key1 + "7"), port : "displeased",},
    {line : str_set_loc("PLEASE DO NOT&INTERRUPT THE COOK.", key1 + "8"), port : "displeased",}, 
]
// PAUSE ///////////////////////////////////////////
dialogue_3 = 
[
    {char : "sans", position : "bottom",
	 line : str_set_loc("* hey bro,&just remindin' you.", key1 + "9"),},
    {line : str_set_loc("* tori and the kid&are comin', give it&like 5 minutes.", key1 + "10"),}, 
    {line : str_set_loc("* you, uh,&done cooking yet?", key1 + "11"), port : "lookleft",},
	{char : "chefp",
	 line : str_set_loc("A CHEF'S WORK IS&NEVER DONE, SANS!", key1 + "12"), port : "confident",},
    {line : str_set_loc("I HAVE YET&TO ONLY COMPLETE...", key1 + "13"), port : "sly",}, 
    {line : str_set_loc("...A MERE AMOUNT&OF 5 COURSES.", key1 + "14"), port : "confident2",}, 
    {char : "sans",
	 line : str_set_loc("* how many of those&are edible?", key1 + "15"), port : "joking",}, 
    {char : "chefp",
	 line : str_set_loc("PATIENCE, SANS.", key1 + "16"), port : "displeased",}, 
    {char : "sans",
	 line : str_set_loc("* alrighty.", key1 + "17"),}, 
    {line : str_set_loc("* just make sure&you wrap things&up soon.", key1 + "18"), port : "wink",}, 
]
// PAUSE ///////////////////////////////////////////
dialogue_4 = 
[
    {char : "sans", talkspeed : 1, position : "bottom",
	 line : str_set_loc("* just so you know...", key1 + "19"),},
    {line : str_set_loc("* ice-e's won't&take orders&from us anymore.", key1 + "20"), port : "lookleft",}, 
    {char : "chefp",
	 line : str_set_loc("...AND I WONDER&WHY THAT IS", key1 + "21"), port : "displeased",},
	{char : "sans",
	 line : str_set_loc("* what?", key1 + "22"), port : "joking_alt",},
    {line : str_set_loc("* everyone needs an&ice breaker every&now and then.", key1 + "23"), port : "wink",}, 
    {char : "chefp",
	 line : str_set_loc("SANS, I CANNOT&WORK IN THIS&ENVIRONMENT!!!", key1 + "24"), port : "wacky",}, 
    {line : str_set_loc("I AM TRYING&TO FOCUS...", key1 + "25"), port : "nervous",}, 
    {line : str_set_loc("AND YOU ARE&DAMAGING&MY STREAK!!!", key1 + "26"), port : "wacky",}, 
    {char : "sans",
	 line : str_set_loc("* knock em dead, bro.", key1 + "27"), port : "wink",}, 
]
// PAUSE ///////////////////////////////////////////
dialogue_5 = 
[
	{char : "chefp", talkspeed : 1, position : "bottom",
	 line : str_set_loc("NOW, WHERE WAS I....", key1 + "28"),},
]
#endregion

BORDER._sprite=-1;

mus_playx(mus_load("warmup"),true,0.6,0,1)
audio_group_load(Talksounds);

//newChat(dialogue,dialogue_port,fnt_papyrus, snd_txtpapyrus)


t_scene_info = [
	[cutscene_move_camera, 640/2, -480, false, 99999],
	[cutscene_flag_set,global.flags,"world",0],
	[cutscene_sprite_create, 225, 280, "Instances", spr_paps_lw_cooking, 1, true],
	[cutscene_move_camera, 640/2, 480/2, false, 3],
	[cutscene_wait,1.1],
	[cutscene_move_instance, obj_ow_player, 0, -1, true, 999],
	[cutscene_replace_instance_nearest, obj_ow_object_temp, obj_ow_player, 225, 280],
	[cutscene_move_instance, obj_ow_player, 0, -16, true, 4],
	[cutscene_wait,0.3],
	[cutscene_instance_create, 210, 194, "Instances", obj_kitchen_pan],
	[cutscene_wait,0.3],
	[cutscene_move_instance, obj_ow_player, 0, 4, true, 3],
	[cutscene_move_instance, obj_ow_player, 104-14, 0, true, 3],
	[cutscene_move_instance, obj_ow_player, 0, 6, true, 3],
	[cutscene_wait,0.3],
	[cutscene_change_variable, obj_ow_player, "animated", false],
	[cutscene_sprite_index_static,obj_ow_player,spr_paps_lw_cooking2,0],
	[cutscene_cam_zoom,1.5,false,20],
	[cutscene_newChat, dialogue_0],
	[cutscene_wait_for_dialogue],
	[cutscene_sprite_index_static,obj_ow_player,spr_paps_lw_cooking2,2],
	[cutscene_wait,0.8],
	[cutscene_sprite_index_static,obj_ow_player,spr_paps_lw_cooking2,1],
	[cutscene_newChat, dialogue_1],
	[cutscene_wait_for_dialogue,0],
	[cutscene_cam_zoom,1,false,20],
	[cutscene_play_sound, snd_txtsans, 10, false],
	[cutscene_wait,0.1],
	[cutscene_play_sound, snd_txtsans, 10, false],
	[cutscene_wait,0.1],
	[cutscene_play_sound, snd_txtsans, 10, false],
	[cutscene_wait,0.1],
	[cutscene_play_sound, snd_txtsans, 10, false],
	[cutscene_wait,0.5],
	[cutscene_change_variable, obj_ow_player, "animated", true],
	[cutscene_newChat, dialogue_2],
	[cutscene_wait_for_dialogue],
	[cutscene_wait,0.5],
	[cutscene_newChat, dialogue_3],
	[cutscene_wait_for_dialogue],
	[cutscene_wait,1],
	[cutscene_newChat, dialogue_4],
	[cutscene_wait_for_dialogue],
	[cutscene_wait,0.5],
	[cutscene_newChat, dialogue_5],
	[cutscene_wait_for_dialogue],
	[cutscene_end]
];

create_cutscene(t_scene_info);


