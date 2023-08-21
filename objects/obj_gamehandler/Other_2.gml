room_goto_next();

border_setEnabled(borderEnabled);
if(borderEnabled){
	if global.flush_textures
		texture_flush("BORDERS");
}
