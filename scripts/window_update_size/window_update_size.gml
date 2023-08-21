function window_update_size() {
	var size = global.windowSize;
	
	window_set_size(size.w, size.h);
	with (obj_gamehandler) alarm[1] = 1;
}