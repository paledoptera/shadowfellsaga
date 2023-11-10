global.canusemenu=true;
flag_set(global.flags,"world",1);

t_scene_info = [
	[cutscene_move_camera, 320, 240, false, 99999],
	[cutscene_sprite_create, 152, 440, "Instances", spr_papyrus_gettingup1,0,0,false],
	[cutscene_sprite_create, 152, 440, "Instances", spr_papyrus_groundpieces1,0,0,false],
	[cutscene_move_camera, 320, 550, false, 1],
	[cutscene_wait,3],
	[cutscene_wait,1.1],
	[cutscene_end]
];

create_cutscene(t_scene_info);