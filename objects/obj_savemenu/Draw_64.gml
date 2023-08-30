if(live_call()) return live_result;
draw_set_alpha(_bg_alpha/2)
draw_set_color(c_black);
draw_rectangle(x,y,RES_W*RES_SCALE,RES_H*RES_SCALE,false)

if(!obj_gamehandler.borderEnabled){
	display_set_gui_size(640,480)	
}

if subState == 6 {
	index = spr_blank
	
}

#region Menu soul X and Y variables
menu_soul_x1  = 55
menu_soul_y1 = (55 + ((YL + YS)))
menu_soul_x2 = (55 + XL)
menu_soul_y2 = ((55 + ((YL + YS))) + YL)

menu_soul_x3  = 55   
menu_soul_y3 = (55 + ((YL + YS)))
menu_soul_x4 = (55 + XL)
menu_soul_y4 = ((55 + ((YL + YS))) + YL)

menu_soul_x5  = 55   
menu_soul_y5 = (55 + ((YL + YS)))
menu_soul_x6 = (55 + XL)
menu_soul_y6 = ((55 + ((YL + YS))) + YL)
#endregion

for (i = 0; i < 3; i += 1){
	#region Main box
	box_x1  = 55
	box_y1 = (55 + ((YL + YS) * i))
	box_x2 = (55 + XL)
	box_y2 = ((55 + ((YL + YS) * i)) + YL)
	#endregion
	#region Thiccness
	box_x3  = 55
	box_y3 = (55 + ((YL + YS) * i))
	box_x4 = (55 + XL)
	box_y4 = ((55 + ((YL + YS) * i)) + YL)
	#endregion
    draw_set_alpha(0.5)
   draw_set_color(c_black)
   draw_sprite_ext(spr_textbox,style,box_x2-XL/2,box_y2-YL/2,1.5,1.5,0,image_blend,_alpha);
}
switch(subState){
	#region BASIC MENU STATE
	case 0: 
	      #region VARIABLES
		canscale=false;
		x_shift_allowed=false;
		index=spr_heartsmall;
		menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;
		menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;				
		menu_soul_dest_scale=2.4;
		#endregion
		event_user(1);
	if!(_overwrite){
		#region Draw label and horizontal menu options (greyed out for now)
		draw_text_transformed_shadow_ext(
		menu_soul_x2-XL/2-270,
		menu_soul_y2-YL/2-210 ,
		menulabel,
		0,240,26,2,2,0,c_white,1,fnt_main)
		
		if(selection!=3){
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-160,
			menu_soul_y2-YL/2-(-190) ,
			string("Copy"),
			0,240,26,2,2,0,c_gray,1,fnt_main)
		
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-40,
			menu_soul_y2-YL/2-(-190) ,
			string("Erase"),
			0,240,26,2,2,0,c_gray,1,fnt_main)
			
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-(-100),
			menu_soul_y2-YL/2-(-190) ,
			string("Quit"),
			0,240,26,2,2,0,c_gray,1,fnt_main)
		}
		#endregion
		switch(selection){
				#region Empty/Filled Slot 0
				case 0:
						_alpha=1
						menu_soul_dest_y=132
						#region Slot 1 Unselected
						if(!file_exists("file1")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-36 ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file1")){
							  ini_open("sfsaga.ini");
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							 menu_soul_y2-YL/2-38,
							ini_read_string("Party-SL1","Name2","ERROR"),
							0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
							ini_close();
						}
							if(!file_exists("file1")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						   string(temptime),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						}
							if(file_exists("file1")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL1","MN2",0);
								var seconds = ini_read_real("World-SL1","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
								
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						  string(minutes)+ ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
							}
							if(!file_exists("file1")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
							}
							if(file_exists("file1")){
							ini_open("sfsaga.ini");
							var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							area,
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
							}
						#endregion
						#region Slot 2 Unselected
									if(!file_exists("file2")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-85.4) ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						}
							if(file_exists("file2")){
								 ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4),
								ini_read_string("Party-SL2","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
							}
							if(!file_exists("file2")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
				   				menu_soul_y2-YL/2-(-85.4),
							   string(temptime),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							} 
								if(file_exists("file2")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL2","MN2",0);
									var seconds = ini_read_real("World-SL2","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								  string(minutes)+ ":"+ string(_dsec),
								   0,24,32,2,2,0,
								   c_gray,_alpha,fnt_main)	
								   ini_close();
						}
						if(!file_exists("file2")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
						}
							if(file_exists("file2")){
								ini_open("sfsaga.ini");
								var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								area,
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
				}
						#endregion
						event_user(1);
							if(!file_exists("file0")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								string(tempname),
								0,12,24,2,2,0,color,_alpha,fnt_main)
						} 
						if(file_exists("file0")){
							    ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								ini_read_string("Party-SL0","Name2","ERROR"),
								0,12,24,2,2,0,color,_alpha,fnt_papyrus)
								ini_close();
						}
						if(!file_exists("file0")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						   string(temptime),
						   0,24,32,2,2,0,
						   color,_alpha,fnt_main)
						} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL0","MN2",0);
								var seconds = ini_read_real("World-SL0","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						  string(minutes) + ":" + string(_dsec),
						   0,24,32,2,2,0,
						   color,_alpha,fnt_main)	
						   ini_close();
						}
						if(!file_exists("file0")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							string(temparea),
							0,240,-40,2,2,0,color,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						} 
						if(file_exists("file0")){
							ini_open("sfsaga.ini");
							var area=ini_read_string("World-SL0","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							area,
							0,240,-40,2,2,0,color,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
						}
				break;
				#endregion
				#region Empty/Filled Slot 1
				case 1:		
						_alpha=1
						menu_soul_dest_y=11
						#region Slot 0 Unselected
								if(!file_exists("file0")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
						if(file_exists("file0")){
							    ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								ini_read_string("Party-SL0","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
						}
						if(!file_exists("file0")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						   string(temptime),
						   0,24,32,2,2,0,
						  c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL0","MN2",0);
								var seconds = ini_read_real("World-SL0","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						  string(minutes) + ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
						}
						if(!file_exists("file0")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						} 
						if(file_exists("file0")){
							ini_open("sfsaga.ini");
							var area=ini_read_string("World-SL0","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							area,
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
						}
						#endregion
						#region Slot 2 Unselected
									if(!file_exists("file2")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-85.4) ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						}
							if(file_exists("file2")){
								 ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4),
								ini_read_string("Party-SL2","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
							}
							if(!file_exists("file2")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
				   				menu_soul_y2-YL/2-(-85.4),
							   string(temptime),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							} 
								if(file_exists("file2")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL2","MN2",0);
									var seconds = ini_read_real("World-SL2","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								  string(minutes)+ ":"+ string(_dsec),
								   0,24,32,2,2,0,
								   c_gray,_alpha,fnt_main)	
								   ini_close();
						}
						if(!file_exists("file2")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
						}
							if(file_exists("file2")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								area,
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
				}
						#endregion
						event_user(1);
							if(!file_exists("file1")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-36 ,
							string(tempname),
							0,12,24,2,2,0,color,_alpha,fnt_main)
						} 
							if(file_exists("file1")){
							  ini_open("sfsaga.ini");
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							 menu_soul_y2-YL/2-38,
							ini_read_string("Party-SL1","Name2","ERROR"),
							0,12,24,2,2,0,color,_alpha,fnt_papyrus)
							ini_close();
						}
							if(!file_exists("file1")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						   string(temptime),
						   0,24,32,2,2,0,
						   color,_alpha,fnt_main)	
						}
							if(file_exists("file1")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL1","MN2",0);
								var seconds = ini_read_real("World-SL1","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
								
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						  string(minutes)+ ":" + string(_dsec),
						   0,24,32,2,2,0,
						   color,_alpha,fnt_main)	
						   ini_close();
							}
							if(!file_exists("file1")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							string(temparea),
							0,240,-40,2,2,0,color,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
							}
							if(file_exists("file1")){
							ini_open("sfsaga.ini");
							var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							area,
							0,240,-40,2,2,0,color,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
					}
				break;
				#endregion
				#region Empty/Filled Slot 2
				case 2:		
					_alpha=1
					menu_soul_dest_y=-117
						#region Slot 0 Unselected
								if(!file_exists("file0")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
						if(file_exists("file0")){
							    ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								ini_read_string("Party-SL0","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
						}
						if(!file_exists("file0")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						   string(temptime),
						   0,24,32,2,2,0,
						  c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL0","MN2",0);
								var seconds = ini_read_real("World-SL0","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						  string(minutes) + ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
						}
						if(!file_exists("file0")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						} 
						if(file_exists("file0")){
							ini_open("sfsaga.ini")
							var area=ini_read_string("Woirld-SL0","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							party_get_room_name(global.currentroom),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						}
						#endregion
						#region Slot 1 Unselected
								if(!file_exists("file1")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-36 ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file1")){
							  ini_open("sfsaga.ini");
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							 menu_soul_y2-YL/2-38,
							ini_read_string("Party-SL1","Name2","ERROR"),
							0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
							ini_close();
						}
							if(!file_exists("file1")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						   string(temptime),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						}
							if(file_exists("file1")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL1","MN2",0);
								var seconds = ini_read_real("World-SL1","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
								
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						  string(minutes)+ ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
							}
							if(!file_exists("file1")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
							}
							if(file_exists("file1")){
							ini_open("sfsaga.ini")
							var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							area,
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
							}
						#endregion
					event_user(1);
						if(!file_exists("file2")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-85.4) ,
							string(tempname),
							0,12,24,2,2,0,color,_alpha,fnt_main)
						}
							if(file_exists("file2")){
								 ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4),
								ini_read_string("Party-SL2","Name2","ERROR"),
								0,12,24,2,2,0,color,_alpha,fnt_papyrus)
								ini_close();
							}
							if(!file_exists("file2")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
				   				menu_soul_y2-YL/2-(-85.4),
							   string(temptime),
							   0,24,32,2,2,0,
							   color,_alpha,fnt_main)	
							} 
								if(file_exists("file2")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL2","MN2",0);
									var seconds = ini_read_real("World-SL2","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								  string(minutes)+ ":"+ string(_dsec),
								   0,24,32,2,2,0,
								   color,_alpha,fnt_main)	
								   ini_close();
						}
						if(!file_exists("file2")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								string(temparea),
								0,240,-40,2,2,0,color,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
						}
							if(file_exists("file2")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								area,
								0,240,-40,2,2,0,color,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
				}
				break;
				#endregion
				#region NO SLOT SELECTED
				case 3:		
					_alpha=1
					menu_soul_dest_y=-117
					#region Slot 0 Unselected
								if(!file_exists("file0")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
						if(file_exists("file0")){
							    ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								ini_read_string("Party-SL0","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
						}
						if(!file_exists("file0")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						   string(temptime),
						   0,24,32,2,2,0,
						  c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL0","MN2",0);
								var seconds = ini_read_real("World-SL0","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						  string(minutes) + ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
						}
						if(!file_exists("file0")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						} 
						if(file_exists("file0")){
							ini_open("sfsaga.ini")
							var area=ini_read_string("Woirld-SL0","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							party_get_room_name(global.currentroom),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						}
						#endregion
					#region Slot 1 Unselected
								if(!file_exists("file1")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-36 ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file1")){
							  ini_open("sfsaga.ini");
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							 menu_soul_y2-YL/2-38,
							ini_read_string("Party-SL1","Name2","ERROR"),
							0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
							ini_close();
						}
							if(!file_exists("file1")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						   string(temptime),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						}
							if(file_exists("file1")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL1","MN2",0);
								var seconds = ini_read_real("World-SL1","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
								
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						  string(minutes)+ ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
							}
							if(!file_exists("file1")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
							}
							if(file_exists("file1")){
							ini_open("sfsaga.ini")
							var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							area,
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
							}
						#endregion
					event_user(1);
					#region Slot 2 Unselected
						if(!file_exists("file2")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-85.4) ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						}
							if(file_exists("file2")){
								 ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4),
								ini_read_string("Party-SL2","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
							}
							if(!file_exists("file2")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
				   				menu_soul_y2-YL/2-(-85.4),
							   string(temptime),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							} 
								if(file_exists("file2")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL2","MN2",0);
									var seconds = ini_read_real("World-SL2","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								  string(minutes)+ ":"+ string(_dsec),
								   0,24,32,2,2,0,
								   c_gray,_alpha,fnt_main)	
								   ini_close();
						}
						if(!file_exists("file2")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(c_gray)
						}
							if(file_exists("file2")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								area,
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(c_gray)
							   ini_close();
				}
				#endregion
				break;
				#endregion
		}
		#region BASIC SUBOPTION DISPLAY
		if subState == 0 && selection == 3
		{
			switch(subSelection)
			{
				case 0:
				canscale=true
				menu_soul_dest_scale=2;
				menu_soul_dest_x=menu_soul_x2-XL/2-140;
				menu_soul_dest_y=menu_soul_y2-YL*4.72;
				event_user(1);
				#region Copy selected
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-160,
				menu_soul_y2-YL/2-(-190) ,
				str_set_loc("Copy","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_4_0"),
				0,240,26,2,2,0,c_yellow,1,fnt_main)
				#endregion
				#region Erase unselected
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-40,
				menu_soul_y2-YL/2-(-190) ,
				str_set_loc("Erase","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_14_0"),
				0,240,26,2,2,0,c_gray,1,fnt_main)
				#endregion
				#region Quit unselected
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-(-100),
				menu_soul_y2-YL/2-(-190) ,
				str_set_loc("Quit","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_5_0"),
				0,240,26,2,2,0,c_gray,1,fnt_main)
				#endregion
				break;
				case 1:
				canscale=true
				menu_soul_dest_scale=2;
				menu_soul_dest_x=menu_soul_x2-XL/2-260;
				menu_soul_dest_y=menu_soul_y2-YL*4.72;
				event_user(1);
				#region Copy selected
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-160,
				menu_soul_y2-YL/2-(-190) ,
				str_set_loc("Copy","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_4_0"),
				0,240,26,2,2,0,c_gray,1,fnt_main)
				#endregion
				#region Erase unselected
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-40,
				menu_soul_y2-YL/2-(-190) ,
				str_set_loc("Erase","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_14_0"),
				0,240,26,2,2,0,c_yellow,1,fnt_main)
				#endregion
				#region Quit unselected
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-(-100),
				menu_soul_y2-YL/2-(-190) ,
				str_set_loc("Quit","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_5_0"),
				0,240,26,2,2,0,c_gray,1,fnt_main)
				#endregion
				break;
				case 2:
				canscale=true
				menu_soul_dest_scale=2;
				menu_soul_dest_x=menu_soul_x2-XL/2-400;
				menu_soul_dest_y=menu_soul_y2-YL*4.72;
				event_user(1);
				#region Copy selected
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-160,
				menu_soul_y2-YL/2-(-190) ,
				str_set_loc("Copy","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_4_0"),
				0,240,26,2,2,0,c_gray,1,fnt_main)
				#endregion
				#region Erase unselected
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-40,
				menu_soul_y2-YL/2-(-190) ,
				str_set_loc("Erase","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_14_0"),
				0,240,26,2,2,0,c_gray,1,fnt_main)
				#endregion
				#region Quit unselected
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-(-100),
				menu_soul_y2-YL/2-(-190) ,
				str_set_loc("Quit","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_5_0"),
				0,240,26,2,2,0,c_yellow,1,fnt_main)
				#endregion
				break;
			}
		}
		#endregion
	} 
	break;	
	#endregion
	#region SELECT FILE TO ERASE
	case 1:
	_alpha = 1;
				canscale=true
				menulabel=str_set_loc("Please choose a file to erase.","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_8_0")
				x_shift_allowed=false;
				index=spr_heartsmall;
				menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;
				menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;				
				menu_soul_dest_scale=2.4;

				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-270,
				menu_soul_y2-YL/2-210 ,
				menulabel,
				0,360,26,2,2,0,c_white,1,fnt_main)
				
				event_user(1);
				#region Copy unselected
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-160,
				menu_soul_y2-YL/2-(-190) ,
				str_set_loc("Copy","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_4_0"),
				0,240,26,2,2,0,c_gray,1,fnt_main)
				#endregion
				#region Erase selected
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-40,
				menu_soul_y2-YL/2-(-190) ,
				str_set_loc("Erase","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_14_0"),
				0,240,26,2,2,0,c_silver,1,fnt_main)
				#endregion
				#region Quit unselected
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-(-100),
				menu_soul_y2-YL/2-(-190) ,
				str_set_loc("Quit","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_5_0"),
				0,240,26,2,2,0,c_gray,1,fnt_main)
				#endregion
				switch(selection){
				#region Empty/Filled Slot 0
				case 0:
						_alpha=1
						menu_soul_dest_y=132
						#region Slot 1 Unselected
						if(!file_exists("file1")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-36 ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file1")){
							  ini_open("sfsaga.ini");
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							 menu_soul_y2-YL/2-38,
							ini_read_string("Party-SL1","Name2","ERROR"),
							0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
							ini_close();
						}
							if(!file_exists("file1")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						   string(temptime),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						}
							if(file_exists("file1")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL1","MN2",0);
								var seconds = ini_read_real("World-SL1","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
								
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						  string(minutes)+ ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
							}
							if(!file_exists("file1")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
							}
							if(file_exists("file1")){
							ini_open("sfsaga.ini");
							var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							area,
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
							}
						#endregion
						#region Slot 2 Unselected
									if(!file_exists("file2")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-85.4) ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						}
							if(file_exists("file2")){
								 ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4),
								ini_read_string("Party-SL2","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
							}
							if(!file_exists("file2")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
				   				menu_soul_y2-YL/2-(-85.4),
							   string(temptime),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							} 
								if(file_exists("file2")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL2","MN2",0);
									var seconds = ini_read_real("World-SL2","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								  string(minutes)+ ":"+ string(_dsec),
								   0,24,32,2,2,0,
								   c_gray,_alpha,fnt_main)	
								   ini_close();
						}
						if(!file_exists("file2")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
						}
							if(file_exists("file2")){
								ini_open("sfsaga.ini");
								var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								area,
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
				}
						#endregion
						event_user(1);
						#region Slot 0 Selected
							if(!file_exists("file0")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								string(tempname),
								0,12,24,2,2,0,color,_alpha,fnt_main)
						} 
						if(file_exists("file0")){
							    ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								ini_read_string("Party-SL0","Name2","ERROR"),
								0,12,24,2,2,0,color,_alpha,fnt_papyrus)
								ini_close();
						}
						if(!file_exists("file0")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						   string(temptime),
						   0,24,32,2,2,0,
						   color,_alpha,fnt_main)
						} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL0","MN2",0);
								var seconds = ini_read_real("World-SL0","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						  string(minutes) + ":" + string(_dsec),
						   0,24,32,2,2,0,
						   color,_alpha,fnt_main)	
						   ini_close();
						}
						if(!file_exists("file0")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							string(temparea),
							0,240,-40,2,2,0,color,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						} 
						if(file_exists("file0")){
							ini_open("sfsaga.ini");
							var area=ini_read_string("World-SL0","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							area,
							0,240,-40,2,2,0,color,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
						}
						#endregion
				break;
				#endregion
				#region Empty/Filled Slot 1
				case 1:		
						_alpha=1
						menu_soul_dest_y=11
						#region Slot 0 Unselected
								if(!file_exists("file0")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
						if(file_exists("file0")){
							    ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								ini_read_string("Party-SL0","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
						}
						if(!file_exists("file0")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						   string(temptime),
						   0,24,32,2,2,0,
						  c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL0","MN2",0);
								var seconds = ini_read_real("World-SL0","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						  string(minutes) + ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
						}
						if(!file_exists("file0")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						} 
						if(file_exists("file0")){
							ini_open("sfsaga.ini");
							var area=ini_read_string("World-SL0","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							area,
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
						}
						#endregion
						#region Slot 2 Unselected
									if(!file_exists("file2")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-85.4) ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						}
							if(file_exists("file2")){
								 ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4),
								ini_read_string("Party-SL2","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
							}
							if(!file_exists("file2")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
				   				menu_soul_y2-YL/2-(-85.4),
							   string(temptime),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							} 
								if(file_exists("file2")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL2","MN2",0);
									var seconds = ini_read_real("World-SL2","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								  string(minutes)+ ":"+ string(_dsec),
								   0,24,32,2,2,0,
								   c_gray,_alpha,fnt_main)	
								   ini_close();
						}
						if(!file_exists("file2")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
						}
							if(file_exists("file2")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								area,
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
				}
						#endregion
						event_user(1);
						#region Slot 1 Selected
							if(!file_exists("file1")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-36 ,
							string(tempname),
							0,12,24,2,2,0,color,_alpha,fnt_main)
						} 
							if(file_exists("file1")){
							  ini_open("sfsaga.ini");
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							 menu_soul_y2-YL/2-38,
							ini_read_string("Party-SL1","Name2","ERROR"),
							0,12,24,2,2,0,color,_alpha,fnt_papyrus)
							ini_close();
						}
							if(!file_exists("file1")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						   string(temptime),
						   0,24,32,2,2,0,
						   color,_alpha,fnt_main)	
						}
							if(file_exists("file1")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL1","MN2",0);
								var seconds = ini_read_real("World-SL1","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
								
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						  string(minutes)+ ":" + string(_dsec),
						   0,24,32,2,2,0,
						   color,_alpha,fnt_main)	
						   ini_close();
							}
							if(!file_exists("file1")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							string(temparea),
							0,240,-40,2,2,0,color,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
							}
							if(file_exists("file1")){
							ini_open("sfsaga.ini");
							var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							area,
							0,240,-40,2,2,0,color,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
					}
					#endregion
				break;
				#endregion
				#region Empty/Filled Slot 2
				case 2:		
					_alpha=1
					menu_soul_dest_y=-117
						#region Slot 0 Unselected
								if(!file_exists("file0")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
						if(file_exists("file0")){
							    ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								ini_read_string("Party-SL0","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
						}
						if(!file_exists("file0")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						   string(temptime),
						   0,24,32,2,2,0,
						  c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL0","MN2",0);
								var seconds = ini_read_real("World-SL0","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						  string(minutes) + ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
						}
						if(!file_exists("file0")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						} 
						if(file_exists("file0")){
							ini_open("sfsaga.ini")
							var area=ini_read_string("Woirld-SL0","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							party_get_room_name(global.currentroom),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						}
						#endregion
						#region Slot 1 Unselected
								if(!file_exists("file1")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-36 ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file1")){
							  ini_open("sfsaga.ini");
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							 menu_soul_y2-YL/2-38,
							ini_read_string("Party-SL1","Name2","ERROR"),
							0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
							ini_close();
						}
							if(!file_exists("file1")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						   string(temptime),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						}
							if(file_exists("file1")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL1","MN2",0);
								var seconds = ini_read_real("World-SL1","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
								
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						  string(minutes)+ ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
							}
							if(!file_exists("file1")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
							}
							if(file_exists("file1")){
							ini_open("sfsaga.ini")
							var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							area,
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
							}
						#endregion
					event_user(1);
						#region Slot 2 Selected
						if(!file_exists("file2")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-85.4) ,
							string(tempname),
							0,12,24,2,2,0,color,_alpha,fnt_main)
						}
							if(file_exists("file2")){
								 ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4),
								ini_read_string("Party-SL2","Name2","ERROR"),
								0,12,24,2,2,0,color,_alpha,fnt_papyrus)
								ini_close();
							}
							if(!file_exists("file2")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
				   				menu_soul_y2-YL/2-(-85.4),
							   string(temptime),
							   0,24,32,2,2,0,
							   color,_alpha,fnt_main)	
							} 
								if(file_exists("file2")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL2","MN2",0);
									var seconds = ini_read_real("World-SL2","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								  string(minutes)+ ":"+ string(_dsec),
								   0,24,32,2,2,0,
								   color,_alpha,fnt_main)	
								   ini_close();
						}
						if(!file_exists("file2")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								string(temparea),
								0,240,-40,2,2,0,color,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
						}
							if(file_exists("file2")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								area,
								0,240,-40,2,2,0,color,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
				}
				#endregion
				break;
				#endregion
				
				}
	break;
	#endregion
	#region FILE ERASE PROMPT
	case 3:
			canscale=true;
			
			x_shift_allowed=true;
			menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;				
			menu_soul_dest_scale=2.4;
	switch(selection){
		#region Slot 0
		case 0:
				_menu_soul_yposh=110;
				menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;	
				event_user(1);
				
				index=spr_heartsmallarrow
				draw_set_alpha(1)
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-180,
				menu_soul_y4-YL/2-156.4,
				str_set_loc("Erase this file?","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_15_0"),0,240,24,2,2,0,color,_alpha,fnt_main)
			
			   	draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-140,
				menu_soul_y4-YL/2-115,
				string(choice[0]),
				0,240,-40,2,2,0,subSelection == 0 && subState==3 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-(-30),
				menu_soul_y2-YL/2-115,
				string(choice[1]),
				0,240,-40,2,2,0,subSelection == 1 && subState==3 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				draw_set_alpha(1);
		break;
		#endregion
		#region Slot 1
		case 1:
				_menu_soul_yposh=-8;
				menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;
				menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;		
				event_user(1);
				index=spr_heartsmallarrow
				draw_set_alpha(1)
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-180,
				menu_soul_y4-YL/2-36 ,
					str_set_loc("Erase this file?","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_15_0"),0,240,24,2,2,0,color,_alpha,fnt_main)
			
			   	draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-140,
				menu_soul_y4-YL/2-(-5),
				string(choice[0]),
				0,240,-40,2,2,0,subSelection == 0 && subState==3 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-(-30),
				menu_soul_y4-YL/2-(-5),
				string(choice[1]),
				0,240,-40,2,2,0,subSelection == 1 && subState==3 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
		break;
		#endregion
		#region Slot 2
		case 2:
			_menu_soul_yposh=-128;
			menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;
			menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;		
			event_user(1);
				index=spr_heartsmallarrow
				draw_set_alpha(1)
				switch(saved){
					case 0:
						draw_text_transformed_shadow_ext(
						menu_soul_x4-XL/2-180,
						menu_soul_y4-YL/2-(-85) ,
							str_set_loc("Erase this file?","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_15_0"),0,240,24,2,2,0,color,_alpha,fnt_main)
			
					   	draw_text_transformed_shadow_ext(
						menu_soul_x4-XL/2-140,
						menu_soul_y4-YL/2-(-125),
						string(choice[0]),
						0,240,-40,2,2,0,subSelection == 0 && subState==3 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				
						draw_text_transformed_shadow_ext(
						menu_soul_x4-XL/2-(-30),
						menu_soul_y4-YL/2-(-125),
						string(choice[1]),
						0,240,-40,2,2,0,subSelection == 1 && subState==3 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
					break;
				}

				
		break;
		#endregion
	}
	break;
	#endregion
	#region FILE ERASED CONFIRMATION
	case 4:
		switch(selection){
			#region Saved Slot 0
				case 0:
				color=c_yellow;
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-180,
				menu_soul_y4-YL/2-156.4,
				str_set_loc("File erased","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_9_0")
				,0,240,24,2,2,0,color,_alpha,fnt_main)
				ini_open("sfsaga.ini");
				ini_write_real("General-SL0","room",1)
				ini_write_real("General-SL0","plot",0);
				ini_write_real("General-SL0","pX",320)
				ini_write_real("Genera-SL0","pY",320)
				ini_write_real("General-SL0","pfX",320)
				ini_write_real("General-SL0","pfY",320)
		
				#region Party Data
				ini_write_real("Party-SL0","HP0",1);
				ini_write_real("Party-SL0","MAXHP0",1);
				ini_write_real("Party-SL0","HP1",1);
				ini_write_real("Party-SL0","MAXHP1",1);
		
				ini_write_real("Party-SL0","Level0",1);		
				ini_write_real("Party-SL0","Level1",1);
		
				ini_write_real("Party-SL0","Money",0);
				ini_write_string("Party-SL0","Name0","ERROR");
				ini_write_string("Party-SL0","Name1","error");
				ini_write_string("Party-SL0","Name2","ERROR");
				#endregion
				#region World Data
				ini_write_real("World-SL0","SP",0)
				ini_write_real("World-SL0","MN",0)
				ini_write_real("World-SL0","SC",0)
				ini_write_real("World-SL0","MN2",0)
				ini_write_real("World-SL0","SC2",0)
				#endregion
				ini_close();
				break;
			#endregion
			#region Saved Slot 1
			case 1:
				color=c_yellow
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-180,
				menu_soul_y4-YL/2-36 ,
				str_set_loc("File erased","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_9_0")
				,0,240,24,2,2,0,color,_alpha,fnt_main)
				ini_open("sfsaga.ini");
				ini_write_real("General-SL1","room",1)
				ini_write_real("General-SL1","plot",0);
				ini_write_real("General-SL1","pX",320)
				ini_write_real("Genera-SL1","pY",320)
				ini_write_real("General-SL1","pfX",320)
				ini_write_real("General-SL1","pfY",320)
		
				#region Party Data
				ini_write_real("Party-SL1","HP0",1);
				ini_write_real("Party-SL1","MAXHP0",1);
				ini_write_real("Party-SL1","HP1",1);
				ini_write_real("Party-SL1","MAXHP1",1);
		
				ini_write_real("Party-SL1","Level0",1);		
				ini_write_real("Party-SL1","Level1",1);
		
				ini_write_real("Party-SL1","Money",0);
				ini_write_string("Party-SL1","Name0","ERROR");
				ini_write_string("Party-SL1","Name1","error");
				ini_write_string("Party-SL1","Name2","ERROR");
				#endregion
				#region World Data
				ini_write_real("World-SL1","SP",0)
				ini_write_real("World-SL1","MN",0)
				ini_write_real("World-SL1","SC",0)
				ini_write_real("World-SL1","MN2",0)
				ini_write_real("World-SL1","SC2",0)
				#endregion
				ini_close();
			break;
			#endregion
			#region Saved Slot 2
			case 2:
				color=c_yellow;
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-180,
				menu_soul_y2-YL/2-(-85.4) ,
				str_set_loc("File erased","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_9_0")
				,0,240,24,2,2,0,color,_alpha,fnt_main)
				ini_open("sfsaga.ini");
				
				#region General Data
				ini_write_real("General-SL"+string(selection),"room",1)
				ini_write_real("General-SL"+string(selection),"plot",0);
				ini_write_real("General-SL"+string(selection),"pX",320)
				ini_write_real("Genera-SL"+string(selection),"pY",320)
				ini_write_real("General-SL"+string(selection),"pfX",320)
				ini_write_real("General-SL"+string(selection),"pfY",320)
				#endregion
				#region Party Data
				ini_write_real("Party-SL"+string(selection),"HP0",1);
				ini_write_real("Party-SL"+string(selection),"MAXHP0",1);
				ini_write_real("Party-SL"+string(selection),"HP1",1);
				ini_write_real("Party-SL"+string(selection),"MAXHP1",1);
		
				ini_write_real("Party-SL"+string(selection),"Level0",1);		
				ini_write_real("Party-SL"+string(selection),"Level1",1);
		
				ini_write_real("Party-SL"+string(selection),"Money",0);
				ini_write_string("Party-SL"+string(selection),"Name0","ERROR");
				ini_write_string("Party-SL"+string(selection),"Name1","error");
				ini_write_string("Party-SL"+string(selection),"Name2","ERROR");
				#endregion
				#region World Data
				ini_write_real("World-SL"+string(selection),"SP",0)
				ini_write_real("World-SL"+string(selection),"MN",0)
				ini_write_real("World-SL"+string(selection),"SC",0)
				ini_write_real("World-SL"+string(selection),"MN2",0)
				ini_write_real("World-SL"+string(selection),"SC2",0)
				#endregion
				ini_close();
			break;
			#endregion
			
		}
	break;
	#endregion
	#region SELECT FILE TO SAVE TO
	case 5:
			canscale=true;
			
			x_shift_allowed=true;
			menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;				
			menu_soul_dest_scale=2.4;
	switch(selection){
		#region Slot 0
		case 0:
				_menu_soul_yposh=110;
				menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;	
				event_user(1);
				
				index=spr_heartsmallarrow
				draw_set_alpha(1)
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-180,
				menu_soul_y4-YL/2-156.4,
				str_set_loc("Save to this file?","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_1_0"),0,240,24,2,2,0,color,_alpha,fnt_main)
			
			   	draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-140,
				menu_soul_y4-YL/2-115,
				string(choice[0]),
				0,240,-40,2,2,0,subSelection == 0 && subState==5 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-(-30),
				menu_soul_y2-YL/2-115,
				string(choice[1]),
				0,240,-40,2,2,0,subSelection == 1 && subState==5 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				draw_set_alpha(1);
		break;
		#endregion
		#region Slot 1
		case 1:
				_menu_soul_yposh=-8;
				menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;
				menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;		
				event_user(1);
				index=spr_heartsmallarrow
				draw_set_alpha(1)
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-180,
				menu_soul_y4-YL/2-36 ,
				str_set_loc("Save to this file?","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_1_0"),0,240,24,2,2,0,color,_alpha,fnt_main)
			
			   	draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-140,
				menu_soul_y4-YL/2-(-5),
				string(choice[0]),
				0,240,-40,2,2,0,subSelection == 0 && subState== 5 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-(-30),
				menu_soul_y4-YL/2-(-5),
				string(choice[1]),
				0,240,-40,2,2,0,subSelection == 1 && subState==5 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
		break;
		#endregion
		#region Slot 2
		case 2:
			_menu_soul_yposh=-128;
			menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;
			menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;		
			event_user(1);
				index=spr_heartsmallarrow
				draw_set_alpha(1)
				switch(saved){
					case 0:
						draw_text_transformed_shadow_ext(
						menu_soul_x4-XL/2-180,
						menu_soul_y4-YL/2-(-85) ,
						str_set_loc("Save to this file?","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_1_0"),0,240,24,2,2,0,color,_alpha,fnt_main)
			
					   	draw_text_transformed_shadow_ext(
						menu_soul_x4-XL/2-140,
						menu_soul_y4-YL/2-(-125),
						string(choice[0]),
						0,240,-40,2,2,0,subSelection == 0 && subState==5 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				
						draw_text_transformed_shadow_ext(
						menu_soul_x4-XL/2-(-30),
						menu_soul_y4-YL/2-(-125),
						string(choice[1]),
						0,240,-40,2,2,0,subSelection == 1 && subState=5  && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
					break;
				}

				
		break;
		#endregion
	}
	break;
	#endregion
	#region FILE SAVED CONFIRMATION
	case 6:
		switch(selection){
			#region Saved Slot 0
				case 0:
				color=c_yellow;
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-180,
				menu_soul_y4-YL/2-156.4,
				str_set_loc("File saved","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_7_0")
				,0,240,24,2,2,0,color,_alpha,fnt_main)
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL0","MN2",0);
								var seconds = ini_read_real("World-SL0","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
					
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-(-100),
				menu_soul_y2-YL/2-156.4,
				string(minutes) + ":" + string(_dsec),
				0,24,32,2,2,0,color,_alpha,fnt_main)
				var area=ini_read_string("World-SL0","roomname","Carrion Isles - Beach")
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-180,
				menu_soul_y2-YL/2-115,
				area,
				0,240,-40,2,2,0,color,_alpha,fnt_main)			
				ini_close();
				break;
			#endregion
			#region Saved Slot 1
			case 1:
				color=c_yellow
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-180,
				menu_soul_y4-YL/2-36 ,
				str_set_loc("File saved","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_7_0")
				,0,240,24,2,2,0,color,_alpha,fnt_main)
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL1","MN2",0);
								var seconds = ini_read_real("World-SL1","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
					
				 draw_text_transformed_shadow_ext(
				 menu_soul_x2-XL/2-(-100),
				 menu_soul_y2-YL/2-38,
				  string(minutes) + ":" + string(_dsec),
				  0,24,32,2,2,0,color,_alpha,fnt_main)
				 var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
				  draw_text_transformed_shadow_ext(
				  menu_soul_x2-XL/2-180,
				  menu_soul_y2-YL/2-(-3),
				  area,
				  0,240,-40,2,2,0,color,_alpha,fnt_main)
				  draw_set_alpha(1);
				  ini_close();
			break;
			#endregion
			#region Saved Slot 2
			case 2:
				color=c_yellow;
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-180,
				menu_soul_y2-YL/2-(-85.4) ,
				str_set_loc("File saved","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_7_0"),
				0,240,24,2,2,0,color,_alpha,fnt_main)
				
				ini_open("sfsaga.ini");
				var minutes = ini_read_real("World-SL2","MN2",0);
				var seconds = ini_read_real("World-SL2","SC2",0);
				var _dsec = "";
				if(seconds < 10)
						_dsec = ("0"+string(seconds))
				else 
						_dsec=string(seconds)	
				
			   draw_text_transformed_shadow_ext(
			   menu_soul_x2-XL/2-(-100),
			   menu_soul_y2-YL/2-(-85.4),
			   string(minutes) + ":" + string(_dsec),
			   0,24,32,2,2,0,color,_alpha,fnt_main)
			   
			   	var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
			   	draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-180,
				menu_soul_y2-YL/2-(-125),
				area,
				0,240,-40,2,2,0,color,_alpha,fnt_main)
				draw_set_alpha(1);
							   ini_close();
			break;
			#endregion
			
		}
	break;
	#endregion
	#region SELECT FILE TO COPY
	case 7:
			canscale=true;
			
			x_shift_allowed=false;
			index=spr_heartsmall;
			menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;
			menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;				
			menu_soul_dest_scale=2.4;
			menulabel=str_set_loc("Please choose a file to copy.","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_10_0")
			
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-160,
			menu_soul_y2-YL/2-(-190) ,
			string("Copy"),
			0,240,26,2,2,0,c_silver,1,fnt_main)
			
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-40,
			menu_soul_y2-YL/2-(-190) ,
			string("Erase"),
			0,240,26,2,2,0,c_gray,1,fnt_main)
			
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-(-100),
			menu_soul_y2-YL/2-(-190) ,
			string("Quit"),
			0,240,26,2,2,0,c_gray,1,fnt_main)
			
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-270,
			menu_soul_y2-YL/2-210 ,
			menulabel,
			0,240,26,2,2,0,c_white,1,fnt_main)
			
			event_user(1)
	switch(selection){
		#region Slot 0
		case 0:
				_menu_soul_yposh=110;
				menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;	
				event_user(1);
				
				#region Empty/Filled Slot 0
						_alpha=1
						menu_soul_dest_y=132
						#region Slot 1 Unselected
						if(!file_exists("file1")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-36 ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file1")){
							  ini_open("sfsaga.ini");
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							 menu_soul_y2-YL/2-38,
							ini_read_string("Party-SL1","Name2","ERROR"),
							0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
							ini_close();
						}
							if(!file_exists("file1")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						   string(temptime),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						}
							if(file_exists("file1")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL1","MN2",0);
								var seconds = ini_read_real("World-SL1","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
								
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						  string(minutes)+ ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
							}
							if(!file_exists("file1")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
							}
							if(file_exists("file1")){
							ini_open("sfsaga.ini");
							var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							area,
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
							}
						#endregion
						#region Slot 2 Unselected
									if(!file_exists("file2")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-85.4) ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						}
							if(file_exists("file2")){
								 ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4),
								ini_read_string("Party-SL2","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
							}
							if(!file_exists("file2")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
				   				menu_soul_y2-YL/2-(-85.4),
							   string(temptime),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							} 
								if(file_exists("file2")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL2","MN2",0);
									var seconds = ini_read_real("World-SL2","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								  string(minutes)+ ":"+ string(_dsec),
								   0,24,32,2,2,0,
								   c_gray,_alpha,fnt_main)	
								   ini_close();
						}
						if(!file_exists("file2")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
						}
							if(file_exists("file2")){
								ini_open("sfsaga.ini");
								var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								area,
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
				}
						#endregion
						event_user(1);
						#region Slot 0 Selected
							if(!file_exists("file0")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								string(tempname),
								0,12,24,2,2,0,color,_alpha,fnt_main)
						} 
						if(file_exists("file0")){
							    ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								ini_read_string("Party-SL0","Name2","ERROR"),
								0,12,24,2,2,0,color,_alpha,fnt_papyrus)
								ini_close();
						}
						if(!file_exists("file0")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						   string(temptime),
						   0,24,32,2,2,0,
						   color,_alpha,fnt_main)
						} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL0","MN2",0);
								var seconds = ini_read_real("World-SL0","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						  string(minutes) + ":" + string(_dsec),
						   0,24,32,2,2,0,
						   color,_alpha,fnt_main)	
						   ini_close();
						}
						if(!file_exists("file0")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							string(temparea),
							0,240,-40,2,2,0,color,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						} 
						if(file_exists("file0")){
							ini_open("sfsaga.ini");
							var area=ini_read_string("World-SL0","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							area,
							0,240,-40,2,2,0,color,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
						}
						#endregion
				#endregion
				
				index=spr_heartsmallarrow
				draw_set_alpha(1)
		break;
		#endregion
		#region Slot 1
		case 1:
				_menu_soul_yposh=-8;
				menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;
				menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;		
				event_user(1);
				index=spr_heartsmallarrow
				draw_set_alpha(1)
				
				#region Empty/Filled Slot 1
						_alpha=1
						menu_soul_dest_y=11
						#region Slot 0 Unselected
								if(!file_exists("file0")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
						if(file_exists("file0")){
							    ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								ini_read_string("Party-SL0","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
						}
						if(!file_exists("file0")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						   string(temptime),
						   0,24,32,2,2,0,
						  c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL0","MN2",0);
								var seconds = ini_read_real("World-SL0","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						  string(minutes) + ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
						}
						if(!file_exists("file0")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						} 
						if(file_exists("file0")){
							ini_open("sfsaga.ini");
							var area=ini_read_string("World-SL0","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							area,
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
						}
						#endregion
						#region Slot 2 Unselected
									if(!file_exists("file2")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-85.4) ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						}
							if(file_exists("file2")){
								 ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4),
								ini_read_string("Party-SL2","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
							}
							if(!file_exists("file2")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
				   				menu_soul_y2-YL/2-(-85.4),
							   string(temptime),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							} 
								if(file_exists("file2")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL2","MN2",0);
									var seconds = ini_read_real("World-SL2","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								  string(minutes)+ ":"+ string(_dsec),
								   0,24,32,2,2,0,
								   c_gray,_alpha,fnt_main)	
								   ini_close();
						}
						if(!file_exists("file2")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
						}
							if(file_exists("file2")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								area,
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
				}
						#endregion
						event_user(1);
						#region Slot 1 Selected
							if(!file_exists("file1")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-36 ,
							string(tempname),
							0,12,24,2,2,0,color,_alpha,fnt_main)
						} 
							if(file_exists("file1")){
							  ini_open("sfsaga.ini");
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							 menu_soul_y2-YL/2-38,
							ini_read_string("Party-SL1","Name2","ERROR"),
							0,12,24,2,2,0,color,_alpha,fnt_papyrus)
							ini_close();
						}
							if(!file_exists("file1")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						   string(temptime),
						   0,24,32,2,2,0,
						   color,_alpha,fnt_main)	
						}
							if(file_exists("file1")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL1","MN2",0);
								var seconds = ini_read_real("World-SL1","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
								
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						  string(minutes)+ ":" + string(_dsec),
						   0,24,32,2,2,0,
						   color,_alpha,fnt_main)	
						   ini_close();
							}
							if(!file_exists("file1")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							string(temparea),
							0,240,-40,2,2,0,color,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
							}
							if(file_exists("file1")){
							ini_open("sfsaga.ini");
							var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							area,
							0,240,-40,2,2,0,color,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
					}
					#endregion
				#endregion
			
		break;
		#endregion
		#region Slot 2
		case 2:
			_menu_soul_yposh=-128;
			menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;
			menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;		
			event_user(1);
				index=spr_heartsmallarrow
				draw_set_alpha(1)
				switch(copied){
					case 0:
					#region Empty/Filled Slot 2
					_alpha=1
					menu_soul_dest_y=-117
						#region Slot 0 Unselected
								if(!file_exists("file0")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
						if(file_exists("file0")){
							    ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-156.4,
								ini_read_string("Party-SL0","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
						}
						if(!file_exists("file0")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						   string(temptime),
						   0,24,32,2,2,0,
						  c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL0","MN2",0);
								var seconds = ini_read_real("World-SL0","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-156.4,
						  string(minutes) + ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
						}
						if(!file_exists("file0")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						} 
						if(file_exists("file0")){
							ini_open("sfsaga.ini")
							var area=ini_read_string("Woirld-SL0","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-115,
							party_get_room_name(global.currentroom),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						}
						#endregion
						#region Slot 1 Unselected
								if(!file_exists("file1")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-36 ,
							string(tempname),
							0,12,24,2,2,0,c_gray,_alpha,fnt_main)
						} 
							if(file_exists("file1")){
							  ini_open("sfsaga.ini");
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							 menu_soul_y2-YL/2-38,
							ini_read_string("Party-SL1","Name2","ERROR"),
							0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
							ini_close();
						}
							if(!file_exists("file1")){
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						   string(temptime),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						}
							if(file_exists("file1")){
								ini_open("sfsaga.ini");
								var minutes = ini_read_real("World-SL1","MN2",0);
								var seconds = ini_read_real("World-SL1","SC2",0);
								var _dsec = "";
								if(seconds < 10)
									_dsec = ("0"+string(seconds))
								else 
									_dsec=string(seconds)
								
							draw_text_transformed_shadow_ext(
						   menu_soul_x2-XL/2-(-100),
						   menu_soul_y2-YL/2-38,
						  string(minutes)+ ":" + string(_dsec),
						   0,24,32,2,2,0,
						   c_gray,_alpha,fnt_main)	
						   ini_close();
							}
							if(!file_exists("file1")){
						   	draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							string(temparea),
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
							}
							if(file_exists("file1")){
							ini_open("sfsaga.ini")
							var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
							draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-3),
							area,
							0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
						   draw_set_alpha(1)
						   draw_set_color(col_main)
						   ini_close();
							}
						#endregion
					event_user(1);
						#region Slot 2 Selected
						if(!file_exists("file2")){
							 draw_text_transformed_shadow_ext(
							menu_soul_x2-XL/2-180,
							menu_soul_y2-YL/2-(-85.4) ,
							string(tempname),
							0,12,24,2,2,0,color,_alpha,fnt_main)
						}
							if(file_exists("file2")){
								 ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4),
								ini_read_string("Party-SL2","Name2","ERROR"),
								0,12,24,2,2,0,color,_alpha,fnt_papyrus)
								ini_close();
							}
							if(!file_exists("file2")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
				   				menu_soul_y2-YL/2-(-85.4),
							   string(temptime),
							   0,24,32,2,2,0,
							   color,_alpha,fnt_main)	
							} 
								if(file_exists("file2")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL2","MN2",0);
									var seconds = ini_read_real("World-SL2","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								  string(minutes)+ ":"+ string(_dsec),
								   0,24,32,2,2,0,
								   color,_alpha,fnt_main)	
								   ini_close();
						}
						if(!file_exists("file2")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								string(temparea),
								0,240,-40,2,2,0,color,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
						}
							if(file_exists("file2")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-125),
								area,
								0,240,-40,2,2,0,color,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
				}
				#endregion
				#endregion				
					break;
				}

				
		break;
		#endregion
	}
	break;
	#endregion
	#region SELECT A FILE TO COPY FROM
	case 8:
			canscale=true;
			
			x_shift_allowed=true;
			_menu_soul_yposh=110;
			menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;	
			event_user(1);
				
			index=spr_heartsmallarrow
			menulabel=str_set_loc("Please choose a file to copy.","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_10_0")
			
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-160,
			menu_soul_y2-YL/2-(-190) ,
			string("Copy"),
			0,240,26,2,2,0,c_silver,1,fnt_main)
			
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-40,
			menu_soul_y2-YL/2-(-190) ,
			string("Erase"),
			0,240,26,2,2,0,c_gray,1,fnt_main)
			
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-(-100),
			menu_soul_y2-YL/2-(-190) ,
			string("Quit"),
			0,240,26,2,2,0,c_gray,1,fnt_main)
			
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-270,
			menu_soul_y2-YL/2-210 ,
			menulabel,
			0,240,26,2,2,0,c_white,1,fnt_main)
			
			event_user(1)
	switch(selection){
		#region Slot 0
		case 0:
				_menu_soul_yposh=110;
				menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;	
				event_user(1);
				
				draw_set_alpha(1)
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-180,
				menu_soul_y4-YL/2-156.4,
				str_set_loc("Copy from this file?","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_17_0"),0,240,24,2,2,0,color,_alpha,fnt_main)
			
			   	draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-140,
				menu_soul_y4-YL/2-115,
				string(choice[0]),
				0,240,-40,2,2,0,subSelection == 0 && subState==8 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-(-30),
				menu_soul_y2-YL/2-115,
				string(choice[1]),
				0,240,-40,2,2,0,subSelection == 1 && subState==8 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				draw_set_alpha(1);
		break;
		#endregion
		#region Slot 1
		case 1:
				_menu_soul_yposh=-8;
				menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;
				menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;		
				event_user(1);
				
				draw_set_alpha(1)
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-180,
				menu_soul_y4-YL/2-36 ,
				str_set_loc("Copy from this file?","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_17_0"),0,240,24,2,2,0,color,_alpha,fnt_main)
			
			   	draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-140,
				menu_soul_y4-YL/2-(-5),
				string(choice[0]),
				0,240,-40,2,2,0,subSelection == 0 && subState== 8 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/2-(-30),
				menu_soul_y4-YL/2-(-5),
				string(choice[1]),
				0,240,-40,2,2,0,subSelection == 1 && subState==8 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
		break;
		#endregion
		#region Slot 2
		case 2:
			_menu_soul_yposh=-128;
			menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;
			menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;		
			event_user(1);
				index=spr_heartsmallarrow
				draw_set_alpha(1)
				switch(saved){
					case 0:
						draw_text_transformed_shadow_ext(
						menu_soul_x4-XL/2-180,
						menu_soul_y4-YL/2-(-85) ,
						str_set_loc("Copy from this file?","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_17_0"),0,240,24,2,2,0,color,_alpha,fnt_main)
			
					   	draw_text_transformed_shadow_ext(
						menu_soul_x4-XL/2-140,
						menu_soul_y4-YL/2-(-125),
						string(choice[0]),
						0,240,-40,2,2,0,subSelection == 0 && subState==8 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				
						draw_text_transformed_shadow_ext(
						menu_soul_x4-XL/2-(-30),
						menu_soul_y4-YL/2-(-125),
						string(choice[1]),
						0,240,-40,2,2,0,subSelection == 1 && subState=8  && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
					break;
				}

				
		break;
		#endregion
	}
	#endregion
	#region SELECT A FILE TO COPY TO
	case 9:
			canscale=false;
			x_shift_allowed=false;
			index=spr_heartsmall;
			menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;
			menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;				
			menu_soul_dest_scale=2.4;
			event_user(1)
		
			menulabel=str_set_loc("Please choose a file to copy.","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_10_0")
			
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-160,
			menu_soul_y2-YL/2-(-190) ,
			string("Copy"),
			0,240,26,2,2,0,c_silver,1,fnt_main)
			
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-40,
			menu_soul_y2-YL/2-(-190) ,
			string("Erase"),
			0,240,26,2,2,0,c_gray,1,fnt_main)
			
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-(-100),
			menu_soul_y2-YL/2-(-190) ,
			string("Quit"),
			0,240,26,2,2,0,c_gray,1,fnt_main)
			
			draw_text_transformed_shadow_ext(
			menu_soul_x2-XL/2-270,
			menu_soul_y2-YL/2-210 ,
			menulabel,
			0,240,26,2,2,0,c_white,1,fnt_main)
		if copyBaseValue == 0 {
			if copySelection == 0{
			  #region Slot 0 (Source)
									if(!file_exists("file0")){
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-156.4,
									string(tempname),
									0,12,24,2,2,0,c_gray,_alpha,fnt_main)
							} 
							if(file_exists("file0")){
								    ini_open("sfsaga.ini");
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-156.4,
									ini_read_string("Party-SL0","Name2","ERROR"),
									0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
									ini_close();
							}
							if(!file_exists("file0")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-156.4,
							   string(temptime),
							   0,24,32,2,2,0,
							  c_gray,_alpha,fnt_main)
							} 
								if(file_exists("file0")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL0","MN2",0);
									var seconds = ini_read_real("World-SL0","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-156.4,
							  string(minutes) + ":" + string(_dsec),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							   ini_close();
							}
							if(!file_exists("file0")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-115,
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("Woirld-SL0","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-115,
								party_get_room_name(global.currentroom),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							}
							#endregion
			  #region Slot 1 (Possible Target)
									if(!file_exists("file1")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-36 ,
								string(tempname),
								0,12,24,2,2,0,c_white,_alpha,fnt_main)
							} 
								if(file_exists("file1")){
								  ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								 menu_soul_y2-YL/2-38,
								ini_read_string("Party-SL1","Name2","ERROR"),
								0,12,24,2,2,0,c_white,_alpha,fnt_papyrus)
								ini_close();
							}
								if(!file_exists("file1")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-38,
							   string(temptime),
							   0,24,32,2,2,0,
							   c_white,_alpha,fnt_main)	
							}
								if(file_exists("file1")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL1","MN2",0);
									var seconds = ini_read_real("World-SL1","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
								
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-38,
							  string(minutes)+ ":" + string(_dsec),
							   0,24,32,2,2,0,
							   c_white,_alpha,fnt_main)	
							   ini_close();
								}
								if(!file_exists("file1")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-3),
								string(temparea),
								0,240,-40,2,2,0,c_white,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
								}
								if(file_exists("file1")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-3),
								area,
								0,240,-40,2,2,0,c_white,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
								}
							#endregion
			  #region Slot 2 (Possible Target)
							if(!file_exists("file2")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4) ,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
							}
								if(file_exists("file2")){
									 ini_open("sfsaga.ini");
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-85.4),
									ini_read_string("Party-SL2","Name2","ERROR"),
									0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
									ini_close();
								}
								if(!file_exists("file2")){
									draw_text_transformed_shadow_ext(
								   menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								   string(temptime),
								   0,24,32,2,2,0,
								   c_gray,_alpha,fnt_main)	
								} 
									if(file_exists("file2")){
										ini_open("sfsaga.ini");
										var minutes = ini_read_real("World-SL2","MN2",0);
										var seconds = ini_read_real("World-SL2","SC2",0);
										var _dsec = "";
										if(seconds < 10)
											_dsec = ("0"+string(seconds))
										else 
											_dsec=string(seconds)
										draw_text_transformed_shadow_ext(
										menu_soul_x2-XL/2-(-100),
						   				menu_soul_y2-YL/2-(-85.4),
									  string(minutes)+ ":"+ string(_dsec),
									   0,24,32,2,2,0,
									   c_gray,_alpha,fnt_main)	
									   ini_close();
							}
							if(!file_exists("file2")){
								   	draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-125),
									string(temparea),
									0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
								   draw_set_alpha(1)
								   draw_set_color(c_gray)
							}
								if(file_exists("file2")){
									ini_open("sfsaga.ini")
									var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-125),
									area,
									0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
								   draw_set_alpha(1)
								   draw_set_color(c_gray)
								   ini_close();
					}
					#endregion	
			}
			if copySelection == 1 {
			  #region Slot 0 (Source)
									if(!file_exists("file0")){
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-156.4,
									string(tempname),
									0,12,24,2,2,0,c_gray,_alpha,fnt_main)
							} 
							if(file_exists("file0")){
								    ini_open("sfsaga.ini");
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-156.4,
									ini_read_string("Party-SL0","Name2","ERROR"),
									0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
									ini_close();
							}
							if(!file_exists("file0")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-156.4,
							   string(temptime),
							   0,24,32,2,2,0,
							  c_gray,_alpha,fnt_main)
							} 
								if(file_exists("file0")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL0","MN2",0);
									var seconds = ini_read_real("World-SL0","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-156.4,
							  string(minutes) + ":" + string(_dsec),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							   ini_close();
							}
							if(!file_exists("file0")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-115,
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("Woirld-SL0","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-115,
								party_get_room_name(global.currentroom),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							}
							#endregion
			  #region Slot 1 (Possible Target)
									if(!file_exists("file1")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-36 ,
								string(tempname),
								0,12,24,2,2,0,c_white,_alpha,fnt_main)
							} 
								if(file_exists("file1")){
								  ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								 menu_soul_y2-YL/2-38,
								ini_read_string("Party-SL1","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
							}
								if(!file_exists("file1")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-38,
							   string(temptime),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							}
								if(file_exists("file1")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL1","MN2",0);
									var seconds = ini_read_real("World-SL1","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
								
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-38,
							  string(minutes)+ ":" + string(_dsec),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							   ini_close();
								}
								if(!file_exists("file1")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-3),
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
								}
								if(file_exists("file1")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-3),
								area,
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
								}
							#endregion
			  #region Slot 2 (Possible Target)
							if(!file_exists("file2")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4) ,
								string(tempname),
								0,12,24,2,2,0,c_white,_alpha,fnt_main)
							}
								if(file_exists("file2")){
									 ini_open("sfsaga.ini");
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-85.4),
									ini_read_string("Party-SL2","Name2","ERROR"),
									0,12,24,2,2,0,c_white,_alpha,fnt_papyrus)
									ini_close();
								}
								if(!file_exists("file2")){
									draw_text_transformed_shadow_ext(
								   menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								   string(temptime),
								   0,24,32,2,2,0,
								   c_white,_alpha,fnt_main)	
								} 
									if(file_exists("file2")){
										ini_open("sfsaga.ini");
										var minutes = ini_read_real("World-SL2","MN2",0);
										var seconds = ini_read_real("World-SL2","SC2",0);
										var _dsec = "";
										if(seconds < 10)
											_dsec = ("0"+string(seconds))
										else 
											_dsec=string(seconds)
										draw_text_transformed_shadow_ext(
										menu_soul_x2-XL/2-(-100),
						   				menu_soul_y2-YL/2-(-85.4),
									  string(minutes)+ ":"+ string(_dsec),
									   0,24,32,2,2,0,
									   c_white,_alpha,fnt_main)	
									   ini_close();
							}
							if(!file_exists("file2")){
								   	draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-125),
									string(temparea),
									0,240,-40,2,2,0,c_white,_alpha,fnt_main)
								   draw_set_alpha(1)
								   draw_set_color(c_white)
							}
								if(file_exists("file2")){
									ini_open("sfsaga.ini")
									var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-125),
									area,
									0,240,-40,2,2,0,c_white,_alpha,fnt_main)
								   draw_set_alpha(1)
								   draw_set_color(c_white)
								   ini_close();
					}
					#endregion	
			}
		} 
		if copyBaseValue == 1 {
			if copySelection == 0{
			  #region Slot 0 (Possible Target)
									if(!file_exists("file0")){
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-156.4,
									string(tempname),
									0,12,24,2,2,0,c_white,_alpha,fnt_main)
							} 
							if(file_exists("file0")){
								    ini_open("sfsaga.ini");
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-156.4,
									ini_read_string("Party-SL0","Name2","ERROR"),
									0,12,24,2,2,0,c_white,_alpha,fnt_papyrus)
									ini_close();
							}
							if(!file_exists("file0")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-156.4,
							   string(temptime),
							   0,24,32,2,2,0,
							  c_white,_alpha,fnt_main)
							} 
								if(file_exists("file0")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL0","MN2",0);
									var seconds = ini_read_real("World-SL0","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-156.4,
							  string(minutes) + ":" + string(_dsec),
							   0,24,32,2,2,0,
							   c_white,_alpha,fnt_main)	
							   ini_close();
							}
							if(!file_exists("file0")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-115,
								string(temparea),
								0,240,-40,2,2,0,c_white,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("Woirld-SL0","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-115,
								party_get_room_name(global.currentroom),
								0,240,-40,2,2,0,c_white,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							}
							#endregion
			  #region Slot 1 (Source)
									if(!file_exists("file1")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-36 ,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
							} 
								if(file_exists("file1")){
								  ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								 menu_soul_y2-YL/2-38,
								ini_read_string("Party-SL1","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
							}
								if(!file_exists("file1")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-38,
							   string(temptime),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							}
								if(file_exists("file1")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL1","MN2",0);
									var seconds = ini_read_real("World-SL1","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
								
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-38,
							  string(minutes)+ ":" + string(_dsec),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							   ini_close();
								}
								if(!file_exists("file1")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-3),
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
								}
								if(file_exists("file1")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-3),
								area,
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
								}
							#endregion
			  #region Slot 2 (Possible Target)
							if(!file_exists("file2")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4) ,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
							}
								if(file_exists("file2")){
									 ini_open("sfsaga.ini");
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-85.4),
									ini_read_string("Party-SL2","Name2","ERROR"),
									0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
									ini_close();
								}
								if(!file_exists("file2")){
									draw_text_transformed_shadow_ext(
								   menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								   string(temptime),
								   0,24,32,2,2,0,
								   c_gray,_alpha,fnt_main)	
								} 
									if(file_exists("file2")){
										ini_open("sfsaga.ini");
										var minutes = ini_read_real("World-SL2","MN2",0);
										var seconds = ini_read_real("World-SL2","SC2",0);
										var _dsec = "";
										if(seconds < 10)
											_dsec = ("0"+string(seconds))
										else 
											_dsec=string(seconds)
										draw_text_transformed_shadow_ext(
										menu_soul_x2-XL/2-(-100),
						   				menu_soul_y2-YL/2-(-85.4),
									  string(minutes)+ ":"+ string(_dsec),
									   0,24,32,2,2,0,
									   c_gray,_alpha,fnt_main)	
									   ini_close();
							}
							if(!file_exists("file2")){
								   	draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-125),
									string(temparea),
									0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
								   draw_set_alpha(1)
								   draw_set_color(c_gray)
							}
								if(file_exists("file2")){
									ini_open("sfsaga.ini")
									var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-125),
									area,
									0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
								   draw_set_alpha(1)
								   draw_set_color(c_gray)
								   ini_close();
					}
					#endregion	
			}
			if copySelection == 1 {
			  #region Slot 0 (Possible Target)
									if(!file_exists("file0")){
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-156.4,
									string(tempname),
									0,12,24,2,2,0,c_gray,_alpha,fnt_main)
							} 
							if(file_exists("file0")){
								    ini_open("sfsaga.ini");
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-156.4,
									ini_read_string("Party-SL0","Name2","ERROR"),
									0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
									ini_close();
							}
							if(!file_exists("file0")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-156.4,
							   string(temptime),
							   0,24,32,2,2,0,
							  c_gray,_alpha,fnt_main)
							} 
								if(file_exists("file0")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL0","MN2",0);
									var seconds = ini_read_real("World-SL0","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-156.4,
							  string(minutes) + ":" + string(_dsec),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							   ini_close();
							}
							if(!file_exists("file0")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-115,
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("Woirld-SL0","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-115,
								party_get_room_name(global.currentroom),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							}
							#endregion
			  #region Slot 1 (Source)
									if(!file_exists("file1")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-36 ,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
							} 
								if(file_exists("file1")){
								  ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								 menu_soul_y2-YL/2-38,
								ini_read_string("Party-SL1","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
							}
								if(!file_exists("file1")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-38,
							   string(temptime),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							}
								if(file_exists("file1")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL1","MN2",0);
									var seconds = ini_read_real("World-SL1","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
								
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-38,
							  string(minutes)+ ":" + string(_dsec),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							   ini_close();
								}
								if(!file_exists("file1")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-3),
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
								}
								if(file_exists("file1")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-3),
								area,
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
								}
							#endregion
			  #region Slot 2 (Possible Target)
							if(!file_exists("file2")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4) ,
								string(tempname),
								0,12,24,2,2,0,c_white,_alpha,fnt_main)
							}
								if(file_exists("file2")){
									 ini_open("sfsaga.ini");
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-85.4),
									ini_read_string("Party-SL2","Name2","ERROR"),
									0,12,24,2,2,0,c_white,_alpha,fnt_papyrus)
									ini_close();
								}
								if(!file_exists("file2")){
									draw_text_transformed_shadow_ext(
								   menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								   string(temptime),
								   0,24,32,2,2,0,
								   c_white,_alpha,fnt_main)	
								} 
									if(file_exists("file2")){
										ini_open("sfsaga.ini");
										var minutes = ini_read_real("World-SL2","MN2",0);
										var seconds = ini_read_real("World-SL2","SC2",0);
										var _dsec = "";
										if(seconds < 10)
											_dsec = ("0"+string(seconds))
										else 
											_dsec=string(seconds)
										draw_text_transformed_shadow_ext(
										menu_soul_x2-XL/2-(-100),
						   				menu_soul_y2-YL/2-(-85.4),
									  string(minutes)+ ":"+ string(_dsec),
									   0,24,32,2,2,0,
									   c_white,_alpha,fnt_main)	
									   ini_close();
							}
							if(!file_exists("file2")){
								   	draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-125),
									string(temparea),
									0,240,-40,2,2,0,c_white,_alpha,fnt_main)
								   draw_set_alpha(1)
								   draw_set_color(c_white)
							}
								if(file_exists("file2")){
									ini_open("sfsaga.ini")
									var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-125),
									area,
									0,240,-40,2,2,0,c_white,_alpha,fnt_main)
								   draw_set_alpha(1)
								   draw_set_color(c_white)
								   ini_close();
					}
					#endregion	
			}
		} 
		if copyBaseValue == 2 {
			if copySelection == 0{
			  #region Slot 0 (Possible Target)
									if(!file_exists("file0")){
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-156.4,
									string(tempname),
									0,12,24,2,2,0,c_white,_alpha,fnt_main)
							} 
							if(file_exists("file0")){
								    ini_open("sfsaga.ini");
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-156.4,
									ini_read_string("Party-SL0","Name2","ERROR"),
									0,12,24,2,2,0,c_white,_alpha,fnt_papyrus)
									ini_close();
							}
							if(!file_exists("file0")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-156.4,
							   string(temptime),
							   0,24,32,2,2,0,
							  c_white,_alpha,fnt_main)
							} 
								if(file_exists("file0")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL0","MN2",0);
									var seconds = ini_read_real("World-SL0","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-156.4,
							  string(minutes) + ":" + string(_dsec),
							   0,24,32,2,2,0,
							   c_white,_alpha,fnt_main)	
							   ini_close();
							}
							if(!file_exists("file0")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-115,
								string(temparea),
								0,240,-40,2,2,0,c_white,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("Woirld-SL0","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-115,
								party_get_room_name(global.currentroom),
								0,240,-40,2,2,0,c_white,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							}
							#endregion
			  #region Slot 1 (Possible Target)
									if(!file_exists("file1")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-36 ,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
							} 
								if(file_exists("file1")){
								  ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								 menu_soul_y2-YL/2-38,
								ini_read_string("Party-SL1","Name2","ERROR"),
								0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
								ini_close();
							}
								if(!file_exists("file1")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-38,
							   string(temptime),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							}
								if(file_exists("file1")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL1","MN2",0);
									var seconds = ini_read_real("World-SL1","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
								
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-38,
							  string(minutes)+ ":" + string(_dsec),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							   ini_close();
								}
								if(!file_exists("file1")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-3),
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
								}
								if(file_exists("file1")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-3),
								area,
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
								}
							#endregion
			  #region Slot 2 (Source)
							if(!file_exists("file2")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4) ,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
							}
								if(file_exists("file2")){
									 ini_open("sfsaga.ini");
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-85.4),
									ini_read_string("Party-SL2","Name2","ERROR"),
									0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
									ini_close();
								}
								if(!file_exists("file2")){
									draw_text_transformed_shadow_ext(
								   menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								   string(temptime),
								   0,24,32,2,2,0,
								   c_gray,_alpha,fnt_main)	
								} 
									if(file_exists("file2")){
										ini_open("sfsaga.ini");
										var minutes = ini_read_real("World-SL2","MN2",0);
										var seconds = ini_read_real("World-SL2","SC2",0);
										var _dsec = "";
										if(seconds < 10)
											_dsec = ("0"+string(seconds))
										else 
											_dsec=string(seconds)
										draw_text_transformed_shadow_ext(
										menu_soul_x2-XL/2-(-100),
						   				menu_soul_y2-YL/2-(-85.4),
									  string(minutes)+ ":"+ string(_dsec),
									   0,24,32,2,2,0,
									   c_gray,_alpha,fnt_main)	
									   ini_close();
							}
							if(!file_exists("file2")){
								   	draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-125),
									string(temparea),
									0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
								   draw_set_alpha(1)
								   draw_set_color(c_gray)
							}
								if(file_exists("file2")){
									ini_open("sfsaga.ini")
									var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-125),
									area,
									0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
								   draw_set_alpha(1)
								   draw_set_color(c_gray)
								   ini_close();
					}
					#endregion	
			}
			if copySelection == 1 {
			  #region Slot 0 (Possible Target)
									if(!file_exists("file0")){
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-156.4,
									string(tempname),
									0,12,24,2,2,0,c_gray,_alpha,fnt_main)
							} 
							if(file_exists("file0")){
								    ini_open("sfsaga.ini");
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-156.4,
									ini_read_string("Party-SL0","Name2","ERROR"),
									0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
									ini_close();
							}
							if(!file_exists("file0")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-156.4,
							   string(temptime),
							   0,24,32,2,2,0,
							  c_gray,_alpha,fnt_main)
							} 
								if(file_exists("file0")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL0","MN2",0);
									var seconds = ini_read_real("World-SL0","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-156.4,
							  string(minutes) + ":" + string(_dsec),
							   0,24,32,2,2,0,
							   c_gray,_alpha,fnt_main)	
							   ini_close();
							}
							if(!file_exists("file0")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-115,
								string(temparea),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							} 
							if(file_exists("file0")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("Woirld-SL0","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-115,
								party_get_room_name(global.currentroom),
								0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							}
							#endregion
			  #region Slot 1 (Possible Target)
									if(!file_exists("file1")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-36 ,
								string(tempname),
								0,12,24,2,2,0,c_white,_alpha,fnt_main)
							} 
								if(file_exists("file1")){
								  ini_open("sfsaga.ini");
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								 menu_soul_y2-YL/2-38,
								ini_read_string("Party-SL1","Name2","ERROR"),
								0,12,24,2,2,0,c_white,_alpha,fnt_papyrus)
								ini_close();
							}
								if(!file_exists("file1")){
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-38,
							   string(temptime),
							   0,24,32,2,2,0,
							   c_white,_alpha,fnt_main)	
							}
								if(file_exists("file1")){
									ini_open("sfsaga.ini");
									var minutes = ini_read_real("World-SL1","MN2",0);
									var seconds = ini_read_real("World-SL1","SC2",0);
									var _dsec = "";
									if(seconds < 10)
										_dsec = ("0"+string(seconds))
									else 
										_dsec=string(seconds)
								
								draw_text_transformed_shadow_ext(
							   menu_soul_x2-XL/2-(-100),
							   menu_soul_y2-YL/2-38,
							  string(minutes)+ ":" + string(_dsec),
							   0,24,32,2,2,0,
							   c_white,_alpha,fnt_main)	
							   ini_close();
								}
								if(!file_exists("file1")){
							   	draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-3),
								string(temparea),
								0,240,-40,2,2,0,c_white,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
								}
								if(file_exists("file1")){
								ini_open("sfsaga.ini")
								var area=ini_read_string("World-SL1","roomname","Carrion Isles - Beach")
								draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-3),
								area,
								0,240,-40,2,2,0,c_white,_alpha,fnt_main)
							   draw_set_alpha(1)
							   draw_set_color(col_main)
							   ini_close();
								}
							#endregion
			  #region Slot 2 (Source)
							if(!file_exists("file2")){
								 draw_text_transformed_shadow_ext(
								menu_soul_x2-XL/2-180,
								menu_soul_y2-YL/2-(-85.4) ,
								string(tempname),
								0,12,24,2,2,0,c_gray,_alpha,fnt_main)
							}
								if(file_exists("file2")){
									 ini_open("sfsaga.ini");
									 draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-85.4),
									ini_read_string("Party-SL2","Name2","ERROR"),
									0,12,24,2,2,0,c_gray,_alpha,fnt_papyrus)
									ini_close();
								}
								if(!file_exists("file2")){
									draw_text_transformed_shadow_ext(
								   menu_soul_x2-XL/2-(-100),
					   				menu_soul_y2-YL/2-(-85.4),
								   string(temptime),
								   0,24,32,2,2,0,
								   c_gray,_alpha,fnt_main)	
								} 
									if(file_exists("file2")){
										ini_open("sfsaga.ini");
										var minutes = ini_read_real("World-SL2","MN2",0);
										var seconds = ini_read_real("World-SL2","SC2",0);
										var _dsec = "";
										if(seconds < 10)
											_dsec = ("0"+string(seconds))
										else 
											_dsec=string(seconds)
										draw_text_transformed_shadow_ext(
										menu_soul_x2-XL/2-(-100),
						   				menu_soul_y2-YL/2-(-85.4),
									  string(minutes)+ ":"+ string(_dsec),
									   0,24,32,2,2,0,
									   c_gray,_alpha,fnt_main)	
									   ini_close();
							}
							if(!file_exists("file2")){
								   	draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-125),
									string(temparea),
									0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
								   draw_set_alpha(1)
								   draw_set_color(c_gray)
							}
								if(file_exists("file2")){
									ini_open("sfsaga.ini")
									var area=ini_read_string("World-SL2","roomname","Carrion Isles - Beach")
									draw_text_transformed_shadow_ext(
									menu_soul_x2-XL/2-180,
									menu_soul_y2-YL/2-(-125),
									area,
									0,240,-40,2,2,0,c_gray,_alpha,fnt_main)
								   draw_set_alpha(1)
								   draw_set_color(c_gray)
								   ini_close();
					}
					#endregion	
			}
		} 
	break;
	#endregion
	#region SELECT QUIT OPTION
	case 10:
			_bg_alpha=1;
			switch(subSelection){
				case 0:
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-160,
				menu_soul_y2-YL/2-(60) ,
				string("Quit to Title"),
				0,240,26,2,2,0,c_yellow,1,fnt_main)
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-160,
				menu_soul_y2-YL/2-(20) ,
				string("Quit Game"),
				0,240,26,2,2,0,c_gray,1,fnt_main)
				break;
				case 1:
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-160,
				menu_soul_y2-YL/2-(60) ,
				string("Quit to Title"),
				0,240,26,2,2,0,c_gray,1,fnt_main)
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-160,
				menu_soul_y2-YL/2-(20) ,
				string("Quit Game"),
				0,240,26,2,2,0,c_yellow,1,fnt_main)
				break;
			}
	break;
	#endregion
}

#region DRAW SOUL
draw_sprite_ext(index,image_index/10,
menu_soul_x2-XL/2-_menu_soul_xpos,
menu_soul_y2-YL/2-_menu_soul_ypos,
SS,SS,0,
c_white,subState==1 ? 0 : _alpha);
draw_set_alpha(1);
#endregion