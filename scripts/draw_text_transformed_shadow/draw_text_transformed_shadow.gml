function draw_text_transformed_shadow(xx,yy,str,xscale,yscale,angle,color,alpha=1,font,shadow_color=make_color_rgb(30,30,30)){
	///@arg xx - x position
	///@arg yy - y position
	///@arg str - string
	///@arg xscale
	///@arg yscale
	///@arg angle
	///@arg color
	///@arg alpha
	///@arg font
	///@arg shadow_color
	
	draw_set_font(font);
	draw_text_transformed_color(xx+2.5,yy+2.5,str,xscale,yscale,angle,shadow_color,shadow_color,shadow_color,shadow_color,alpha);
	draw_text_transformed_color(xx,yy,str,xscale,yscale,angle,color,color,color,color,alpha);
}

function draw_text_transformed_gradient_shadow(xx,yy,str,xscale,yscale,angle,color1,color2,color3,color4,alpha=1,font,shadow_color=make_color_rgb(30,30,30)){
	///@arg xx - x position
	///@arg yy - y position
	///@arg str - string
	///@arg xscale
	///@arg yscale
	///@arg angle
	///@arg color
	///@arg color2
	///@arg color3
	///@arg color4
	///@arg alpha
	///@arg font
	///@arg shadow_color
	
	draw_set_font(font);
	draw_text_transformed_color(xx+2.5,yy+2.5,str,xscale,yscale,angle,shadow_color,shadow_color,shadow_color,shadow_color,alpha);
	draw_text_transformed_color(xx,yy,str,xscale,yscale,angle,color1,color2,color3,color4,alpha);
}