dialogue[0] = str_set_loc("OF COURSE, THERE'S&NOTHING MORE CULINARILY&INSPIRING THAN",  "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_44_0")
dialogue_port[0] = port_chefp;

dialogue1[0] = str_set_loc("FINE ART!",  "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_45_0")

scene_info = [
	[cutscene_newChat,dialogue, dialogue_port,fnt_papyrus,snd_txtpapyrus,1,"top"],
	[cutscene_wait_for_dialogue],
	[cutscene_newChat,dialogue1, dialogue_port,fnt_papyrus,snd_txtpapyrus,1,"top"],
	[cutscene_wait_for_dialogue],
	[cutscene_end]
]