var WIDTH = 640;
var HEIGHT = 480;
var rES_SCALE = _game_res_scale;
var PRECISION = _game_res_precision;

RenderConfiguration.set_resolution( WIDTH, HEIGHT );
RenderConfiguration.set_max_scale( rES_SCALE );
RenderConfiguration.set_precision( PRECISION );


room_goto_next();
input_player_import()

if(borderEnabled){
	if global.flush_textures
		texture_flush("BORDERS");
} 