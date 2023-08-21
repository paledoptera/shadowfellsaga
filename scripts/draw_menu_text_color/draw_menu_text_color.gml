// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_menu_text_color(xx,yy,str,sep,width,xxscale,yyscale,rotation,color,alpha=1,font){
	
	draw_set_font(font);
	draw_text_ext_transformed_color(xx,yy,str,sep,width,xxscale,yyscale,
	rotation,color,color,color,color,alpha)
}