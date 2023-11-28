#region DIALOGUE DATA
dialogue_0 = 
[
    {char : "papy", position : "top",
	 line : "THAT'S A LONG &WAY DOWN...",},
    {line : "I CERTAINLY HOPE &I DON'T GET CHASED &OFF OF THIS!"}, 
]

scene_info = [
	[cutscene_change_player_state, "inactive"],
	[cutscene_move_camera, -200, 0, true, 3],
	[cutscene_newChat, dialogue_0],
	[cutscene_wait_for_dialogue],
	[cutscene_move_camera, 200, 0, true, 5],
	[cutscene_change_player_state, "active"],
	[cutscene_end],
];