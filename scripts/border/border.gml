/// Enables or disables the border system
/// @arg enabled - When enabled, change the game resolution and allow the usage of borders
function border_setEnabled(enabled){
		///@arg enabled
		if(enabled){
			window_set_size(960,540);	
			BORDER._enabled=true;
		} else {
			window_set_size(RES_W,RES_H);	
			BORDER._enabled=false;
			if(sprite_exists(BORDER._sprite)){
			sprite_flush(BORDER._sprite);
			BORDER._sprite=-1;
		}
		if(sprite_exists(BORDER._sprite_previous)){
			sprite_flush(BORDER._sprite_previous);
			BORDER._sprite_previous=-1;
		}
	}
	return true;
}