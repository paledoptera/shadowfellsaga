// Manually sets v-sync on or off, some systems.
function display_set_vsync_safe(sync){
	display_reset(0,sync)
	ctrl_global.alarm[0]=2
	return;
}