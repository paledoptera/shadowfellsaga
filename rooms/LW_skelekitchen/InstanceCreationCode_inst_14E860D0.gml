dialogue[0] = str_set_loc("THAT PANS GETTING&REALLY REALLY HOT!!!",  "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_42_0")
dialogue_port[0] = port_chefp;

dialogue1[0] = str_set_loc("THAT JUST MEANS&THE FOOD WILL&COOK QUICKER, RIGHT?",  "COOKING_WITH_PAPYRUS_FIRSTPASS_slash_43_0")

scene_info = [
	[cutscene_newChat,dialogue, dialogue_port,fnt_papyrus,snd_txtpapyrus,1,"top"],
	[cutscene_wait_for_dialogue],
	[cutscene_newChat,dialogue1, dialogue_port,fnt_papyrus,snd_txtpapyrus,1,"top"],
	[cutscene_wait_for_dialogue],
	[cutscene_end]
]