global.canusemenu=true;
flag_set(global.flags,"world",1);

t_scene_info = [
	[cutscene_move_camera, 320, 240, false, 99999],
	[cutscene_flag_set,global.flags,"world",1],
	[cutscene_move_camera, 320, 550, false, 1],
	[cutscene_wait,1.1],
	[cutscene_end]
];

create_cutscene(t_scene_info);