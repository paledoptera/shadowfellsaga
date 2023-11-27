function window_update_size() {
	var size = global.windowSize;
	
	window_set_size(size.w, size.h);
	with (ctrl_global) alarm[1] = 1;
}