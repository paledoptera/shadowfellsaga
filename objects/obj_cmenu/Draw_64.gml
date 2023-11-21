if(live_call()) return live_result;
if(!obj_gamehandler.borderEnabled){
	display_set_gui_size(global.gui_res_w*2, global.gui_res_h*2);
}  
draw_sprite_ext(spr_cemnubox,  0 , 640/2, _menu_stat_start_y+480,100,2.5,0,c_white,_menu_opt_alpha);
draw_sprite_ext(spr_cemnubox,  0 , 640/2, _menu_opt_start_y-18,100,4,0,c_white,_menu_stat_alpha);
draw_sprite_ext(spr_cemnuline,0,640,_menu_stat_start_y+390,4.4,3,0,c_white,_menu_stat_alpha);

#region Stats Box
#region Draw Papyrus info
if party_get_size() > 2 {
	draw_sprite_ext(spr_partyicons,0,40,_menu_stat_papicon_start_y+440,3,3,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_partynames,0,110,_menu_stat_papname_start_y+435,2,2,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_hptext,0,420,_menu_stat_hplabel_start_y+445,3,3,0,c_white,_menu_stat_alpha);
	#region DRAW PAPS HP TEXT BITMAP
	draw_sprite_ext(spr_drbttext_addins,0,270,_menu_stat_papname_start_y+4,1.4,1.4,0,c_white,_menu_stat_alpha);
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
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+245,_menu_stat_papname_start_y+5,1.4,1.4,0,c_white,1);
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
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+320,_menu_stat_papname_start_y+5,1.4,1.4,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	#endregion
	#region DRAW PAPS HP BAR
	draw_sprite_ext(spr_pixel,0,x+240,y+_menu_stat_hpbox_start_y+7,global.partyhp[0]._max*1.25/1.5,14,0,hpdmg,_menu_stat_alpha);
	draw_sprite_ext(spr_pixel,0,x+240,y+_menu_stat_hpbox_start_y+7,global.partyhp[0]._curr*1.25/1.5,14,0,hpcolor[0],_menu_stat_alpha);
	#endregion
} else if party_get_size() == 2 {
	if(subState==2&&global.itempocketed[global.selecteditem]>=0&&optSelection==0&&targetSelection==0){
	draw_sprite_ext(spr_partyicons,0,180,_menu_stat_papicon_start_y+440,3,3,0,c_white,0);
	} else {
		draw_sprite_ext(spr_partyicons,0,180,_menu_stat_papicon_start_y+440,3,3,0,c_white,_menu_stat_alpha);	
	}
	draw_sprite_ext(spr_partynames,0,260,_menu_stat_papname_start_y+435,2,2,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_hptext,0,500,_menu_stat_hplabel_start_y+445,3,3,0,c_white,_menu_stat_alpha);
	#region DRAW PAPS HP TEXT BITMAP
	draw_sprite_ext(spr_drbttext_addins,0,590,_menu_stat_papname_start_y+425,2,2,0,c_white,_menu_stat_alpha);
	var STR=string(global.partyhp[0]._curr);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext)*2;
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+570,_menu_stat_papname_start_y+427,2,2,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	
	var STR=string(global.partyhp[0]._max);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext)*2;
   var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+650,_menu_stat_papname_start_y+427,2,2,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	#endregion
	#region DRAW PAPS HP BAR
	draw_sprite_ext(spr_pixel,0,x+560,y+_menu_stat_hpbox_start_y+440,global.partyhp[0]._max*2/2,25,0,hpdmg,_menu_stat_alpha);
	draw_sprite_ext(spr_pixel,0,x+560,y+_menu_stat_hpbox_start_y+440,global.partyhp[0]._curr*2/2,25,0,hpcolor[0],_menu_stat_alpha);
	#endregion
#endregion	
}

#region Draw Sans info
if party_get_size() > 2 {
	draw_sprite_ext(spr_partyicons,1,140,_menu_stat_sansicon_start_y+10,3,3,0,c_white,1);
draw_sprite_ext(spr_partynames,1,430,_menu_stat_papname_start_y+13,1,1,0,c_white,_menu_stat_alpha);
#region DRAW SANS HP TEXT BITMAP
draw_sprite_ext(spr_hptext,0,510,_menu_stat_hplabel_start_y+14,1.5,1.5,0,c_white,_menu_stat_alpha);
draw_sprite_ext(spr_drbttext_addins,0,550,_menu_stat_papname_start_y+4,1.4,1.4,0,c_white,_menu_stat_alpha);
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
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+540,_menu_stat_papname_start_y+5,1.4,1.4,0,c_white,1);
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
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+575,_menu_stat_papname_start_y+5,1.4,1.4,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
#endregion
#region DRAW SANS HP BAR
draw_sprite_ext(spr_pixel,0,x+540,y+_menu_stat_hpbox_start_y+7,global.partyhp[1]._max*40/0.95,15,0,hpdmg,_menu_stat_alpha);
draw_sprite_ext(spr_pixel,0,x+540,y+_menu_stat_hpbox_start_y+7,global.partyhp[1]._curr*40/0.95,15,0,hpcolor[1],_menu_stat_alpha);
#endregion
} else if party_get_size() == 2 {
	if(subState==2&&global.itempocketed[global.selecteditem]>=0&&optSelection==0&&targetSelection==1){
	draw_sprite_ext(spr_partyicons,1,740,_menu_stat_sansicon_start_y+436,4,4,0,c_white,0);
	} else {
		draw_sprite_ext(spr_partyicons,1,740,_menu_stat_sansicon_start_y+436,4,4,0,c_white,_menu_stat_alpha);	
	}
draw_sprite_ext(spr_partynames,1,820,_menu_stat_papname_start_y+436,2,2,0,c_white,_menu_stat_alpha);
#region DRAW SANS HP TEXT BITMAP
draw_sprite_ext(spr_hptext,0,990,_menu_stat_hplabel_start_y+445,3,3,0,c_white,_menu_stat_alpha);
draw_sprite_ext(spr_drbttext_addins,0,1055,_menu_stat_papname_start_y+425,2,2,0,c_white,_menu_stat_alpha);
	var STR=string(global.partyhp[1]._curr);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext)*2;
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+1051,_menu_stat_papname_start_y+425,2,2,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	
	var STR=string(global.partyhp[1]._max);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext)*2;
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+1090,_menu_stat_papname_start_y+425,2,2,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
#endregion
#region DRAW SANS HP BAR
draw_sprite_ext(spr_pixel,0,x+1050,y+_menu_stat_hpbox_start_y+439,global.partyhp[1]._max*40/1,25,0,hpdmg,_menu_stat_alpha);
draw_sprite_ext(spr_pixel,0,x+1050,y+_menu_stat_hpbox_start_y+439,global.partyhp[1]._curr*40/1,25,0,hpcolor[1],_menu_stat_alpha);
#endregion
} else if party_get_size() == 1 && global.party[0]  = 1 {
	// draw sans	
}
#endregion
#endregion


if(subState==2&&global.itempocketed[global.selecteditem]>=0&&optSelection==0){
	if(!targetOverride){
		switch(targetSelection){
			case 0:	
			draw_sprite_ext(spr_heartbig,0,183,_menu_stat_papicon_start_y+440,2,2,0,c_white,_menu_stat_alpha);
			draw_sprite_ext(spr_cmenuselectbox,  0 , 870/2, _menu_stat_start_y+420,1.8,0.95,0,c_white,_menu_stat_alpha);
			break;
			case 1:	
				draw_sprite_ext(spr_heartbig,0,743,_menu_stat_papicon_start_y+440,2,2,0,c_white,_menu_stat_alpha);
				draw_sprite_ext(spr_cmenuselectbox,  1 , 1825/2, _menu_stat_start_y+420,1.5,0.95,0,c_white,_menu_stat_alpha);
			break;
		}
	}
}
	

switch(cmenuState){
	#region BASIC SELECTION
	case (0 << 0): 
	draw_sprite_ext(spr_menuopttext,_opt_index,x+50,_menu_opttxt_start_y+35,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,260,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,460,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,670,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,880,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_menu_text_color(1090, (_menu_opticon0_start_y+30), "D$ " + string(global.money) ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
	break;
	#endregion
	#region INVENTORY
	case (1 << 0):
		#region DRAW OPTIONS
		if(cmenuActive)
			if selectedInventory == 0{
			draw_sprite_ext(spr_menuopttext,_opt_index,x+50,_menu_opttxt_start_y+35,4,4,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,260,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,460,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,670,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,880,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
		draw_menu_text_color(1090, (_menu_opticon0_start_y+30), "D$ " + string(global.money) ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
			}
		draw_sprite_ext(spr_itembox,image_index/16,640,460,3.7,3.7,0,c_white,1);
		draw_menu_text_color(340, (250), invopt[0],0,220,4,4,0, subSelection==0 ? invopt_col[0] : invopt_col[2], 1,fnt_main);
		draw_menu_text_color(550, (250), invopt[1],0,220,4,4,0, subSelection==1 ? invopt_col[0] : invopt_col[2], 1,fnt_main);
		draw_menu_text_color(800, (250), invopt[2],0,220,4,4,0, subSelection==2 ? invopt_col[0] : invopt_col[2], 1,fnt_main);
		
		switch(subSelection){
			case 0:
				draw_sprite_ext(spr_heartsmall, 0, 270, 265, 4,4,0, c_white,optSoulAlpha);
			break;
			case 1:
				draw_sprite_ext(spr_heartsmall, 0, 480, 265, 4,4,0, c_white,optSoulAlpha);
			break;
			case 2:
				draw_sprite_ext(spr_heartsmall, 0, 725, 265, 4,4,0, c_white,optSoulAlpha);
			break;
		}
		
		switch(optSelection){
			case 0:
				draw_menu_text_color(340, (250), invopt[0],0,240,4,4,0, optSelection==0 ? invopt_col[1] : invopt_col[2], 1,fnt_main);
			break;
			case 1:
				draw_menu_text_color(550, (250), invopt[1],0,240,4,4,0, optSelection==1 ? invopt_col[1] : invopt_col[2], 1,fnt_main);
			break;
			case 2:				
				draw_menu_text_color(800, (250), invopt[2],0,240,4,4,0, optSelection==2 ? invopt_col[1] : invopt_col[2], 1,fnt_main);
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
					if (optSelection != 2){
					draw_text_ext_transformed_color(270, (330 + (50*i)),global.itemname[(i *2)],0,240,3.5,3.5,0,c_gray,c_gray,c_gray,c_gray,1)
					draw_text_ext_transformed_color(290+420, (330 + (50*i)),global.itemname[(i *2) + 1],0,240,3.5,3.5,0,c_gray,c_gray,c_gray,c_gray,1)
					} else {
						key_item_name()
						draw_text_ext_transformed_color(270, (330 + (50*i)),global.keyitemname[(i *2)],0,240,3.5,3.5,0,c_gray,c_gray,c_gray,c_gray,1)
					//	draw_text_ext_transformed_color(290+420, (330 + (50*i)),global.keyitemname[(i *2) + 1],0,240,3.5,3.5,0,c_gray,c_gray,c_gray,c_gray,1)
					}
				}			
			break;
			case 1:
					draw_sprite_ext(spr_heartsmall, 0, optSoulSX+120,optSoulSY+167, 4,4,0, c_white,1);
					draw_set_font(fnt_main_sm);
					draw_text_ext_transformed_color(x+20,y+10,item_desc_simple(global.selecteditem),20,400,3,3,0,c_white,c_white,c_white,c_white,1)
				for (var i=0; i<6; i++){
					item_name();
					draw_set_font(fnt_main_sm);
						draw_text_ext_transformed_color(270, (330 + (50*i)),global.itemname[(i *2)],0,240,3.5,3.5,0,c_white,c_white,c_white,c_white,1)
					draw_text_ext_transformed_color(290+420, (330 + (50*i)),global.itemname[(i *2) + 1],0,240,3.5,3.5,0,c_white,c_white,c_white,c_white,1)
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
		if (equipChar < 0){
		draw_sprite_ext(spr_menuopttext,_opt_index,x+50,_menu_opttxt_start_y+35,4,4,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,260,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,460,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,670,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
		draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,880,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
		draw_menu_text_color(1090, (_menu_opticon0_start_y+30), "D$ " + string(global.money) ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
		}
			draw_sprite_ext(spr_equipbox,image_index/16,640,460,3.2,3.2,0,c_white,1);
			draw_set_font(fnt_main_sm);
				if slotEquippableType =="arm" {
					draw_sprite_ext(spr_equipbox2,image_index/16,640,460,3.2,3.2,0,c_white,1);
						draw_text_ext_transformed_color(x+20,y+10,armor_desc_simple(slotSel+100),20,400,3,3,0,c_white,c_white,c_white,c_white,1)
					for (var i=0; i<6; i++){
						armor_name();
						armor_info_all();
						draw_set_font(fnt_main_sm);
						draw_text_ext_transformed_color(760, (440 + (40*i)),global.armornameb[(i *2)],0,240,3,3,0,equipChar == -1 ? c_silver : c_white,equipChar == -1 ? c_silver : c_white,equipChar == -1 ? c_silver : c_white,equipChar == -1 ? c_silver : c_white,1)
					//	draw_item_icon(720,(450 + (40 * i)),global.armoricon[i]);
					}			
				} else if slotEquippableType == "wep" {
						draw_sprite_ext(spr_equipbox,image_index/16,640,460,3.2,3.2,0,c_white,1);
						for (var i=0; i<6; i++){
						weapon_name();
						draw_set_font(fnt_main_sm);
						draw_text_ext_transformed_color(760, (440 + (40*i)),global.weaponnameb[(i*2)],0,240,3,3,0,equipChar == -1 ? c_silver : c_white,equipChar == -1 ? c_silver : c_white,equipChar == -1 ? c_silver : c_white,equipChar == -1 ? c_silver : c_white,1)

					}			
				}
		#endregion
		
		switch(charSelection){
			case 0:
					draw_sprite_ext(spr_charicons,0,380,300,4,4,0,c_gray,1);
					draw_sprite_ext(spr_charicons,1,280,300,4,4,0,c_white,1);
					if (equipChar < 0){
					draw_sprite_ext(spr_heartsmallarrow,image_index/10,287,270,3,3,0,c_white,equipChar == -1 ? 1 : 0);
					} else {
						if slotSelectionEquip == 0
						draw_sprite_ext(spr_heartsmall,0,685,250,3,3,0,c_white,1);
						if slotSelectionEquip == 1
						draw_sprite_ext(spr_heartsmall,0,685,300,3,3,0,c_white,1);
						if slotSelectionEquip == 2
						draw_sprite_ext(spr_heartsmall,0,685,350,3,3,0,c_white,1);
						if slotSelectionEquip == 3
						draw_sprite_ext(spr_heartsmall,0,685,460,3,3,0,c_white,1);
						if slotSelectionEquip == 4
						draw_sprite_ext(spr_heartsmall,0,685,490,3,3,0,c_white,1);
						if slotSelectionEquip == 5
						draw_sprite_ext(spr_heartsmall,0,685,530,3,3,0,c_white,1);
						if slotSelectionEquip == 6
						draw_sprite_ext(spr_heartsmall,0,685,50,3,3,0,c_white,1);
						if slotSelectionEquip == 7
						draw_sprite_ext(spr_heartsmall,0,685,620,3,3,0,c_white,1);
						if slotSelectionEquip == 8
						draw_sprite_ext(spr_heartsmall,0,685,690,3,3,0,c_white,1);
					}
					draw_sprite_ext(spr_equipicons,0,680,(_menu_opticon0_start_y+210),3,3,0,c_white,slotSelectionEquip == 0 ? 0: 1)
					draw_sprite_ext(spr_equipicons,3,680,(_menu_opticon0_start_y+260),3,3,0,c_white,slotSelectionEquip == 1 ? 0: 1)
					draw_sprite_ext(spr_equipicons,4,680,(_menu_opticon0_start_y+310),3,3,0,c_white,slotSelectionEquip == 2 ? 0: 1)
					
					draw_sprite_ext(spr_equipicons2,0,250,(_menu_opticon0_start_y+420),3,3,0,c_white,1)
					draw_sprite_ext(spr_equipicons2,3,250,(_menu_opticon0_start_y+460),3,3,0,c_white,1)
					draw_sprite_ext(spr_equipicons2,4,250,(_menu_opticon0_start_y+500),3,3,0,c_white,1)
					
					armor_name_ALT()
					draw_menu_text_color(780, (_menu_opticon0_start_y+210),	string(global.wepequipname[0]),0,240,3,3,0, c_dkgray, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(780, (_menu_opticon0_start_y+310),string(global.armequipname[1]) ,0,240,3,3,0, c_dkgray, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(780, (_menu_opticon0_start_y+260),string(global.armequipname[0]) ,0,240,3,3,0, c_dkgray, _menu_stat_alpha,fnt_main_sm);
					
					draw_menu_text_color(380, (_menu_opticon0_start_y+205),"Papyrus" ,0,240,3,3,0, c_white, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(300, (_menu_opticon0_start_y+410),"Attack: " + string(global.partyat[0]) ,0,240,3,3,0, c_white, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(300, (_menu_opticon0_start_y+450),"Defense: " + string(global.partydf[0]),0,240,3,3,0, c_white, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(300, (_menu_opticon0_start_y+490),"Magic: "  + string(global.partymagic[0]) ,0,240,3,3,0, c_white, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(300, (_menu_opticon0_start_y+530),"(No ability.)" ,0,240,3,3,0, c_dkgray, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(300, (_menu_opticon0_start_y+575),"(No ability.)" ,0,240,3,3,0, c_dkgray, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(300, (_menu_opticon0_start_y+620),"(No ability.)" ,0,240,3,3,0, c_dkgray, _menu_stat_alpha,fnt_main_sm);
			break;
			case 1:
					draw_sprite_ext(spr_charicons,0,380,300,4,4,0,c_white,1);
					draw_sprite_ext(spr_charicons,1,280,300,4,4,0,c_gray,1);
					if (equipChar < 0){
					draw_sprite_ext(spr_heartsmallarrow,image_index/10,390,280,3,3,0,c_white,equipChar == -1 ? 1 : 0);
					} else {
						if slotSelectionEquip == 0
						draw_sprite_ext(spr_heartsmall,0,685,250,3,3,0,c_white,1);
						if slotSelectionEquip == 1
						draw_sprite_ext(spr_heartsmall,0,685,300,3,3,0,c_white,1);
						if slotSelectionEquip == 2
						draw_sprite_ext(spr_heartsmall,0,685,350,3,3,0,c_white,1);
						if slotSelectionEquip == 3
						draw_sprite_ext(spr_heartsmall,0,685,460,3,3,0,c_white,1);
						if slotSelectionEquip == 4
						draw_sprite_ext(spr_heartsmall,0,685,490,3,3,0,c_white,1);
						if slotSelectionEquip == 5
						draw_sprite_ext(spr_heartsmall,0,685,530,3,3,0,c_white,1);
						if slotSelectionEquip == 6
						draw_sprite_ext(spr_heartsmall,0,685,50,3,3,0,c_white,1);
						if slotSelectionEquip == 7
						draw_sprite_ext(spr_heartsmall,0,685,620,3,3,0,c_white,1);
						if slotSelectionEquip == 8
						draw_sprite_ext(spr_heartsmall,0,685,690,3,3,0,c_white,1);
					}
					draw_sprite_ext(spr_equipicons,0,680,(_menu_opticon0_start_y+210),3,3,0,c_white,1)
					draw_sprite_ext(spr_equipicons,3,680,(_menu_opticon0_start_y+260),3,3,0,c_white,1)
					draw_sprite_ext(spr_equipicons,4,680,(_menu_opticon0_start_y+310),3,3,0,c_white,1)
												
					draw_sprite_ext(spr_equipicons2,0,250,(_menu_opticon0_start_y+420),3,3,0,c_white,1)
					draw_sprite_ext(spr_equipicons2,3,250,(_menu_opticon0_start_y+460),3,3,0,c_white,1)
					draw_sprite_ext(spr_equipicons2,4,250,(_menu_opticon0_start_y+500),3,3,0,c_white,1)
					draw_menu_text_color(780, (_menu_opticon0_start_y+210),"(Nothing)" ,0,240,3,3,0, equipChar == -1 ? c_dkgray : c_white, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(780, (_menu_opticon0_start_y+310),"(Nothing)" ,0,240,3,3,0, equipChar == -1 ? c_dkgray : c_white, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(780, (_menu_opticon0_start_y+260),"(Nothing)" ,0,240,3,3,0, equipChar == -1 ? c_dkgray : c_white, _menu_stat_alpha,fnt_main_sm);
					
					draw_menu_text_color(380, (_menu_opticon0_start_y+205),"Sans" ,0,240,3,3,0, c_white, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(300, (_menu_opticon0_start_y+410),"Attack:" ,0,240,3,3,0, c_white, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(300, (_menu_opticon0_start_y+450),"Defense: " ,0,240,3,3,0, c_white, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(300, (_menu_opticon0_start_y+490),"Magic:" ,0,240,3,3,0, c_white, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(300, (_menu_opticon0_start_y+530),"(No ability.)" ,0,240,3,3,0, c_dkgray, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(300, (_menu_opticon0_start_y+575),"(No ability.)" ,0,240,3,3,0, c_dkgray, _menu_stat_alpha,fnt_main_sm);
					draw_menu_text_color(300, (_menu_opticon0_start_y+620),"(No ability.)" ,0,240,3,3,0, c_dkgray, _menu_stat_alpha,fnt_main_sm);
			break;
		}
	break;
	#endregion
	#region TASKS
	case (1<<2):
	draw_sprite_ext(spr_menuopttext,_opt_index,x+50,_menu_opttxt_start_y+35,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,260,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,460,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,670,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,880,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_menu_text_color(1090, (_menu_opticon0_start_y+30), "D$ " + string(global.money) ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
	
	draw_sprite_ext(spr_placeholder_journal,image_index/16,640,460,1.12,1.12,0,c_white,1);
	
	draw_menu_text_color(730, (_menu_opticon0_start_y+180), "OBJECTIVES" ,0,240,2,2,0, c_black, _menu_stat_alpha,fnt_papyrus);
	
	if ds_list_empty(objectives) {
		draw_menu_text_color(680, (_menu_opticon0_start_y+240), "(No active objectives)" ,0,240,2,2,0, c_black, _menu_stat_alpha,fnt_papyrus);
	} else {
		 with (objectives) {
	        var keys = ds_list_(objectives);
	        for (var i = 0; i < array_length(keys); i++) {
	            draw_text(100, yPos, keys[i] + ": " + ds_map_find_value(objectives, keys[i]));
	            yPos += 30; // Adjust the vertical spacing
	        }
	    }	
	}
	break;
	#endregion
	#region CONFIG
	#region CONFIG HUB
	case (3 << 0):
	#region DRAW OPTIONS
		if(cmenuActive)
		draw_sprite_ext(spr_menuopttext,_opt_index,x+50,_menu_opttxt_start_y+35,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,260,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,460,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,670,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,880,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_menu_text_color(1090, (_menu_opticon0_start_y+30), "D$ " + string(global.money) ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
		
	     draw_sprite_ext(spr_itembox,image_index/16,1250/2,456,3.7,3.7,0,c_white,1);
		draw_menu_text_color(540, (_menu_opticon0_start_y+210), "CONFIG" ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
		draw_text_color_ext(500,_menu_opticon0_start_y+280,3,3,0,configHubSelection == 0 ?  c_aqua : c_white,"Audio",fnt_main_sm)
		draw_text_color_ext(500,_menu_opticon0_start_y+330,3,3,0,configHubSelection == 1 ?  c_aqua : c_white,"Controls",fnt_main_sm)
		draw_text_color_ext(500,_menu_opticon0_start_y+380,3,3,0,configHubSelection == 2 ?  c_aqua : c_white,"Gameplay",fnt_main_sm)
		draw_text_color_ext(500,_menu_opticon0_start_y+430,3,3,0,configHubSelection == 3 ?  c_aqua : c_white,"Extras",fnt_main_sm)
		draw_text_color_ext(500,_menu_opticon0_start_y+480,3,3,0,configHubSelection == 4 ?  c_aqua : c_white,"Return to Title",fnt_main_sm)
		draw_text_color_ext(500,_menu_opticon0_start_y+600,3,3,0,configHubSelection == 5 ?  c_aqua : c_white,"Back",fnt_main_sm)
//		draw_sprite_ext(spr_heartsmall, 0, 220, configHubSoulY-5, 4,4,0, c_white,optSoulAlpha);
	break;
	#endregion
	#endregion	
	#region AUDIO CONFIG
	case (3 << 1):
	#region DRAW OPTIONS
		if(cmenuActive)
	draw_sprite_ext(spr_menuopttext,_opt_index,x+50,_menu_opttxt_start_y+35,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,260,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,460,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,670,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,880,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_menu_text_color(1090, (_menu_opticon0_start_y+30), "D$ " + string(global.money) ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
			
	     draw_sprite_ext(spr_itembox,image_index/16,1250/2,456,3.7,3.7,0,c_white,1);
		draw_menu_text_color(540, (_menu_opticon0_start_y+210), "AUDIO" ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
		draw_text_color_ext(220,_menu_opticon0_start_y+270,3,3,0,configHubSelection == 0 ? c_aqua : c_white,"Master Volume",fnt_main_sm)
		draw_text_color_ext(220,_menu_opticon0_start_y+340,3,3,0,configHubSelection == 1 ? c_aqua : c_white,"Music Volume",fnt_main_sm)
		draw_text_color_ext(220,_menu_opticon0_start_y+410,3,3,0,configHubSelection == 2 ? c_aqua : c_white,"SFX Volume",fnt_main_sm)
		draw_text_color_ext(220,_menu_opticon0_start_y+490,3,3,0,configHubSelection == 3 ? c_aqua : c_white,"Voice Volume",fnt_main_sm)
		draw_text_color_ext(220,_menu_opticon0_start_y+590,3,3,0,configHubSelection >= 4 ? c_aqua : c_white,"Back",fnt_main_sm)
	break;
	#endregion
	#endregion
	#region CONTROLS CONFIG
	case (3 << 2):
	#region DRAW OPTIONS
		if(cmenuActive)
	draw_sprite_ext(spr_menuopttext,_opt_index,x+50,_menu_opttxt_start_y+35,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,260,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,460,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,670,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,880,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_menu_text_color(1090, (_menu_opticon0_start_y+30), "D$ " + string(global.money) ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
		
	     draw_sprite_ext(spr_itembox,image_index/16,1250/2,456,3.7,3.7,0,c_white,1);
		#region DRAW BASE CONFIG MENU TEXT
				draw_menu_text_color(480, (_menu_opticon0_start_y+200), "CONTROLS" ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
		draw_text_color_ext(270,_menu_opticon0_start_y+260,3,3,0,c_white,"Movement",fnt_main_sm)
		draw_text_color_ext(210,_menu_opticon0_start_y+310,3,3,0,subSelection == 0 ? c_aqua : c_white,"Up",fnt_main_sm)
		draw_text_color_ext(210,_menu_opticon0_start_y+360,3,3,0,subSelection == 1 ? c_aqua : c_white,"Down",fnt_main_sm)
		draw_text_color_ext(210,_menu_opticon0_start_y+410,3,3,0,subSelection == 2 ? c_aqua : c_white,"Left",fnt_main_sm)
		draw_text_color_ext(210,_menu_opticon0_start_y+460,3,3,0,subSelection == 3 ? c_aqua : c_white,"Right",fnt_main_sm)
		draw_text_color_ext(210,_menu_opticon0_start_y+510,3,3,0,subSelection == 4 ? c_aqua : c_white,"Run",fnt_main_sm)
		
		draw_text_color_ext(740,_menu_opticon0_start_y+260,3,3,0,c_white,"Interaction",fnt_main_sm)
		draw_text_color_ext(620,_menu_opticon0_start_y+310,3,3,0,subSelection == 5 ? c_aqua : c_white,"Action",fnt_main_sm)
		draw_text_color_ext(620,_menu_opticon0_start_y+360,3,3,0,subSelection == 6 ? c_aqua : c_white,"Cancel",fnt_main_sm)
		draw_text_color_ext(620,_menu_opticon0_start_y+410,3,3,0,subSelection == 7 ? c_aqua : c_white,"Open Menu",fnt_main_sm)
		draw_text_color_ext(620,_menu_opticon0_start_y+460,3,3,0,subSelection == 8 ? c_aqua : c_white,"Swap Mode",fnt_main_sm)
		draw_text_color_ext(620,_menu_opticon0_start_y+510,3,3,0,subSelection == 9 ? c_aqua : c_white,"Swap Leader",fnt_main_sm)
		
		draw_text_color_ext(210,_menu_opticon0_start_y+585,3,3,0,subSelection == 10 ? c_aqua : c_white,"Reset to Default",fnt_main_sm)
		draw_text_color_ext(880,_menu_opticon0_start_y+585,3,3,0,subSelection == 11 ? c_aqua : c_white,"Finish",fnt_main_sm)
	
		#region DRAW BOUND ICONS/TEXT
		#region Movement
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(440,_menu_opticon0_start_y+310,3,3,0,subSelection == 0 ? c_aqua : c_white,get_binding_name(input_binding_get("up")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("up")))
			scribble("["+_string+"]").draw(440,_menu_opticon0_start_y+312)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(440,_menu_opticon0_start_y+360,3,3,0,subSelection == 1 ? c_aqua : c_white,get_binding_name(input_binding_get("down")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("down")))
			scribble("["+_string+"]").draw(440,_menu_opticon0_start_y+362)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(440,_menu_opticon0_start_y+410,3,3,0,subSelection == 2 ? c_aqua : c_white,get_binding_name(input_binding_get("left")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("left")))
			scribble("["+_string+"]").draw(440,_menu_opticon0_start_y+412)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(440,_menu_opticon0_start_y+460,3,3,0,subSelection == 3 ? c_aqua : c_white,get_binding_name(input_binding_get("right")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("right")))
			scribble("["+_string+"]").draw(440,_menu_opticon0_start_y+462)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(440,_menu_opticon0_start_y+510,3,3,0,subSelection == 4 ? c_aqua : c_white,get_binding_name(input_binding_get("run")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("run")))
			scribble("["+_string+"]").draw(440,_menu_opticon0_start_y+514)
		}
		#endregion
		#endregion
		#region Interaction
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(980,_menu_opticon0_start_y+310,3,3,0,subSelection == 5 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("action")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("action")))
			scribble("["+_string+"]").draw(620,_menu_opticon0_start_y+154)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(980,_menu_opticon0_start_y+360,3,3,0,subSelection == 6 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("cancel")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("cancel")))
			scribble("["+_string+"]").draw(620,_menu_opticon0_start_y+184)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(980,_menu_opticon0_start_y+410,3,3,0,subSelection == 7 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("menu")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("menu")))
			scribble("["+_string+"]").draw(620,_menu_opticon0_start_y+214)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(980,_menu_opticon0_start_y+460,3,3,0,subSelection == 8 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("swap1")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("swap1")))
			scribble("["+_string+"]").draw(620,_menu_opticon0_start_y+244)
		}
		if input_source_using(INPUT_KEYBOARD) == true {
			draw_text_color_ext(980,_menu_opticon0_start_y+510,3,3,0,subSelection == 9 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("swap2")),fnt_main_sm)	
		} else if input_source_using(INPUT_GAMEPAD) == true{
			var _string = sprite_get_name(input_binding_get_icon(input_binding_get("swap2")))
			scribble("["+_string+"]").draw(620,_menu_opticon0_start_y+274)
		}
		#endregion
		#endregion
			//#region DRAW REBINDABLE VERB TEXT
			//		var _string = "";
			//		#region UP BINDING
			//		if subSelection == 0 {
			//			_icon = input_verb_get_icon("up")
			//			if input_source_using(INPUT_KEYBOARD) == true {
			//				_string = input_binding_get_icon(input_binding_get("up"))
			//				draw_text_color_ext(320,_menu_opticon0_start_y+150,2,2,0,subSelection == 0 ? c_aqua : c_white,_string,fnt_main_sm)	
			//			} else if input_source_using(INPUT_GAMEPAD) == true{
			//				var _string = sprite_get_name(input_binding_get_icon(input_binding_get("up")))
			//				scribble("["+_string+"]").draw(320,_menu_opticon0_start_y+152)
			//			}
			//		}
			//		#endregion
			//		#region DOWN BINDING
			//		if subSelection == 1 {
			//			_icon = input_verb_get_icon("down")
			//				if input_source_using(INPUT_KEYBOARD) == true {
			//					draw_text_color_ext(320,_menu_opticon0_start_y+180,2,2,0,subSelection == 1 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("down")),fnt_main_sm)	
			//				} else if input_source_using(INPUT_GAMEPAD) == true{
			//					var _string = sprite_get_name(input_binding_get_icon(input_binding_get("down")))
			//					scribble("["+_string+"]").draw(320,_menu_opticon0_start_y+182)
			//				}
			//		}
			//		#endregion
			//		#region LEFT BINDING
			//		if subSelection == 2 {
			//			_icon = input_verb_get_icon("left")
			//				if input_source_using(INPUT_KEYBOARD) == true {
			//					draw_text_color_ext(320,_menu_opticon0_start_y+210,2,2,0,subSelection == 2 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("left")),fnt_main_sm)	
			//				} else if input_source_using(INPUT_GAMEPAD) == true{
			//					var _string = sprite_get_name(input_binding_get_icon(input_binding_get("left")))
			//					scribble("["+_string+"]").draw(320,_menu_opticon0_start_y+212)
			//				}
			//		}
			//		#endregion
			//		#region RIGHT BINDING
			//		if subSelection == 3 {
			//			_icon = input_verb_get_icon("left")
			//				if input_source_using(INPUT_KEYBOARD) == true {
			//					draw_text_color_ext(320,_menu_opticon0_start_y+240,2,2,0,subSelection == 3 ? c_aqua : c_white,input_binding_get_icon(input_binding_get("right")),fnt_main_sm)	
			//				} else if input_source_using(INPUT_GAMEPAD) == true{
			//					var _string = sprite_get_name(input_binding_get_icon(input_binding_get("right")))
			//					scribble("["+_string+"]").draw(320,_menu_opticon0_start_y+242)
			//				}
			//		}
			//		#endregion
			//#endregion

	break;
	#endregion
	#endregion
	#region GAMEPLAY CONFIG
	case (3 << 3):
	#region DRAW OPTIONS
		if(cmenuActive)
	draw_sprite_ext(spr_menuopttext,_opt_index,x+50,_menu_opttxt_start_y+35,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,260,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,460,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,670,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,880,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_menu_text_color(1090, (_menu_opticon0_start_y+30), "D$ " + string(global.money) ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
		
	    draw_sprite_ext(spr_itembox,image_index/16,1250/2,456,3.7,3.7,0,c_white,1);
				draw_menu_text_color(480, (_menu_opticon0_start_y+200), "GAMEPLAY" ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
		draw_text_color_ext(270,_menu_opticon0_start_y+260,3,3,0,subSelection == 0 ? c_aqua : c_white,"Resolution",fnt_main_sm)
		draw_text_color_ext(subSelection== 0 ? 710 : 705,_menu_opticon0_start_y+260,3,3,0,subSelection == 0 ? c_aqua : c_white,subSelection == 0 ? "<<"+string(global.resolution_current.w)+"x"+string(global.resolution_current.h)+">>" : string(global.resolution_current.w)+"x"+string(global.resolution_current.h),fnt_main_sm)
		draw_text_color_ext(270,_menu_opticon0_start_y+310,3,3,0,subSelection==1 ? c_aqua : c_white,"Window Mode",fnt_main_sm)
		draw_text_color_ext(subSelection == 1? 710: 705,_menu_opticon0_start_y+310,3,3,0,subSelection== 1 ? c_aqua : c_white, subSelection==1 ? "<<"+win_label+">>" : win_label,fnt_main_sm)
		draw_text_color_ext(270,_menu_opticon0_start_y+360,3,3,0,subSelection==2 ? c_aqua : c_white,"Aspect Ratio",fnt_main_sm)
		draw_text_color_ext(subSelection == 2 ? 710: 705,_menu_opticon0_start_y+360,3,3,0,subSelection==2 ? c_aqua : c_white,subSelection==2 ? "<<"+cam_label+">>" : cam_label,fnt_main_sm)
		draw_text_color_ext(270,_menu_opticon0_start_y+410,3,3,0,subSelection==3 ? c_aqua : c_white,"Simplify VFX",fnt_main_sm)
		draw_text_color_ext(subSelection == 3 ? 710: 705,_menu_opticon0_start_y+410,3,3,0,subSelection==3 ? c_aqua : c_white,subSelection == 3 ? "<<"+vfx_label+">>" : vfx_label,fnt_main_sm)
		draw_text_color_ext(270,_menu_opticon0_start_y+460,3,3,0,subSelection==4 ? c_aqua : c_white,"Language",fnt_main_sm)
		draw_text_color_ext(subSelection == 4? 710: 705,_menu_opticon0_start_y+460,3,3,0,subSelection==4 ? c_aqua : c_white,"English",fnt_main_sm)
		draw_text_color_ext(270,_menu_opticon0_start_y+560,3,3,0,subSelection==5 ? c_aqua : c_white,"Back",fnt_main_sm)
	break;
	#endregion
	#endregion
	#region EXTRAS CONFIG
	case (3 << 4):
	#region DRAW OPTIONS
		if(cmenuActive)
		draw_sprite_ext(spr_menuopttext,_opt_index,x+50,_menu_opttxt_start_y+35,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkitembt_placeholder,selection==0 ? 0 : 1,260,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkequipbt_placeholder,selection==1 ? 0 : 1,460,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darktaskbt_placeholder,selection==2 ? 0 : 1,670,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_sprite_ext(spr_darkconfigbt_placeholder,selection==3 ? 0 : 1,880,_menu_opticon0_start_y+30,4,4,0,c_white,_menu_stat_alpha);
	draw_menu_text_color(1090, (_menu_opticon0_start_y+30), "D$ " + string(global.money) ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
			
		 draw_sprite_ext(spr_itembox,image_index/16,1250/2,456,3.7,3.7,0,c_white,1);
			draw_menu_text_color(480, (_menu_opticon0_start_y+200), "EXTRAS" ,0,240,4,4,0, c_white, _menu_stat_alpha,fnt_main_sm);
		draw_text_color_ext(270,_menu_opticon0_start_y+260,3,3,0,subSelection == 0 ? c_aqua : c_white,"Gamepad Vibration",fnt_main_sm)
		draw_text_color_ext(subSelection== 0 ? 710 : 705,_menu_opticon0_start_y+260,3,3,0,subSelection == 0 ? c_aqua : c_white,subSelection == 0 ? "<<"+vfx_label+">>" : vfx_label,fnt_main_sm)
		draw_text_color_ext(270,_menu_opticon0_start_y+310,3,3,0,subSelection==1 ? c_aqua : c_white,"Discord Presence",fnt_main_sm)
		draw_text_color_ext(subSelection == 1? 710: 705,_menu_opticon0_start_y+310,3,3,0,subSelection== 1 ? c_aqua : c_white, subSelection==1 ? "<<"+vfx_label+">>" : vfx_label,fnt_main_sm)
		draw_text_color_ext(270,_menu_opticon0_start_y+360,3,3,0,subSelection==2 ? c_aqua : c_white,"GameJolt Login",fnt_main_sm)
		draw_text_color_ext(270,_menu_opticon0_start_y+410,3,3,0,subSelection==3 ? c_aqua : c_white,"Clear Saved Data",fnt_main_sm)
		draw_text_color_ext(270,_menu_opticon0_start_y+460,3,3,0,subSelection==4 ? c_aqua : c_white,"Reset Settings",fnt_main_sm)
		draw_text_color_ext(270,_menu_opticon0_start_y+560,3,3,0,subSelection==5 ? c_aqua : c_white,"Back",fnt_main_sm)
	break;
	#endregion
	#endregion
	#endregion
}