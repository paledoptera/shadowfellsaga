// Used by lang_set_draw_font()
// Returns a font stored in your language
function get_font(font) {
    return ds_map_find_value(global.font_map, font);
}
