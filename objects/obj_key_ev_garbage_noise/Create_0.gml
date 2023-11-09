audio_play_sound(snd_phone, 10, false)
#region Dialogue Data
#region Lines
dialogue_0 = 
[
    {char : "gen", position : "bottom",
	 line : "* (You tried to call on the Cell&Phone,)",
	 runcode : function() {audio_play_sound(snd_smile, 10, false);}},
]
dialogue_1 = 
[
    {char : "gen", position : "bottom",
	 line :"* But it doesn't seem to be&working.",
	},
]
#endregion
#endregion
t_scene_info = [
	[cutscene_newChat,dialogue_0],
	[cutscene_wait,6],
	[cutscene_wait_for_dialogue],
	[cutscene_newChat,dialogue_1],
	[cutscene_wait_for_dialogue],
	[cutscene_end]
]

create_cutscene(t_scene_info);