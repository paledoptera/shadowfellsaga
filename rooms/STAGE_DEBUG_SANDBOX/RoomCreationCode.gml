#region Dialogue Data
dialogue[0]="TESTING 1"
dialogue_port[0]= port_chefp;


flag_set(global.flags,"world",1);

dialogue1[0] = "TESTING 2"
//dialogue_port[0]= port_chefp;

#endregion

BORDER._sprite=-1;

//audio_play_sound(mus_cooking,10,true,0.75);
audio_group_load(Talksounds);

//newChat(dialogue,dialogue_port,fnt_papyrus, snd_txtpapyrus)

t_scene_info = [
	[cutscene_newChat, dialogue, dialogue_port, fnt_papyrus, snd_txtpapyrus, 1, "bottom"],
	[cutscene_wait_for_dialogue],
	[cutscene_newChat, dialogue1, dialogue_port, fnt_papyrus, snd_txtpapyrus, 1, "bottom"],
	[cutscene_wait_for_dialogue],
	[cutscene_end],
];

create_cutscene(t_scene_info);


