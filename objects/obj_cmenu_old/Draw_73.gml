if(live_call()) return live_result;
if(!obj_gamehandler.borderEnabled){
	display_set_gui_size(640, 480);
}  
draw_sprite_ext(spr_cemnubox,  0 , 641/2, _menu_stat_start_y,2.22,1.1,0,c_white,_menu_stat_alpha);
draw_sprite_ext(spr_cemnubox,  0 , 1000/2, _menu_opt_start_y-19,10,1.5,0,c_white,_menu_opt_alpha);

#region Menu Option Box
draw_set_font(fnt_main_slim);
#endregion

if(subState==2&&global.itempocketed[global.selecteditem]>0){
	if(!targetOverride){
		switch(targetSelection){
			case 0:	
			draw_sprite_ext(spr_cmenuselectbox,  0 , 350/2, _menu_stat_start_y-4,1.2,1,0,c_white,_menu_stat_alpha);
			break;
			case 1:	
			draw_sprite_ext(spr_cmenuselectbox,  1 , 1000/2, _menu_stat_start_y-4,0.95,1,0,c_white,_menu_stat_alpha);
			break;
		}
	}
}
#region Stats Box
#region Draw Papyrus info
draw_sprite_ext(spr_partyicons,0,20,_menu_stat_papicon_start_y,2.5,2.5,0,c_white,1);
draw_set_font(fnt_papyrus);
draw_text_ext_transformed_color(70,_menu_stat_papname_start_y, global.partynames[0],
0,240,1.5,2,0,c_white,c_white,c_white,c_white,1)
draw_set_font(fnt_main);
draw_text_ext_transformed_color(200,_menu_stat_hplabel_start_y, "HP",
0,240,1.7,1.7,0,c_white,c_white,c_white,c_white,1)
draw_text_ext_transformed_color(240,_menu_stat_hptxt_start_y, string(global.partyhp[0]._curr) +"/" + string(global.partyhp[0]._max),
0,240,1.7,1.7,0,c_white,c_white,c_white,c_white,1)
draw_sprite_ext(spr_pixel,0,x+235,y+_menu_stat_hpbox_start_y,global.partyhp[0]._max*1.25/1.5,14,0,hpdmg,1);
draw_sprite_ext(spr_pixel,0,x+235,y+_menu_stat_hpbox_start_y,global.partyhp[0]._curr*1.25/1.5,14,0,hpcolor[0],1);
#endregion
#region Draw Sans info
draw_sprite_ext(spr_partyicons,1,370,_menu_stat_sansicon_start_y,3,3,0,c_white,1);
draw_set_font(fnt_sans);
draw_text_ext_transformed_color(425,_menu_stat_papname_start_y, global.partynames[1],
0,240,2,2,0,c_white,c_white,c_white,c_white,1)
draw_set_font(fnt_main);
draw_text_ext_transformed_color(500,_menu_stat_hplabel_start_y,"HP",
0,240,1.7,1.7,0,c_white,c_white,c_white,c_white,1)
draw_text_ext_transformed_color(530,_menu_stat_hptxt_start_y, string(global.partyhp[1]._curr) +"/" + string(global.partyhp[1]._max),
0,240,1.7,1.7,0,c_white,c_white,c_white,c_white,1)
draw_sprite_ext(spr_pixel,0,x+535,y+_menu_stat_hpbox_start_y,global.partyhp[1]._max*40/1.5,15,0,hpdmg,1);
draw_sprite_ext(spr_pixel,0,x+535,y+_menu_stat_hpbox_start_y,global.partyhp[1]._curr*40/1.5,15,0,hpcolor[1],1);
#endregion
#endregion

switch(cmenuState){
	case (0 << 0): 
	draw_sprite_ext(spr_menuopttext,0,x+660,_menu_opttxt_start_y,2,2,0,c_white,optAlpha);
	draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,745,_menu_opticon0_start_y,2,2,0,c_white,optAlpha);
	//draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,330,_menu_opticon0_start_y+35,2.8,2.8,0,c_white,optAlpha);
//	draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,470,_menu_opticon0_start_y+35,2.8,2.8,0,c_white,optAlpha);
	//draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,610,_menu_opticon0_start_y+35,2.8,2.8,0,c_white,optAlpha);
	draw_menu_text_color(760, (65), "D$" + string(global.money+178) ,0,240,3,3,0, c_white, 1,fnt_main);
	break;
	case (1 << 0):
		if(cmenuActive)
		draw_sprite_ext(spr_menuopttext,_itembt_index,x+80,_menu_opttxt_start_y+40,2.6,2.6,0,c_white,optAlpha);
		draw_sprite_ext(spr_darkitembt_placeholder,2,200,_menu_opticon0_start_y+35,2.8,2.8,0,c_white,optAlpha);
		draw_sprite_ext(spr_darkequipbt_placeholder,1,330,_menu_opticon0_start_y+35,2.8,2.8,0,c_white,optAlpha);
		draw_sprite_ext(spr_darktaskbt_placeholder,1,470,_menu_opticon0_start_y+35,2.8,2.8,0,c_white,optAlpha);
		draw_sprite_ext(spr_darkconfigbt_placeholder,1,610,_menu_opticon0_start_y+35,2.8,2.8,0,c_white,optAlpha);
		draw_menu_text_color(760, (65), "D$" + string(global.money+178) ,0,240,3,3,0, c_white, 1,fnt_main);
		
		draw_menu_text_color(200, (130), invopt[0],0,240,2,2,0, subSelection==0 ? invopt_col[0] : invopt_col[2], 1,fnt_main);
		draw_menu_text_color(300, (130), invopt[1],0,240,2,2,0, subSelection==1 ? invopt_col[0] : invopt_col[2], 1,fnt_main);
		draw_menu_text_color(410, (130), invopt[2],0,240,2,2,0, subSelection==2 ? invopt_col[0] : invopt_col[2], 1,fnt_main);
		
		switch(subSelection){
			case 0:
				draw_sprite_ext(spr_heartsmall, 0, 170, 137, 2,2,0, c_white,optSoulAlpha);
			break;
			case 1:
				draw_sprite_ext(spr_heartsmall, 0, 275, 137, 2,2,0, c_white,optSoulAlpha);
			break;
			case 2:
				draw_sprite_ext(spr_heartsmall, 0, 380, 137, 2,2,0, c_white,optSoulAlpha);
			break;
		}
		
		switch(optSelection){
			case 0:
				draw_menu_text_color(200, (130), invopt[0],0,240,2,2,0, optSelection==0 ? invopt_col[1] : invopt_col[2], 1,fnt_main);
			break;
			case 1:
				draw_menu_text_color(300, (130), invopt[1],0,240,2,2,0, optSelection==1 ? invopt_col[1] : invopt_col[2], 1,fnt_main);
			break;
			case 2:				
				draw_menu_text_color(410, (130), invopt[2],0,240,2,2,0, optSelection==2 ? invopt_col[1] : invopt_col[2], 1,fnt_main);
			break;
		}
		
		//	draw_set_color(c_gray);
		var inventoryToShow = selectedInventory
		switch inventoryToShow
		{
			case 0:
				draw_set_font(fnt_main);
				for (var i=0; i<6; i++){
					item_name();
					draw_set_font(fnt_main);
					draw_text_ext_transformed_color(120, (170 + (32*i)),global.itemname[(i *2)],0,240,2,2,0,c_gray,c_gray,c_gray,c_gray,1)
					draw_text_ext_transformed_color(190+180, (170 + (32*i)),global.itemname[(i *2) + 1],0,240,2,2,0,c_gray,c_gray,c_gray,c_gray,1)
				}			
			break;
			case 1:
					draw_sprite_ext(spr_heartsmall, 0, optSoulSX,optSoulSY, 2,2,0, c_white,1);
					draw_set_font(fnt_main);
					draw_text_ext_transformed_color(x+20,y+10,item_desc_simple(global.selecteditem),20,400,2,2,0,c_white,c_white,c_white,c_white,1)
				for (var i=0; i<6; i++){
					item_name();
					draw_set_font(fnt_main);
					draw_text_ext_transformed_color(120, (170 + (32*i)),global.itemname[(i *2)],0,240,2,2,0,c_white,c_white,c_white,c_white,1)
					draw_text_ext_transformed_color(190+180, (170 + (32*i)),global.itemname[(i *2) + 1],0,240,2,2,0,c_white,c_white,c_white,c_white,1)
				}				
			break;	
		}
	break;
	
}