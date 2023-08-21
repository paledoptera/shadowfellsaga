function draw_text_transformed_shadow_ext(xx,yy,str,sep,w,sw,xscale,yscale,angle,color,alpha=1,font){
	///@arg xx - x position
	///@arg yy - y position
	///@arg str - string
	///@arg sep - string seperation
	///@arg w - string width
	///@arg sw - shadow width
	///@arg xscale
	///@arg yscale
	///@arg angle
	///@arg color
	///@arg alpha
	///@arg font
	var color_shadow=make_color_rgb(49,49,79)	
	
	if(color==c_white){
		color_shadow=make_color_rgb(49,49,79)	
	} else if(color!=c_white&&color!=c_gray){
		color_shadow=make_color_rgb(76,76,0);
	} else if(color==c_gray){
		color_shadow=c_dkgray;
	}
	
	draw_set_font(font);
	draw_text_ext_transformed_color(
	xx+4,yy+4,str,sep,w-sw,
	xscale,xscale,angle,color_shadow,
	color_shadow,color_shadow,color_shadow,
	alpha);
	draw_text_ext_transformed_color(
	xx,yy,str,sep,w,
	xscale,yscale,angle,color,
	color,color,color,alpha);
}