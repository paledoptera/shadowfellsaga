if(!obj_gamehandler.borderEnabled){
	display_set_gui_size(global.gui_res_w*2, global.gui_res_h*2);
}  
draw_set_alpha(image_alpha);
draw_set_font(font);
draw_text(x,y,string_hash_to_newline(msg));
draw_set_alpha(1);
image_alpha -= 0.1
if (image_alpha < 0){
	instance_destroy()	
}