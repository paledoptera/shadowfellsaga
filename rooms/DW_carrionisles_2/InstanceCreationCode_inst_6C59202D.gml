dialogue[0] = "* hey, a saloon."
dialogue_port[0] = port_sans_lookup;

dialogue2[0] = "OOH, BRILLIANT &OBSERVATION SANS!"
dialogue_port2[0] = port_papy;

dialogue25[0] = "THEY MUST BE IN &BUSINESS, LOOK &AT THAT SMOKE!"
dialogue_port25[0] = port_papy_confident;

dialogue3[0] = "* reminds me of &home already."
dialogue_port3[0] = port_sans_wink;

dialogue4[0] = "SANS!!! KEEP THE &SARCASM TO A &MINIMUM."
dialogue_port4[0] = port_papy_displeased;
dialogue4[1] = "FIRST IMPRESSIONS &ARE IMPORTANT!! &IF WE DON'T-~"
dialogue_port4[1] = port_papy_sly;

dialogue5[0] = "* Welll well well... &Just WHAT do we &gawt here?"

dialogue6[0] = "* Hey bing bong &you're doing &a bad job"
dialogue_port6[0] = port_semi;




scene_info = [
	[cutscene_sprite_index_static,obj_ow_p_follower,spr_sans_ow_idle,1],
	[cutscene_sprite_index_static,obj_ow_player,spr_paps_ow_idle,1],
	[cutscene_wait,0.5],
	[cutscene_sprite_index_static,obj_ow_p_follower,spr_sans_ow_move,6],
	[cutscene_sprite_index_static,obj_ow_player,spr_paps_ow_move,6],
	[cutscene_move_instances_2, obj_ow_player, 4000-75, 420, false, 12, obj_ow_p_follower, 3930-75, 425, false, 12],
	[cutscene_sprite_index_static,obj_ow_p_follower,spr_sans_ow_idle,1],
	[cutscene_sprite_index_static,obj_ow_player,spr_paps_ow_idle,1],
	[cutscene_move_camera, 130, 0, true, 1],
	[cutscene_wait,1],
	[cutscene_newChat, dialogue, dialogue_port, fnt_sans, snd_txtsans, 1, "bottom"],
	[cutscene_wait_for_dialogue],
	[cutscene_newChat, dialogue2, dialogue_port2, fnt_papyrus, snd_txtpapyrus, 1, "bottom"],
	[cutscene_wait_for_dialogue],
	[cutscene_move_camera, 0, -60, true, 3],
	[cutscene_newChat, dialogue25, dialogue_port25, fnt_papyrus, snd_txtpapyrus, 1, "bottom"],
	[cutscene_wait_for_dialogue],
	[cutscene_move_camera, 0, 60, true, 3],
	[cutscene_newChat, dialogue3, dialogue_port3, fnt_sans, snd_txtsans, 1, "bottom"],
	[cutscene_wait_for_dialogue],
	[cutscene_newChat, dialogue4, dialogue_port4, fnt_papyrus, snd_txtpapyrus, 1, "bottom"],
	[cutscene_wait_for_dialogue],
	[cutscene_musicarea_fadeout,0],
	[cutscene_play_sound,snd_revolver, 10, false],
	[cutscene_wait,3],
	[cutscene_newChat, dialogue5, "none", fnt_semi, snd_txtsemi, 1, "bottom"],
	[cutscene_sprite_index_static,obj_ow_p_follower,spr_sans_ow_idle,0],
	[cutscene_sprite_index_static,obj_ow_player,spr_paps_ow_idle,0],
	[cutscene_wait_for_dialogue],
	[cutscene_move_camera, 90, 0, true, 0.5],
	[cutscene_wait,0.4],
	[cutscene_music_play, mus_sheriff, true, 0.65, 0],
	[cutscene_newChat, dialogue6, dialogue_port6, fnt_semi, snd_txtsemi, 1, "bottom"],
	[cutscene_wait_for_dialogue],
	//[cutscene_newChat, dialogue2, dialogue_port2, fnt_papyrus, snd_txtpapyrus],
	//[cutscene_wait_for_dialogue],
	[cutscene_end],
];