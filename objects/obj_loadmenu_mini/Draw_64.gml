if(live_call()) return live_result;
draw_set_alpha(_bg_alpha/2)
draw_set_color(c_black);
draw_rectangle(x,y,RES_W*RES_SCALE,RES_H*RES_SCALE,false)

if(!ctrl_global.borderEnabled){
	display_set_gui_size(global.gui_res_w,global.gui_res_h)	
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
   draw_sprite_ext(spr_textbox_DW,image_index/16,box_x2-XL/2,box_y2-YL/2,1.5,1.5,0,c_white,_alpha);
}
switch(subState){
	case 0: 
		canscale=false;
		x_shift_allowed=false;
		index=spr_heartsmall;
		menu_soul_dest_y=menu_soul_y4-YL/2-_menu_soul_yposh;
		menu_soul_dest_x=menu_soul_x4-XL/2-_menu_soul_xposh;				
		menu_soul_dest_scale=2.4;
		event_user(1);
	if!(_overwrite){
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
		}
	} 
	break;	
	case 1:
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
				menu_soul_x4-XL/3-180,
				menu_soul_y4-YL/2-156.4,
				str_set_loc("Load this file?","DEVICE_LOAD_MENU_REVISED_Draw_64_slash_0_0"),0,240,24,2,2,0,color,_alpha,fnt_main)
			
			   	draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/3-140,
				menu_soul_y4-YL/2-115,
				string(choice[0]),
				0,240,-40,2,2,0,subSelection == 0 && subState==1 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				
				draw_text_transformed_shadow_ext(
				menu_soul_x2-XL/2-(-30),
				menu_soul_y2-YL/2-115,
				string(choice[1]),
				0,240,-40,2,2,0,subSelection == 1 && subState==1 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
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
				menu_soul_x4-XL/3-180,
				menu_soul_y4-YL/2-36 ,
				str_set_loc("Load this file?","DEVICE_LOAD_MENU_REVISED_Draw_64_slash_0_0"),0,240,24,2,2,0,color,_alpha,fnt_main)
			
			   	draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/3-140,
				menu_soul_y4-YL/2-(-5),
				string(choice[0]),
				0,240,-40,2,2,0,subSelection == 0 && subState==1 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				
				draw_text_transformed_shadow_ext(
				menu_soul_x4-XL/3-(-30),
				menu_soul_y4-YL/2-(-5),
				string(choice[1]),
				0,240,-40,2,2,0,subSelection == 1 && subState==1 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
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
						menu_soul_x4-XL/3-180,
						menu_soul_y4-YL/2-(-85) ,
						str_set_loc("Load this file?","DEVICE_LOAD_MENU_REVISED_Draw_64_slash_0_0"),0,240,24,2,2,0,color,_alpha,fnt_main)
			
					   	draw_text_transformed_shadow_ext(
						menu_soul_x4-XL/3-140,
						menu_soul_y4-YL/2-(-125),
						string(choice[0]),
						0,240,-40,2,2,0,subSelection == 0 && subState==1 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
				
						draw_text_transformed_shadow_ext(
						menu_soul_x4-XL/3-(-30),
						menu_soul_y4-YL/2-(-125),
						string(choice[1]),
						0,240,-40,2,2,0,subSelection == 1 && subState==1 && choicemade==true ? c_yellow : c_white,_alpha,fnt_main)
					break;
				}

				
		break;
		#endregion
	}
	break;
}
draw_sprite_ext(index,image_index/10,
menu_soul_x2-XL/2-_menu_soul_xpos,
menu_soul_y2-YL/2-_menu_soul_ypos,
SS,SS,0,
c_white,subState==2 ? 0 : _alpha);
draw_set_alpha(1);