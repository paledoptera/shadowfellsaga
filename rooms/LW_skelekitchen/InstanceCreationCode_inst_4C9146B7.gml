dialogue[0] = str_set_loc("ALAS, COLD SHELVES&STACKED WITH&FRESH INGREDIENTS!",  "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_35_0")
dialogue_port[0] = port_chefp;

dialogue1[0] = str_set_loc("WELL, EXCEPT FOR...&A CHIPS PACKET&AND A SAD SOCK?!",  "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_36_0")

dialogue2[0] = str_set_loc("SANS! GET YOUR&SOCK OUT OF&THE FRIDGE!!!",  "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_37_0")

dialogue3[0] = str_set_loc("* why not?",  "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_38_0")
dialogue_port1[0] = port_sans;

dialogue4[0] = str_set_loc("* don't tell me...",  "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_39_0")
dialogue_port2[0] = port_sans_joking;

dialogue5[0] = str_set_loc("* you're gettin'&cold feet?",  "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_40_0")
dialogue_port6[0] = port_sans_wink;

dialogue6[0] = str_set_loc("GRRR!!!",  "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_41_0")

scene_info = [
		[cutscene_newChat,dialogue, dialogue_port,fnt_papyrus,snd_txtpapyrus,1,"top"],
		[cutscene_wait_for_dialogue],
		[cutscene_newChat,dialogue1, dialogue_port,fnt_papyrus,snd_txtpapyrus,1,"top"],
		[cutscene_wait_for_dialogue],
		[cutscene_newChat,dialogue2, dialogue_port,fnt_papyrus,snd_txtpapyrus,1,"top"],
		[cutscene_wait_for_dialogue],
		[cutscene_newChat,dialogue3, dialogue_port1,fnt_sans,snd_txtsans,1,"top"],
		[cutscene_wait_for_dialogue],
		[cutscene_newChat,dialogue4, dialogue_port2,fnt_sans,snd_txtsans,1,"top"],
		[cutscene_wait_for_dialogue],
		[cutscene_newChat,dialogue5, dialogue_port6,fnt_sans,snd_txtsans,1,"top"],
		[cutscene_wait_for_dialogue],
		[cutscene_newChat,dialogue6, dialogue_port,fnt_papyrus,snd_txtpapyrus,1,"top"],
		[cutscene_wait_for_dialogue],
		[cutscene_end],
]