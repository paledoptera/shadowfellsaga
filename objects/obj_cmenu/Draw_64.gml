if(live_call()) return live_result;
if(!obj_gamehandler.borderEnabled){
	display_set_gui_size(856, 480);
}  
draw_sprite_ext(spr_cemnubox,  0 , 640/2, _menu_stat_start_y+7,4,0.9,0,c_white,_menu_opt_alpha);
draw_sprite_ext(spr_cemnubox,  0 , 640/2, _menu_opt_start_y-18,4,1.01,0,c_white,_menu_stat_alpha);
draw_sprite_ext(spr_cemnuline,0,641/2,_menu_stat_start_y-25,4,2.22,0,c_white,_menu_stat_alpha);

if(subState==2&&global.itempocketed[global.selecteditem]>=0&&optSelection==0){
	if(!targetOverride){
		switch(targetSelection){
			case 0:	
			draw_sprite_ext(spr_cmenuselectbox,  0 , 440/2, _menu_stat_start_y,1.5,0.8,0,c_white,_menu_stat_alpha);
			break;
			case 1:	
			draw_sprite_ext(spr_cmenuselectbox,  1 , 1275/2, _menu_stat_start_y,1.5,0.8,0,c_white,_menu_stat_alpha);
			break;
		}
	}
}
#region Stats Box
#region Draw Papyrus info
draw_sprite_ext(spr_partyicons,0,120,_menu_stat_papicon_start_y+13,2,2,0,c_white,_menu_stat_alpha);
draw_sprite_ext(spr_partynames,0,160,_menu_stat_papname_start_y+13,1,1,0,c_white,_menu_stat_alpha);
draw_sprite_ext(spr_hptext,0,270,_menu_stat_hplabel_start_y+14,1.5,1.5,0,c_white,_menu_stat_alpha);
	#region DRAW PAPS HP TEXT BITMAP
	draw_sprite_ext(spr_drbttext_addins,0,340,_menu_stat_papname_start_y+4,1.4,1.4,0,c_white,_menu_stat_alpha);
	var STR=string(global.partyhp[0]._curr);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext)*1.4;
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+310,_menu_stat_papname_start_y+5,1.4,1.4,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	
	var STR=string(global.partyhp[0]._max);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext)*1.4;
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+380,_menu_stat_papname_start_y+5,1.4,1.4,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	#endregion
	#region DRAW PAPS HP BAR
	draw_sprite_ext(spr_pixel,0,x+300,y+_menu_stat_hpbox_start_y+7,global.partyhp[0]._max*1.25/1.5,14,0,hpdmg,_menu_stat_alpha);
	draw_sprite_ext(spr_pixel,0,x+300,y+_menu_stat_hpbox_start_y+7,global.partyhp[0]._curr*1.25/1.5,14,0,hpcolor[0],_menu_stat_alpha);
	#endregion
#endregion
#region Draw Sans info
draw_sprite_ext(spr_partyicons,1,440,_menu_stat_sansicon_start_y+10,2.5,2.5,0,c_white,_menu_stat_alpha);
draw_sprite_ext(spr_partynames,1,490,_menu_stat_papname_start_y+13,1,1,0,c_white,_menu_stat_alpha);
#region DRAW SANS HP TEXT BITMAP
draw_sprite_ext(spr_hptext,0,570,_menu_stat_hplabel_start_y+14,1.5,1.5,0,c_white,_menu_stat_alpha);
draw_sprite_ext(spr_drbttext_addins,0,607,_menu_stat_papname_start_y+4,1.4,1.4,0,c_white,_menu_stat_alpha);
	var STR=string(global.partyhp[1]._curr);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext)*1.4;
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+600,_menu_stat_papname_start_y+5,1.4,1.4,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	
	var STR=string(global.partyhp[1]._max);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext)*1.4;
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+633,_menu_stat_papname_start_y+5,1.4,1.4,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
#endregion
#region DRAW SANS HP BAR
draw_sprite_ext(spr_pixel,0,x+600,y+_menu_stat_hpbox_start_y+7,global.partyhp[1]._max*40/0.95,15,0,hpdmg,_menu_stat_alpha);
draw_sprite_ext(spr_pixel,0,x+600,y+_menu_stat_hpbox_start_y+7,global.partyhp[1]._curr*40/0.95,15,0,hpcolor[1],_menu_stat_alpha);
#endregion
#endregion
#endregion

switch(cmenuState){
	#region BASIC SELECTION
	case (0 << 0): 
	draw_sprite_ext(spr_menuopttext,_opt_index,x+100,_menu_opttxt_start_y-8,2,2,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,210,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,320,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,430,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,540,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
	draw_menu_text_color(640, (_menu_opticon0_start_y-5), "D$" + string(global.money) ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main);
	break;
	#endregion
	#region INVENTORY
	case (1 << 0):
		#region DRAW OPTIONS
		if(cmenuActive)
			if selectedInventory == 0{
			draw_sprite_ext(spr_menuopttext,_opt_index,x+100,_menu_opttxt_start_y-8,2,2,0,c_white,_menu_stat_alpha);
			draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,210,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
			draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,320,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
			draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,430,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
			draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,540,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
			draw_menu_text_color(640, (_menu_opticon0_start_y-5), "D$" + string(global.money) ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main);
			}
		draw_sprite_ext(spr_itembox,0,440,230,2,2.1,0,c_white,1);
		draw_menu_text_color(300, (110), invopt[0],0,220,2,2,0, subSelection==0 ? invopt_col[0] : invopt_col[2], 1,fnt_main);
		draw_menu_text_color(420, (110), invopt[1],0,220,2,2,0, subSelection==1 ? invopt_col[0] : invopt_col[2], 1,fnt_main);
		draw_menu_text_color(550, (110), invopt[2],0,220,2,2,0, subSelection==2 ? invopt_col[0] : invopt_col[2], 1,fnt_main);
		
		switch(subSelection){
			case 0:
				draw_sprite_ext(spr_heartsmall, 0, 270, 117, 2,2,0, c_white,optSoulAlpha);
			break;
			case 1:
				draw_sprite_ext(spr_heartsmall, 0, 390, 117, 2,2,0, c_white,optSoulAlpha);
			break;
			case 2:
				draw_sprite_ext(spr_heartsmall, 0, 520, 117, 2,2,0, c_white,optSoulAlpha);
			break;
		}
		
		switch(optSelection){
			case 0:
				draw_menu_text_color(300, (110), invopt[0],0,240,2,2,0, optSelection==0 ? invopt_col[1] : invopt_col[2], 1,fnt_main);
			break;
			case 1:
				draw_menu_text_color(420, (110), invopt[1],0,240,2,2,0, optSelection==1 ? invopt_col[1] : invopt_col[2], 1,fnt_main);
			break;
			case 2:				
				draw_menu_text_color(550, (110), invopt[2],0,240,2,2,0, optSelection==2 ? invopt_col[1] : invopt_col[2], 1,fnt_main);
			break;
		}
		#endregion
		
		//	draw_set_color(c_gray);
		#region DRAW INVENTORY 
		var inventoryToShow = selectedInventory
		switch inventoryToShow
		{
			case 0:
				draw_set_font(fnt_main);
				for (var i=0; i<6; i++){
					item_name();
					draw_set_font(fnt_main_sm);
					draw_text_ext_transformed_color(260, (160 + (32*i)),global.itemname[(i *2)],0,240,2,2,0,c_gray,c_gray,c_gray,c_gray,1)
					draw_text_ext_transformed_color(210+280, (160 + (32*i)),global.itemname[(i *2) + 1],0,240,2,2,0,c_gray,c_gray,c_gray,c_gray,1)
				}			
			break;
			case 1:
					draw_sprite_ext(spr_heartsmall, 0, optSoulSX+120,optSoulSY-5, 2,2,0, c_white,1);
					draw_set_font(fnt_main_sm);
					draw_text_ext_transformed_color(x+20,y+10,item_desc_simple(global.selecteditem),20,400,1.5,1.5,0,c_white,c_white,c_white,c_white,1)
				for (var i=0; i<6; i++){
					item_name();
					draw_set_font(fnt_main_sm);
					draw_text_ext_transformed_color(260, (160 + (32*i)),global.itemname[(i *2)],0,240,2,2,0,c_white,c_white,c_white,c_white,1)
					draw_text_ext_transformed_color(210+280, (160 + (32*i)),global.itemname[(i *2) + 1],0,240,2,2,0,c_white,c_white,c_white,c_white,1)
				}				
			break;	
			case 2:
				// TO BE IMPLEMENTED - KEY ITEMS
			break;
		}
		#endregion
	break;
	#endregion
	#region EQUIP
	case (1<<1):
		#region DRAW THE BASICS
		draw_sprite_ext(spr_menuopttext,_opt_index,x+100,_menu_opttxt_start_y-8,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,210,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,320,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,430,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,540,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_menu_text_color(640, (_menu_opticon0_start_y-5), "D$" + string(global.money) ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main);
		
		draw_sprite_ext(spr_equipbox,charSelection == 0 ? 0 : 1,440,245,2,2,0,c_white,1);
		#endregion
		
		switch(charSelection){
			case 0:
					draw_sprite_ext(spr_charicons,0,300,140,3,3,0,c_gray,1);
					draw_sprite_ext(spr_charicons,1,200,140,3,3,0,c_white,1);
					draw_sprite_ext(spr_heartsmallarrow,image_index/10,210,110,2,2,0,c_white,1);
					draw_menu_text_color(435, (_menu_opticon0_start_y+75),"LV1  Hero" ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(435, (_menu_opticon0_start_y+110),"[[PLACEHOLDER]]" ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main_sm);
			break;
			case 1:
					draw_sprite_ext(spr_charicons,0,300,140,3,3,0,c_white,1);
					draw_sprite_ext(spr_charicons,1,200,140,3,3,0,c_gray,1);
					draw_sprite_ext(spr_heartsmallarrow,image_index/10,315,110,2,2,0,c_white,1);
					draw_menu_text_color(500, (_menu_opticon0_start_y+80),"(Nothing)" ,0,240,2,2,0, c_gray, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(500, (_menu_opticon0_start_y+110),"(Nothing)" ,0,240,2,2,0, c_gray, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(500, (_menu_opticon0_start_y+140),"(Nothing)" ,0,240,2,2,0, c_gray, _menu_stat_alpha,fnt_main_sm);
			break;
		}
	break;
	#endregion
	#region TASKS
	case (1<<2):
	draw_sprite_ext(spr_menuopttext,_opt_index,x+100,_menu_opttxt_start_y-8,2,2,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,210,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,320,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,430,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,540,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
	draw_menu_text_color(640, (_menu_opticon0_start_y-5), "D$" + string(global.money) ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main);
	
	draw_sprite_ext(spr_placeholder_journal,0,420,245,0.7,0.7,0,c_white,1);
	
	draw_menu_text_color(460, (_menu_opticon0_start_y+60), "OBJECTIVES" ,0,240,1.5,1.5,0, c_black, _menu_stat_alpha,fnt_papyrus);
	break;
	#endregion
	#region CONFIG
	#region CONFIG HUB
	case (3 << 0):
	#region DRAW OPTIONS
		if(cmenuActive)
			draw_sprite_ext(spr_menuopttext,_opt_index,x+100,_menu_opttxt_start_y-8,2,2,0,c_white,_menu_stat_alpha);
			draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,210,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
			draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,320,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
			draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,430,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
			draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,540,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
			draw_menu_text_color(640, (_menu_opticon0_start_y-5), "D$" + string(global.money) ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main);
		
	     draw_sprite_ext(spr_itembox,0,853/2,244,2,2.3,0,c_white,1);
		draw_menu_text_color(370, (_menu_opticon0_start_y+75), "CONFIG" ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main_sm);
		draw_text_color_ext(280,_menu_opticon0_start_y+110,2,2,0,configHubSelection == 0 ?  c_yellow : c_white,"Audio",fnt_main_sm)
		draw_text_color_ext(280,_menu_opticon0_start_y+145,2,2,0,configHubSelection == 1 ?  c_yellow : c_white,"Controls",fnt_main_sm)
		draw_text_color_ext(280,_menu_opticon0_start_y+180,2,2,0,configHubSelection == 2 ?  c_yellow : c_white,"Gameplay",fnt_main_sm)
		draw_text_color_ext(280,_menu_opticon0_start_y+215,2,2,0,configHubSelection == 3 ?  c_yellow : c_white,"Extras",fnt_main_sm)
		draw_text_color_ext(280,_menu_opticon0_start_y+250,2,2,0,configHubSelection == 4 ?  c_yellow : c_white,"Return to Title",fnt_main_sm)
		draw_text_color_ext(280,_menu_opticon0_start_y+285,2,2,0,configHubSelection == 5 ?  c_yellow : c_white,"Back",fnt_main_sm)
		draw_sprite_ext(spr_heartsmall, 0, 240, configHubSoulY, 2,2,0, c_white,optSoulAlpha);
	break;
	#endregion
	#endregion	
	#region AUDIO CONFIG
	case (3 << 1):
	#region DRAW OPTIONS
		if(cmenuActive)
		draw_sprite_ext(spr_menuopttext,_opt_index,x+20,_menu_opttxt_start_y-7,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,120,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,220,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,320,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkconfigbt_placeholder,2,425,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_menu_text_color(520, (_menu_opticon0_start_y-5), "D$" + string(global.money) ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main);
			
		draw_sprite_ext(spr_itembox,0,853/2,244,2,2.3,0,c_white,1);
		draw_menu_text_color(370, (_menu_opticon0_start_y+75), "Audio" ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main_sm);
		draw_text_color_ext(220,_menu_opticon0_start_y+110,2,2,0,c_white,"Master Volume",fnt_main_sm)
		draw_text_color_ext(220,_menu_opticon0_start_y+150,2,2,0,c_white,"Music Volume",fnt_main_sm)
		draw_text_color_ext(220,_menu_opticon0_start_y+190,2,2,0,c_white,"SFX Volume",fnt_main_sm)
		draw_text_color_ext(220,_menu_opticon0_start_y+230,2,2,0,c_white,"Voice Volume",fnt_main_sm)
		draw_text_color_ext(220,_menu_opticon0_start_y+270,2,2,0,c_white,"Back",fnt_main_sm)
	break;
	#endregion
	#endregion
	#region CONTROLS CONFIG
	case (3 << 2):
	#region DRAW OPTIONS
		if(cmenuActive)
		draw_sprite_ext(spr_menuopttext,_opt_index,x+20,_menu_opttxt_start_y-7,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,120,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,220,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,320,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkconfigbt_placeholder,2,425,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_menu_text_color(520, (_menu_opticon0_start_y-5), "D$" + string(global.money) ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main);
		
	     draw_sprite_ext(spr_itembox,0,853/2,244,2,2.3,0,c_white,1);
		#region DRAW BASE CONFIG MENU TEXT
		draw_menu_text_color(370, (_menu_opticon0_start_y+75), "Controls" ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main_sm);
		draw_text_color_ext(270,_menu_opticon0_start_y+110,2,2,0,c_white,"Movement",fnt_main_sm)
		draw_text_color_ext(210,_menu_opticon0_start_y+150,2,2,0,subSelection == 0 ? c_aqua : c_white,"Up",fnt_main_sm)
		draw_text_color_ext(210,_menu_opticon0_start_y+180,2,2,0,subSelection == 1 ? c_aqua : c_white,"Down",fnt_main_sm)
		draw_text_color_ext(210,_menu_opticon0_start_y+210,2,2,0,subSelection == 2 ? c_aqua : c_white,"Left",fnt_main_sm)
		draw_text_color_ext(210,_menu_opticon0_start_y+240,2,2,0,subSelection == 3 ? c_aqua : c_white,"Right",fnt_main_sm)
		draw_text_color_ext(210,_menu_opticon0_start_y+270,2,2,0,subSelection == 4 ? c_aqua : c_white,"Run",fnt_main_sm)
		
		draw_text_color_ext(460,_menu_opticon0_start_y+110,2,2,0,c_white,"Interaction",fnt_main_sm)
		draw_text_color_ext(430,_menu_opticon0_start_y+150,2,2,0,subSelection == 5 ? c_aqua : c_white,"Action",fnt_main_sm)
		draw_text_color_ext(430,_menu_opticon0_start_y+180,2,2,0,subSelection == 6 ? c_aqua : c_white,"Cancel",fnt_main_sm)
		draw_text_color_ext(430,_menu_opticon0_start_y+210,2,2,0,subSelection == 7 ? c_aqua : c_white,"Open Menu",fnt_main_sm)
		draw_text_color_ext(430,_menu_opticon0_start_y+240,2,2,0,subSelection == 8 ? c_aqua : c_white,"Swap Mode",fnt_main_sm)
		draw_text_color_ext(430,_menu_opticon0_start_y+270,2,2,0,subSelection == 9 ? c_aqua : c_white,"Swap Leader",fnt_main_sm)
		
		draw_text_color_ext(220,_menu_opticon0_start_y+315,2,2,0,subSelection == 10 ? c_aqua : c_white,"Reset to Default",fnt_main_sm)
		draw_text_color_ext(520,_menu_opticon0_start_y+315,2,2,0,subSelection == 11 ? c_aqua : c_white,"Finish",fnt_main_sm)
	
		#region DRAW BOUND ICONS/TEXT
		#region Movement
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(320,_menu_opticon0_start_y+150,2,2,0,subSelection == 0 ? c_aqua : c_white,get_binding_name(input_binding_get("up")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("up")))
			scribble("["+_string+"]").draw(320,_menu_opticon0_start_y+152)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(320,_menu_opticon0_start_y+180,2,2,0,subSelection == 1 ? c_aqua : c_white,get_binding_name(input_binding_get("down")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("down")))
			scribble("["+_string+"]").draw(320,_menu_opticon0_start_y+182)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(320,_menu_opticon0_start_y+210,2,2,0,subSelection == 2 ? c_aqua : c_white,get_binding_name(input_binding_get("left")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("left")))
			scribble("["+_string+"]").draw(320,_menu_opticon0_start_y+212)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(320,_menu_opticon0_start_y+240,2,2,0,subSelection == 3 ? c_aqua : c_white,get_binding_name(input_binding_get("right")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("right")))
			scribble("["+_string+"]").draw(320,_menu_opticon0_start_y+242)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(320,_menu_opticon0_start_y+270,2,2,0,subSelection == 4 ? c_aqua : c_white,get_binding_name(input_binding_get("run")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("run")))
			scribble("["+_string+"]").draw(320,_menu_opticon0_start_y+274)
		}
		#endregion
		#endregion
		#region Interaction
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(620,_menu_opticon0_start_y+150,2,2,0,subSelection == 5 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("action")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("action")))
			scribble("["+_string+"]").draw(620,_menu_opticon0_start_y+154)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(620,_menu_opticon0_start_y+180,2,2,0,subSelection == 6 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("cancel")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("cancel")))
			scribble("["+_string+"]").draw(620,_menu_opticon0_start_y+184)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(620,_menu_opticon0_start_y+210,2,2,0,subSelection == 7 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("menu")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("menu")))
			scribble("["+_string+"]").draw(620,_menu_opticon0_start_y+214)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(620,_menu_opticon0_start_y+240,2,2,0,subSelection == 8 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("swap1")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("swap1")))
			scribble("["+_string+"]").draw(620,_menu_opticon0_start_y+244)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(620,_menu_opticon0_start_y+270,2,2,0,subSelection == 9 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("swap2")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("swap2")))
			scribble("["+_string+"]").draw(620,_menu_opticon0_start_y+274)
		}
		#endregion
		#endregion
		#region DRAW REBINDABLE VERB TEXT
				var _string = "";
				#region UP BINDING
				if subSelection == 0 {
					_icon = input_verb_get_icon("up")
					if input_source_using(INPUT_KEYBOARD) == true {
						_string = input_binding_get_icon(input_binding_get("up"))
						draw_text_color_ext(320,_menu_opticon0_start_y+150,2,2,0,subSelection == 0 ? c_aqua : c_white,_string,fnt_main_sm)	
					} else if input_source_using(INPUT_GAMEPAD) == true{
						var _string = sprite_get_name(input_binding_get_icon(input_binding_get("up")))
						scribble("["+_string+"]").draw(320,_menu_opticon0_start_y+152)
					}
				}
				#endregion
				#region DOWN BINDING
				if subSelection == 1 {
					_icon = input_verb_get_icon("down")
						if input_source_using(INPUT_KEYBOARD) == true {
							draw_text_color_ext(320,_menu_opticon0_start_y+180,2,2,0,subSelection == 1 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("down")),fnt_main_sm)	
						} else if input_source_using(INPUT_GAMEPAD) == true{
							var _string = sprite_get_name(input_binding_get_icon(input_binding_get("down")))
							scribble("["+_string+"]").draw(320,_menu_opticon0_start_y+182)
						}
				}
				#endregion
				#region LEFT BINDING
				if subSelection == 2 {
					_icon = input_verb_get_icon("left")
						if input_source_using(INPUT_KEYBOARD) == true {
							draw_text_color_ext(320,_menu_opticon0_start_y+210,2,2,0,subSelection == 2 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("left")),fnt_main_sm)	
						} else if input_source_using(INPUT_GAMEPAD) == true{
							var _string = sprite_get_name(input_binding_get_icon(input_binding_get("left")))
							scribble("["+_string+"]").draw(320,_menu_opticon0_start_y+212)
						}
				}
				#endregion
				#region RIGHT BINDING
				if subSelection == 3 {
					_icon = input_verb_get_icon("left")
						if input_source_using(INPUT_KEYBOARD) == true {
							draw_text_color_ext(320,_menu_opticon0_start_y+240,2,2,0,subSelection == 3 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("right")),fnt_main_sm)	
						} else if input_source_using(INPUT_GAMEPAD) == true{
							var _string = sprite_get_name(input_binding_get_icon(input_binding_get("right")))
							scribble("["+_string+"]").draw(320,_menu_opticon0_start_y+242)
						}
				}
				#endregion
		#endregion

	break;
	#endregion
	#endregion
	#region GAMEPLAY CONFIG
	case (3 << 3):
	#region DRAW OPTIONS
		if(cmenuActive)
		   draw_sprite_ext(spr_menuopttext,_opt_index,x+100,_menu_opttxt_start_y-8,2,2,0,c_white,_menu_stat_alpha);
			draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,210,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
			draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,320,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
			draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,430,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
			draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,540,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
			draw_menu_text_color(640, (_menu_opticon0_start_y-5), "D$" + string(global.money+178) ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main);
		
		draw_sprite_ext(spr_itembox,0,853/2,244,2,2.3,0,c_white,1);
		draw_menu_text_color(370, (_menu_opticon0_start_y+75), "Gameplay" ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main_sm);
		draw_text_color_ext(230,_menu_opticon0_start_y+110,2,2,0,subSelection == 0 ? c_aqua : c_white,"Resolution",fnt_main_sm)
		draw_text_color_ext(subSelection== 0 ? 490 : 520,_menu_opticon0_start_y+110,2,2,0,subSelection == 0 ? c_aqua : c_white,subSelection == 0 ? "<<"+string(global.resolution_current.w)+"x"+string(global.resolution_current.h)+">>" : string(global.resolution_current.w)+"x"+string(global.resolution_current.h),fnt_main_sm)
		draw_text_color_ext(230,_menu_opticon0_start_y+150,2,2,0,subSelection==1 ? c_aqua : c_white,"Window Mode",fnt_main_sm)
		draw_text_color_ext(subSelection == 1? 490: 520,_menu_opticon0_start_y+150,2,2,0,subSelection== 1 ? c_aqua : c_white, subSelection==1 ? "<<"+win_label+">>" : win_label,fnt_main_sm)
		draw_text_color_ext(230,_menu_opticon0_start_y+190,2,2,0,subSelection==2 ? c_aqua : c_white,"Camera Style",fnt_main_sm)
		draw_text_color_ext(subSelection == 2 ? 490: 520,_menu_opticon0_start_y+190,2,2,0,subSelection==2 ? c_aqua : c_white,subSelection==2 ? "<<"+cam_label+">>" : cam_label,fnt_main_sm)
		draw_text_color_ext(230,_menu_opticon0_start_y+230,2,2,0,subSelection==3 ? c_aqua : c_white,"Simplify VFX",fnt_main_sm)
		draw_text_color_ext(subSelection == 3 ? 510: 520,_menu_opticon0_start_y+230,2,2,0,subSelection==3 ? c_aqua : c_white,subSelection == 3 ? "<<"+vfx_label+">>" : vfx_label,fnt_main_sm)
		draw_text_color_ext(230,_menu_opticon0_start_y+270,2,2,0,subSelection==4 ? c_aqua : c_white,"Language",fnt_main_sm)
		draw_text_color_ext(subSelection == 4? 510: 520,_menu_opticon0_start_y+270,2,2,0,subSelection==4 ? c_aqua : c_white,"English",fnt_main_sm)
		draw_text_color_ext(230,_menu_opticon0_start_y+310,2,2,0,subSelection==5 ? c_aqua : c_white,"Back",fnt_main_sm)
	break;
	#endregion
	#endregion
	#region EXTRAS CONFIG
	case (3 << 4):
	#region DRAW OPTIONS
		if(cmenuActive)
		draw_sprite_ext(spr_menuopttext,_opt_index,x+20,_menu_opttxt_start_y-7,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,120,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,220,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,320,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkconfigbt_placeholder,2,425,_menu_opticon0_start_y-5,2,2,0,c_white,_menu_stat_alpha);
		draw_menu_text_color(520, (_menu_opticon0_start_y-5), "D$" + string(global.money) ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main);
			
		draw_sprite_ext(spr_itembox,0,853/2,244,2,2.3,0,c_white,1);
		draw_menu_text_color(370, (_menu_opticon0_start_y+75), "Extras" ,0,240,2,2,0, c_white, _menu_stat_alpha,fnt_main_sm);
		draw_text_color_ext(220,_menu_opticon0_start_y+110,2,2,0,subSelection==0 ? c_aqua : c_white,"Gamepad Vibration",fnt_main_sm)
		draw_text_color_ext(subSelection == 0 ? 510: 520,_menu_opticon0_start_y+110,2,2,0,subSelection==0 ? c_aqua : c_white,subSelection == 0 ? "<<"+vfx_label+">>" : vfx_label,fnt_main_sm)
		draw_text_color_ext(220,_menu_opticon0_start_y+150,2,2,0,c_white,"Discord Presence",fnt_main_sm)
		draw_text_color_ext(subSelection == 1 ? 510: 520,_menu_opticon0_start_y+150,2,2,0,subSelection==1 ? c_aqua : c_white,subSelection == 1 ? "<<"+vfx_label+">>" : vfx_label,fnt_main_sm)
		draw_text_color_ext(220,_menu_opticon0_start_y+190,2,2,0,subSelection==2 ? c_aqua : c_white,"GameJolt Login",fnt_main_sm)
		draw_text_color_ext(220,_menu_opticon0_start_y+230,2,2,0,subSelection==3 ? c_aqua : c_white,"Clear Saved Data",fnt_main_sm)
		draw_text_color_ext(220,_menu_opticon0_start_y+270,2,2,0,subSelection==4 ? c_aqua : c_white,"Back",fnt_main_sm)
	break;
	#endregion
	#endregion
	#endregion
}