dialogue[0] = "HELLOOOO??? &IS ANYONE HERE????"
dialogue_port[0] = port_papy_curious_alt;


scene_info = [
	[cutscene_sprite_create_on_object, obj_ow_player, "Instances", spr_paps_shout2, 0, 1, true],
	[cutscene_newChat, dialogue, dialogue_port, fnt_papyrus, snd_txtpapyrus_echo, 1, "dynamic"],
	[cutscene_wait_for_dialogue],
	[cutscene_instance_destroy, obj_ow_object_temp2],
	[cutscene_end],
];