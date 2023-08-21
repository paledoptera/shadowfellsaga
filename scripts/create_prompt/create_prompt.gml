/// Serves as the main way to create input prompts in our battle rhythm game
/// @arg self_x
/// @arg self_y
/// @arg scale_x
/// @arg scale_y
function create_prompt(_xx,_yy,_scale_x,_scale_y){
	var _img_index = -1;
	switch(global.currentActiveTurn){
		case "paps":
			_img_index=0;
		break;
		case "sans":
			_img_index=1;
		break;
	}
	draw_sprite_ext(spr_btpress_notice,_img_index,_xx,_yy,_scale_x,_scale_y,0,c_white,1);
}