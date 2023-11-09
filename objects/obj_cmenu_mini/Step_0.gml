if input.target == "cmenu" {
if  pressed("right") && subState==1
	snd_play(snd_squeak,8,false);
if  pressed("left") && subState==1
	snd_play(snd_squeak,8,false);
	
if (_menu_stat_alpha < 0.3 && killMenu == true ) {instance_destroy()}
switch(subState){
	case -1:
		if(!enable){
		event_user(0);
		}
	break;
	#region CORE MENU NAVIGATION
	#region BASIC SELECTION
	case 0:
		if  pressed("right")
				selection++
				//snd_play(snd_squeak,8,false);
		if  pressed("left")
				selection--			
			//	snd_play(snd_squeak,8,false);
		selection = clamp(selection, 0,3);
		if(enable){
		cmenuActive=true;
		}
		if(pressed("cancel")){
			event_user(2);	
		}
		switch(selection){
			case 0: 
				_opt_index = 0;
				if(enable){
					PLAYER.active=false;
					PLAYER.image_speed = 0;
					if(pressed("action")&&cmenuActive==true){
						snd_play(snd_select,8,false,0.6,0,1);
						subState=1;
						cmenuState=(1<<0);
						cmenuActive=true;
					}
				}
			break;
			case 1:
				_opt_index = 1;
					if(enable){
					PLAYER.active=false;
					PLAYER.image_speed = 0;
					if(pressed("action")&&cmenuActive==true){
						snd_play(snd_select,8,false,0.6,0,1);
						subState=5;
						cmenuState=(1<<1);
						cmenuActive=true;
						charSelection = 0;
					}
				}
			break;
			case 2:
				_opt_index = 2;
					if(enable){
					PLAYER.active=false;
					PLAYER.image_speed = 0;
						if(pressed("action")&&cmenuActive==true){
							snd_play(snd_select,8,false,0.6,0,1);
							subState=7;
							cmenuState=(1<<2);
							cmenuActive=true;
						}
					}
			break;
			case 3:
				_opt_index = 3;
				if(enable){
					PLAYER.active=false;
					PLAYER.image_speed = 0;
					if(pressed("action")&&cmenuActive==true){
						snd_play(snd_select,8,false,0.6,0,1);
						subState=7;
						cmenuState=(3<<0);
						cmenuActive=true;
					}
				}
			break;
		}
	break;
	#endregion
	#region BASIC ITEM HANDLING
	case 1:
			if(selectedInventory<1){
				if pressed("right")
					subSelection++;
				if pressed("left")
					subSelection--;		
			} 
			subSelection=clamp(subSelection,0,2);
			optSelection=clamp(optSelection,0,2);
			switch(subSelection){
				case 0:
					if(pressed("action")&&cmenuActive==true){
							optSelection=0;
							selectedInventory=1;
							optAlpha=0;
							optSoulAlpha=0;
					}
					if pressed("down")
							if(selectedItem<5){
								selectedItem++;
								item_exists_inslot(selectedItem,1)
							} else if(selectedItem<13){
									selectedItem++;
									item_exists_inslot(selectedItem,1)
							}
					if pressed("up")
							if(selectedItem<5){
								selectedItem--;
							} else if(selectedItem<13){
								selectedItem--;
							}
					selectedItem=clamp(selectedItem,0,11);
											var valid_ids  = [1]
					switch(selectedItem){
						case 0:
							optSoulSX=90;
							optSoulSY=175;
							if  pressed("right")
								selectedItem=6;
								item_exists_inslot(selectedItem,array_length(valid_ids))
								if(selectedInventory==1){
									if(pressed("action"))&&cmenuActive==true{
										subState=2;
									}
								}
						break;
						case 1:
							optSoulSX=90;
							optSoulSY=175+(30);
							if  pressed("right")
								selectedItem=7;
								item_exists_inslot(selectedItem,array_length(valid_ids))
						break;
						case 2:
							optSoulSX=90;
							optSoulSY=175+(63);
							if  pressed("right")
								selectedItem=8;
								item_exists_inslot(selectedItem,array_length(valid_ids))
						break;
						case 3:
							optSoulSX=90;
							optSoulSY=175+(93);
							if pressed("right")
								selectedItem=9;
								item_exists_inslot(selectedItem,array_length(valid_ids))
						break;
						case 4:
							optSoulSX=90;
							optSoulSY=175+(125);
							if  pressed("right")
								selectedItem=10;
								item_exists_inslot(selectedItem,array_length(valid_ids))
						break;
						case 5:
							optSoulSX=90;
							optSoulSY=175+(155);
							if  pressed("right")
								selectedItem=11;
								item_exists_inslot(selectedItem,array_length(valid_ids))
						break;
						case 6:
							optSoulSX=190+150;
							optSoulSY=175;
							if  pressed("right")
								selectedItem=0;
								item_exists_inslot(selectedItem,array_length(valid_ids))
						break;
						case 7:
							optSoulSX=190+150;
							optSoulSY=175+(30);
							if  pressed("right")
								selectedItem=1;
								item_exists_inslot(selectedItem,array_length(valid_ids))
						break;
						case 8:
							optSoulSX=190+150;
							optSoulSY=175+(63);
							if pressed("left")
								selectedItem=2;
						break;
						case 9:
							optSoulSX=190+150;
							optSoulSY=175+(93);
							if  pressed("left")
								selectedItem=3;
						break;
						case 10:
							optSoulSX=190+150;
							optSoulSY=175+(125);
							if  pressed("left")
								selectedItem=4;
						break;
						case 11:
							optSoulSX=190+150;
							optSoulSY=175+(155);
							if  pressed("left")
								selectedItem=5;
						break;
					}
					if(pressed("cancel")){
							selectedInventory=0;
							optAlpha=1;
							optSoulAlpha=1;
					}
				break;
				case 1:
					if(pressed("action")&&cmenuActive==true){
							optSelection=1;
							selectedInventory=1;
							tempState=1;
							optAlpha=0;
							optSoulAlpha=0;
							subState = 3;
					}				
				break;
				case 2:
					if(pressed("action")&&cmenuActive==true){
							optSelection=2;
					}
				break;
			}
			if(pressed("cancel")){
				cmenuState=(0<<0);
				subState--;
		}
		break;
		case 2:
			if(pressed("action"))&&optSelection==0&&cmenuActive==true{
				snd_play(snd_select,8,false,0.6,0,1);
				item_use(global.selecteditem,selectedItem);		
			}
			if(pressed("cancel")){
				subState--;
			}
			global.charselect=targetSelection;
			if  pressed("right")
					targetSelection++;
			if  pressed("left")
				targetSelection--;		
				targetSelection = clamp(targetSelection,0,1);
			if(global.partyhp[0]._curr>global.partyhp[0]._max){
					global.partyhp[0]._curr=global.partyhp[0]._max
			} else  if(global.partyhp[1]._curr>global.partyhp[1]._max){
					global.partyhp[1]._curr=global.partyhp[1]._max
			}
		break;
	break;
	#endregion
	#region ITEM TOSSING
	case 3:
		if(pressed("action"))&&optSelection==1&&cmenuActive==true{
				snd_play(snd_select,8,false,0.6,0,1);
				item_remove_pocketed(selectedItem)
			}
		if(pressed("action"))&&pressed("run")&&cmenuActive==true{
				snd_play(snd_select,8,false,0.6,0,1);
				item_remove_all(selectedItem)
			}
			if(pressed("cancel")){
				subState=2;
				subSelection = -1;
			}
	break;
	#endregion
	#region KEY ITEM USAGE
	case 4:
	break;
	#endregion
	#region EQUIP MENU SELECTION
	case 5:
			if(equipChar < 0){
				if  pressed("right")
					charSelection++
					//snd_play(snd_squeak,8,false);
			if  pressed("left")
					charSelection--			
			}
			
			if(equipChar >= 0){
				if pressed("up")
					slotSelectionEquip--;
					slotSelectionSoulYOffset -= 50;
				if pressed("down")
					slotSelectionEquip++;
					slotSelectionSoulYOffset += 50;
			}
				
			charSelection = clamp(charSelection,0,1)
			slotSelectionEquip = clamp(slotSelectionEquip,0,2);
			
			if(pressed("action")&&cmenuActive==true&&slotSelectionEquip<=0){
					snd_play(snd_select,8,false,0.6,0,1);
					equipChar = charSelection
					slotEquippable = 0;
			}
			
			if(pressed("action")&&cmenuActive==true&&slotEquippable==0&&slotSelectionEquip==0){
					snd_play(snd_select,8,false,0.6,0,1);
					subState = 66; // Equipping a weapon
					slotEquippableType = "wep"
			}
			if(pressed("action")&&cmenuActive==true&&slotEquippable==0&&slotSelectionEquip==1){
					snd_play(snd_select,8,false,0.6,0,1);
					subState = 67; //  Equipping Armor I
					slotEquippableType = "arm"
			}
			if(pressed("action")&&cmenuActive==true&&slotEquippable==0&&slotSelectionEquip==2){
					snd_play(snd_select,8,false,0.6,0,1);
					subState = 68; // Equipping Armor II
					slotEquippableType = "arm"
			}
			
			if(pressed("cancel")&&cmenuActive==true){
				cmenuState = (0<<0);	
				subState = 0;
			}
	break;
	#endregion
	#region VIEWING TASKS
	case 6:
	
	break;
	#endregion
	#region BASIC CONFIG HUB NAVIGATION				
	#region EQUPPING A WEAPON
	case 66:
				if pressed("up")
					slotSelectionEquip--;
					slotSel--;
					slotSelectionSoulYOffset -= 50;
				if pressed("down")
					slotSelectionEquip++;
					slotSel++;
					slotSelectionSoulYOffset += 50;
					
				if pressed("action") 
					weapon_equip(equipChar,201,slotSelectionEquip)
					
				if pressed("cancel") { subState = 5 }
		slotSelectionEquip = clamp(slotSelectionEquip,3,8);
		slotSel = clamp(slotSel,0,5);
	break;
	#endregion
	#region EQUIPPING ARMOR (I)
	case 67:
			if pressed("up")
					slotSelectionEquip--;
					slotSel--;
					slotSelectionSoulYOffset -= 50;
				if pressed("down")
					slotSelectionEquip++;
					slotSel++;
					slotSelectionSoulYOffset += 50;
					
				if pressed("action") 
					armor_equip()
					
				if pressed("cancel") { subState = 5 }
		slotSelectionEquip = clamp(slotSelectionEquip,3,8);
		slotSel = clamp(slotSel,0,5);
	break;
	#endregion
	#region EQUIPPING ARMOR (II)
	case 68:
					if pressed("up")
					slotSelectionEquip--;
					slotSel--;
					slotSelectionSoulYOffset -= 50;
				if pressed("down")
					slotSelectionEquip++;
					slotSel++;
					slotSelectionSoulYOffset += 50;
					
				if pressed("action") 
					armor_equip()
					
				if pressed("cancel") { subState = 5 }
		slotSelectionEquip = clamp(slotSelectionEquip,3,8);
		slotSel = clamp(slotSel,0,5);
	break;
	#endregion
	case 7:
		if  pressed("down")
				configHubSelection++
				//snd_play(snd_squeak,8,false);
		if  pressed("up")
				configHubSelection--	
		configHubSelection = clamp(configHubSelection,0,5);
		#region UPDATE SOUL Y POS ON SELECTION CHANGE
		switch configHubSelection
		{
			#region MANAGE AUDIO CONFIG
			case 0:
				configHubSoulY = 142;
				if(pressed("action")&&cmenuActive==true){
						snd_play(snd_select,8,false,0.6,0,1);
						//with(inst_1419C094){visible=true};
						cmenuState=(3<<1);
						cmenuActive=true;
						_master = instance_create_depth(420,152,-601,obj_slider_volume)
						with(_master){ type = "master" };
						
						_music = instance_create_depth(420,192,-601,obj_slider_volume)
						with(_music){ type = "music" };
						
						_sfx = instance_create_depth(420,232,-601,obj_slider_volume)
						with(_sfx){ type = "sfx" };
						
						_voice = instance_create_depth(420,272,-601,obj_slider_volume)
						with(_voice){ type = "voice" };
						
							
				}
			break;
			#endregion
			#region REBIND CONTROLS
			case 1:
				configHubSoulY = 178;
				if(pressed("action")&&cmenuActive==true){
					snd_play(snd_select,8,false,0.6,0,1);
					subState = 8;
					subSelection = 10;
					cmenuState=(3<<2);
					cmenuActive=true;
				}
			break;
			#endregion
			#region TWEAK GAMEPLAY SETTINGS
			case 2:
				configHubSoulY = 212;
					if(pressed("action")&&cmenuActive==true){
						snd_play(snd_select,8,false,0.6,0,1);
						subState = 9;
						subSelection = 0
						cmenuState=(3<<3);
						cmenuActive=true;
				}
			break;
			#endregion
			#region MANAGE EXTRAS
			case 3:
				configHubSoulY = 247;
					if(pressed("action")&&cmenuActive==true){
						snd_play(snd_select,8,false,0.6,0,1);
						subState = 9;
						subSelection = 0
						cmenuState=(3<<4);
						cmenuActive=true;	
					}
			break;
			#endregion
			case 4:
				configHubSoulY = 282;
				if(enable){
					PLAYER.active=false;
					PLAYER.image_speed = 0;
					if(pressed("action")&&cmenuActive==true){
						snd_play(snd_select,8,false,0.6,0,1);
						// does nothing rn, just plays a sound, but eventually this would take you to the title screen
						cmenuActive=true;
				}
				}
			break;
			case 5:
				configHubSoulY = 318
							if(enable){
					if(pressed("action")&&cmenuActive==true){
						snd_play(snd_select,8,false,0.6,0,1);
						subState=0;
						cmenuState=(0<<0);
						cmenuActive=true;
					}
				}
			break;
		}
}

#region Inputs
var _up = pressed("up")
var _up_held = check("up")
var _down = pressed("down")
var _down_held = check("down")
var _left = pressed("left")
var _left_held = pressed("left")
var _right = pressed("right")
var _right_held = pressed("right")
#endregion
#region CONFIG MENU
#region CONTROLS
if cmenuState == (3<<2){
		subSelection += pressed("up")
		subSelection -= pressed("down")
		subSelection += opposing_repeat("up","down")
		subSelection = ((subSelection + 12) % 12)
		if(!input_binding_scan_in_progress())
		{
		if(pressed("action")){			
				// Start the rebinding process once the current selection is determined
				switch(subSelection)
				{
				case 0: rebinding_verb = "up";  break;
                case 1: rebinding_verb = "down";  break;
                case 2: rebinding_verb = "left";     break;
                case 3: rebinding_verb = "right";   break;               
				case 4: rebinding_verb = "run";   break;
				case 5: rebinding_verb = "action";   break;				
				case 6: rebinding_verb = "cancel";   break;
				case 7: rebinding_verb = "menu";   break;
				case 8: rebinding_verb = "swap1";   break;
				case 9: rebinding_verb = "swap2";   break;			
				case 10: 
				   input_profile_reset_bindings("gamepad")
				   input_profile_reset_bindings("keyboard_and_mouse")
				break;
				case 11:
				  	rebinding_verb = undefined;
					cmenuState = (3 << 0 );
					subState = 7;
				break;
				}
				
				show_debug_message(string(subSelection))
				
				// Start binding
				if rebinding_verb != undefined && subSelection < 11 {
				input_binding_scan_start(function(_binding)
				{
					input_binding_set(rebinding_verb,_binding);
					rebinding_verb = "";
					return;
				});
				}
		}
	} else {
		// do nothing
	}
}
#endregion
#region GAMEPLAY
if cmenuState == (3<<3){
	#region ADJUST RESOLUTION
	if subSelection == 0  {
	var can_inc_res_sel = true;
	if can_inc_res_sel == true{
	if _right {
		res_sel = number_add(res_sel,21,1);
		can_inc_res_sel = false;
		if res_sel > res_length-1 { res_sel = 0};
		else if res_sel<0 {res_sel = res_length-1;}
		if global.camasp == 0 {
		global.resolution_current = global.resolutions[res_sel];
		} else {
		global.resolution_current = global.resolutions2[res_sel];
		}
		window_set_size(global.resolution_current.w,global.resolution_current.h)
	}
	}
	if can_inc_res_sel == true{
	if _left {
		res_sel = number_sub(res_sel,0,1)
				can_inc_res_sel = false;
		if res_sel > res_length-1 { res_sel = 0};
		else if res_sel<0 {res_sel = res_length-1;}
		if global.camasp == 0 {
		global.resolution_current = global.resolutions[res_sel];
		} else {
		global.resolution_current = global.resolutions2[res_sel];
		}
		window_set_size(global.resolution_current.w,global.resolution_current.h)	
	}
	}
	}
	#endregion
	#region ADJUST WINDOW MODE 
	if subSelection == 1 {
	var window_sel = global.windowmode;
	if window_sel == 0 { window_set_showborder(false)  win_label = "Borderless" } 
	if window_sel == 1 { window_set_fullscreen(false) window_set_showborder(true) win_label = "Windowed" }
	if window_sel == 2 { window_set_fullscreen(true) win_label = "Fullscreen"}
	
	if  pressed("right")
		global.windowmode++
	if  pressed("left")
		global.windowmode--	
	}
	
	global.windowmode =  clamp(global.windowmode,0,2);
	#endregion
	#region ADJUST CAMERA STYLE
	if subSelection == 2 {
		if  pressed("right")
				global.camasp++
			if  pressed("left")
				global.camasp--	
				
			if (global.camasp == 1){cam_label = "16:9"  res_length = array_length(global.resolutions2) global.window_res_h = 720 global.window_res_w = 1280 };
			if (global.camasp == 0){cam_label = "4:3" res_length = array_length(global.resolutions) global.window_res_h = 960 global.window_res_w = 1280 };
		global.camasp = clamp(global.camasp,0,1);
	}
	#endregion
	#region TOGGLE LOWVFX
	if subSelection == 3 {
		// THIS DOES NOTHING RIGHT NOW- LEAVE AS IS UNTIL LATER
		if  pressed("right")
				global.lowvfx = true
				vfx_label = "On";
			if  pressed("left")
				global.lowvfx = false;
				vfx_label = "Off";
				
			if global.lowvfx == true { vfx_label = "On"; } else { vfx_label = "Off";}
	}
	#endregion
	if subSelection == 5 && pressed("action"){
		subSelection = 0;
		subState=7;
		cmenuState = (3<<0);
	}
	if _down { subSelection++}
	if _up {subSelection--}
}
#endregion
#region EXTRAS
if cmenuState == (3<<4){
	if subSelection == 4 && pressed("action"){
		subSelection = 0;
		subState=7;
		cmenuState = (3<<0);
	}
	if _down { subSelection++}
	if _up {subSelection--}
}

#endregion
#endregion
#endregion
	
}