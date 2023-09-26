///@arg xx
///@arg yy
///@arg xxscale
///@arg yyscale
///@arg angle
///@arg color
///@arg string
///@arg font
function draw_text_color_ext(_xx,_yy,_xxscale,_yyscale,_angle,_color,_string,_font){
	draw_set_color(_color)
	draw_set_font(_font)
	draw_text_transformed(_xx,_yy,_string,_xxscale,_yyscale,_angle)
}