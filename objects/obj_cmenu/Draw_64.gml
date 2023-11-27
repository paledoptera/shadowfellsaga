if (live_call()) return live_result;
display_set_gui_size(global.gui_res_w, global.gui_res_h);


execute_tween(id, "menu_bkg_alpha", 1, "easeOut", 0.2, false);
execute_tween(id, "menu_portraits_alpha", 1, "easeOut", 0.2, false);
execute_tween(id, "menu_portraits_y", 0, "easeInOut", 0.4, false);
execute_tween(id, "menu_portraits_y", 0, "easeOut", 0.2, false);

if input.target = "cmenu"
{
	if input.cancel_pressed {instance_destroy();}
	if input.menu_pressed {instance_destroy();}
}

menu_item_scale[0] = 1;


draw_sprite_ext(spr_cmenu_bkg,0,0,0,2,2,0,c_white,menu_bkg_alpha/3+menu_bkg_alpha/3+0.25);
draw_sprite_ext(spr_cmenu_bkg,1,0,0+menu_portraits_y,2,2,0,c_white,menu_portraits_alpha);

draw_text_transformed_shadow(138,28+menu_portraits_y,"PAPYRUS",1.5,1.5,0,c_white,1,fnt_papyrus)
draw_text_transformed_shadow(172,53+menu_portraits_y,"LV 1",1,1,0,c_white,1,fnt_main)
draw_text_transformed_shadow(137,70+menu_portraits_y,"HP:",1.5,1.5,0,c_white,1,fnt_main)
draw_text_transformed_shadow(200,71+menu_portraits_y,"50/50",1.2,1.2,0,c_white,1,fnt_battlenumbers)

draw_text_transformed_shadow(463,21+menu_portraits_y,"sans",2,2,0,c_white,1,fnt_sans)
draw_text_transformed_shadow(474,53+menu_portraits_y,"LV 1",1,1,0,c_white,1,fnt_main)
draw_text_transformed_shadow(435,70+menu_portraits_y,"HP:",1.5,1.5,0,c_white,1,fnt_main)
draw_text_transformed_shadow(498,71+menu_portraits_y,"30/30",1.2,1.2,0,c_white,1,fnt_battlenumbers)


draw_sprite_ext(spr_cmenu_bkg,2,0,0,menu_item_scale[0]*2,menu_item_scale[0]*2,0,c_white,menu_bkg_alpha);
