dialogue[0] = "I STILL CAN'T BELIEVE &YOU DAMAGED THE &BOAT, BROTHER."
dialogue_port[0] = port_papy_displeased;

dialogue2[0] = "* you told me to &drop the anchor."
dialogue_port2[0] = port_sans_joking;

dialogue3[0] = "INTO THE WATER!!! &NOT ONTO THE &FLOORBOARDS!!!"
dialogue_port3[0] = port_papy_goofycry;

dialogue4[0] = "* hey, you never &said that."
dialogue_port4[0] = port_sans_closedeyes

dialogue5[0] = "* Can you two go bicker &somewhere else?! &I'm busy fixing this up."
dialogue_port5[0] = port_ferry_angry

scene_info = [
	[cutscene_sprite_index_static,obj_ow_p_follower,spr_sans_ow_idle,5],
	[cutscene_sprite_index_static,obj_ow_player,spr_paps_ow_idle,5],
	[cutscene_move_instances_2,obj_ow_player,1020,530,false,13,obj_ow_p_follower,969,464,false,13],
	[cutscene_wait, 0.5],
	[cutscene_move_camera, -100, 0, true, 3],
	[cutscene_newChat, dialogue, dialogue_port, fnt_papyrus, snd_txtpapyrus, 1, "dynamic"],
	[cutscene_wait_for_dialogue],
 	[cutscene_newChat, dialogue2, dialogue_port2, fnt_sans, snd_txtsans,1, "dynamic"],
	[cutscene_wait_for_dialogue],
	[cutscene_newChat, dialogue3, dialogue_port3, fnt_papyrus, snd_txtpapyrus, 1, "dynamic"],
	[cutscene_wait_for_dialogue],
	[cutscene_newChat, dialogue4, dialogue_port4, fnt_sans, snd_txtsans, 1, "dynamic"],
	[cutscene_wait_for_dialogue],
	[cutscene_newChat, dialogue5, dialogue_port5, fnt_main, snd_txt, 1, "dynamic"],
	[cutscene_wait_for_dialogue],
	[cutscene_move_camera, 100, 0, true, 5],
	[cutscene_end],
];