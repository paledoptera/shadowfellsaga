dialogue[0] = "IS ANYONE HERE &AWARE..."
dialogue_port[0] = port_papy_sly;
dialogue[1] = "THAT THEY'RE LIVING &UNDER MY KITCHEN?"
dialogue_port[1] = port_papy_sly;

dialogue2[0] = "CURSES, SEEMS LIKE &THE TOWN'S EMPTY."
dialogue_port2[0] = port_papy_displeased;

dialogue3[0] = "* i dunno, would they &really just leave &everythin' as it is?"
dialogue_port3[0] = port_sans_wary;

dialogue4[0] = "...LET'S KEEP &LOOKING."
dialogue_port4[0] = port_papy_sly;


scene_info = [
	[cutscene_sprite_create_on_object, obj_ow_player, "Instances", spr_paps_shout3, 0, 1, true],
	[cutscene_newChat, dialogue, dialogue_port, fnt_papyrus, snd_txtpapyrus_echo, 1, "dynamic"],
	[cutscene_wait_for_dialogue],
	[cutscene_sprite_index_static, obj_ow_object_temp2, spr_paps_shout3, 1], 
	[cutscene_wait, 2],
	[cutscene_sprite_index_static, obj_ow_object_temp2, spr_paps_armcross, 0],
	[cutscene_newChat, dialogue2, dialogue_port2, fnt_papyrus, snd_txtpapyrus, 1, "dynamic"],
	[cutscene_wait_for_dialogue],
	[cutscene_sprite_index_static, obj_ow_p_follower, spr_sans_ow_idle, 6], 
 	[cutscene_newChat, dialogue3, dialogue_port3, fnt_sans, snd_txtsans, 1, "dynamic"],
	[cutscene_wait_for_dialogue],
	[cutscene_sprite_index_static, obj_ow_object_temp2, spr_paps_ow_idle, 4],
	[cutscene_newChat, dialogue4, dialogue_port4, fnt_papyrus, snd_txtpapyrus, 1, "dynamic"],
	[cutscene_wait_for_dialogue],
	[cutscene_instance_destroy, obj_ow_object_temp2],
	[cutscene_end],
];