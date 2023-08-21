function window_get_size() {
	if (global.border==0) return {w: 640, h: 480};
	else return {w: 960, h: 540};
}