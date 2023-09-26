/// @description Check for no longer selected
if mouse_check_button(mb_left) {
	var button_x = x+sprite_width*value_;
	var button_y = y;
	var button_radius = sprite_get_width(spr_slider_button);
	if point_in_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), button_x, button_y, button_radius) {
		selected_ = true;
	}
}

if !mouse_check_button(mb_left) {
	selected_ = false;
}

if selected_ {
	value_ = clamp((device_mouse_x_to_gui(0)-x)/sprite_width, 0, max_value_);
	event_user(0);
}
