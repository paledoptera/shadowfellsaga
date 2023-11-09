
if keyboard_check(vk_f12)
{
	surface_save(application_surface, "screenshot_window.png")
	//take a screenshot of all entities in room
	var s = surface_create(room_width, room_height);
	
	surface_set_target(s)
	draw_clear_alpha(0, 0)

	with all
	{
		var land = layer_tilemap_get_id("Tiles_Land")
		var land2 = layer_tilemap_get_id("Tiles_Land_2")
		var land3 = layer_tilemap_get_id("Tiles_Land_2_1")
		var land4 = layer_tilemap_get_id("Tiles_Land_1")
		//draw_tilemap(land,0,0)
		//draw_tilemap(land2,0,0)
		//draw_tilemap(land3,0,0)
		//draw_tilemap(land4,0,0)
		if sprite_index != -1 and object_get_visible(object_index) and layer != layer_get_id("Collision") {draw_self()}
	}

	surface_reset_target()

	surface_save(s, "screenshot_fullroom.png")
	surface_free(s)
}