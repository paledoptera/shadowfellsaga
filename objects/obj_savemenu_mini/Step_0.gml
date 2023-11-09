if instance_exists(PLAYER) {PLAYER.image_speed = 0;  PLAYER.active = false;}
if instance_exists(FOLLOWER) {FOLLOWER.image_speed = 0}

switch(subState)
{
	#region FADE MENU IN
	case -1:
		if(!_fade_out_ready)
			event_user(0);
	break;
	#endregion
	#region BASIC SELECTION
	case 0:
		if!(_overwrite){
			if  input_key_pressed(global.key_down) ||input_gp_button_pressed(global.gp_device,global.gp_down)
				selection++
				//snd_play(snd_squeak,8,false);
			if  input_key_pressed(global.key_up) ||input_gp_button_pressed(global.gp_device,global.gp_up) 
				selection--
			//	snd_play(snd_squeak,8,false);
			selection = clamp(selection, 0,3);
			if selection == 3 
			{
				if  input_key_pressed(global.key_right)||input_gp_button_pressed(global.gp_device,global.gp_right)
					subSelection++;
			//		snd_play(snd_squeak,8,false);
					choicemade=true;
				if  input_key_pressed(global.key_left)||input_gp_button_pressed(global.gp_device,global.gp_left)
					subSelection--;		
			//		snd_play(snd_squeak,8,false);
					choicemade=true;
				subSelection=clamp(subSelection,0,2);
			}
			global.filechoice=selection;
		 if(input_key_pressed(global.key_cancel)||input_gp_button_pressed(global.gp_device,global.gp_cancel)) && subState < 1{
				_alpha=0;
			 	instance_destroy();
			} 
			if( input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action)&& buffer<0){
				if(selection==3 && subSelection == 1){
					subState = 1;	
				}
				if(selection==3 && subSelection == 2){
					subState = 10;	
				}
				if(selection==3 && subSelection == 0){
					subState = 7;
				}
				snd_play(snd_select,8,false);
				if(selection<3){
					subSelection = 0;
					_state=STATE_MENU_SAVE.FILE_CHOSEN;	
					if(_state==STATE_MENU_SAVE.FILE_CHOSEN)
					{
						subState=5;
					}
				} 
			}
		}
	break
	#endregion
	#region ERASE SAVED DATA
	case 1:
			if  input_key_pressed(global.key_down) ||input_gp_button_pressed(global.gp_device,global.gp_down)
				selection++
				//snd_play(snd_squeak,8,false);
			if  input_key_pressed(global.key_up) ||input_gp_button_pressed(global.gp_device,global.gp_up) 
				selection--
			//	snd_play(snd_squeak,8,false);
			if(input_key_pressed(global.key_cancel)||input_gp_button_pressed(global.gp_device,global.gp_cancel)) && subState == 1{
				subState = 0;
				menulabel="Please select a file.";
			} 	
			selection = clamp(selection, 0,2);
			if  input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action) && subState == 1 && subSelection==0{
						snd_play(snd_save,8,false);	
						if file_exists("file"+string(selection)){
							file_delete("file"+string(selection));
							subState = 4;
						} else {
							snd_play(snd_txt,8,false);	
						}
		} 
	break;
	#endregion
	#region RETURN TO BASIC SELECTION POST-ERASE
	case 2: 
			if  input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action) && subState == 3 && subSelection==1{
				subState = 0;
				snd_play(snd_select,8,false);
			} 
	break;
	case 4:
			if  input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action) && subState == 3 && subSelection==1{
				subState = 0;
				color = c_white;
				snd_play(snd_select,8,false);
				menulabel="Please select a file.";
			} 
		 if(input_key_pressed(global.key_cancel)||input_gp_button_pressed(global.gp_device,global.gp_cancel)) && subState < 1{
				_alpha=0;
			 	instance_destroy();
			} 
	break;
	#endregion
	#region CREATE SAVED DATA (NOT COPY!)
	case 5:
		subSelection=clamp(subSelection,0,1);
		if  input_key_pressed(global.key_right)||input_gp_button_pressed(global.gp_device,global.gp_right)
				subSelection++;
				//snd_play(snd_squeak,8,false);
				choicemade=true;
		if  input_key_pressed(global.key_left)||input_gp_button_pressed(global.gp_device,global.gp_left)
				subSelection--;		
			//	snd_play(snd_squeak,8,false);
				choicemade=true;
		if subSelection != 1 {
			if  input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action) && subState == 5 && subSelection==0{
							snd_play(snd_save,8,false);	
							saved=1;
							if(saved==1){
								subState=6;
								party_get_room_name(global.currentroom)
								global.lcurrentarea=string(global.currentarea);
								savegame(global.filechoice);	
							}	
			}
		}
		if subSelection != 0 {
			if  input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action) && subState == 5 && subSelection==1{
					subState = 0;
					snd_play(snd_select,8,false);
			}
		}
	break;
	#endregion
	#region RETURN TO BASIC SELECTION POST-SAVE
	case 6: 
		if  input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action) && subState == 6 && subSelection==1{
					subState = 0;
					saved = 0;
					color = c_white;
					snd_play(snd_select,8,false);
		}
	break;
	#endregion
	#region SELECT FILE TO COPY
	case 7:
			if  input_key_pressed(global.key_down) ||input_gp_button_pressed(global.gp_device,global.gp_down)
				selection++
			//	snd_play(snd_squeak,8,false);
			if  input_key_pressed(global.key_up) ||input_gp_button_pressed(global.gp_device,global.gp_up) 
				selection--
			//	snd_play(snd_squeak,8,false);
			selection = clamp(selection, 0,2);
			if file_exists("file"+string(selection)){
				if  input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action) && subState == 7 && subSelection==0{
								snd_play(snd_select,8,false);	
								saved=1;
								if(saved==1){
									subState=8;
								}	
				}
			}
			if(input_key_pressed(global.key_cancel)||input_gp_button_pressed(global.gp_device,global.gp_cancel)) && subState == 7{
				subState = 0;
				menulabel="Please select a file.";
			} 	
	break;
	#endregion
	#region SELECT SLOT TO COPY FILE FROM
	case 8:
				var sel = 0;
				if selection == 0 { sel = 0 } if selection == 1 {sel = 1 } if selection == 2 {sel = 2 };
				if  input_key_pressed(global.key_right)||input_gp_button_pressed(global.gp_device,global.gp_right)
					subSelection++;
				//	snd_play(snd_squeak,8,false);
					choicemade=true;
				if  input_key_pressed(global.key_left)||input_gp_button_pressed(global.gp_device,global.gp_left)
					subSelection--;					
			//		snd_play(snd_squeak,8,false);	
					choicemade=true;
				subSelection = clamp(subSelection,0,1);
				switch(subSelection){
					case 0:
						if(input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action)){
							subState = 9;
							snd_play(snd_select,8,false);
							copySelection = sel;
							copyBaseValue = selection;
							selection=0;
							menulabel="Please select a file.";
						} 	
					break;
					case 1:
						if(input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action)){
							subState = 0;
							snd_play(snd_select,8,false);
							menulabel="Please select a file.";
						} 	
					break;
				}
	break;
	#endregion
	#region SELECT SLOT TO COPY FILE TO
	case 9:			
			if  input_key_pressed(global.key_down) ||input_gp_button_pressed(global.gp_device,global.gp_down)
				copySelection++
//				snd_play(snd_squeak,8,false);
			if  input_key_pressed(global.key_up) ||input_gp_button_pressed(global.gp_device,global.gp_up) 
				copySelection--
	//			snd_play(snd_squeak,8,false);
			copySelection = clamp(copySelection, 0,1);
			if(input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action)){
				snd_play(snd_save,8,false);
				file_copy("file"+string(copyBaseValue),"file"+string(copySelection))
				copy_general(copyBaseValue, copySelection);
				subState = 0;
			} 	
			if(input_key_pressed(global.key_cancel)||input_gp_button_pressed(global.gp_device,global.gp_cancel)) && subState == 1{
				subState = 7;
			} 	
	break;
	#endregion
	#region BASIC QUIT OPTIONS
	case 10:
		_alpha = 0;
		if  input_key_pressed(global.key_down)||input_gp_button_pressed(global.gp_device,global.gp_down)
					subSelection++;				
		//			snd_play(snd_squeak,8,false);
					choicemade=true;
		if  input_key_pressed(global.key_up)||input_gp_button_pressed(global.gp_device,global.gp_up)
					subSelection--;		
	//				snd_play(snd_squeak,8,false);
					choicemade=true;
		subSelection=clamp(subSelection,0,1);
		if(input_key_pressed(global.key_cancel)||input_gp_button_pressed(global.gp_device,global.gp_cancel)) && subState < 1{
			_alpha=0;
			 instance_destroy();
		} 
		if(input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action)){
			snd_play(snd_select,8,false);	
			switch(subSelection){
				case 0:
						ef_fader_generic.color=c_black;
						fader_fade(-1,1,0);
						room_goto(STAGE_TITLE)
				break;
				case 1:
					game_end();
				break;
			}
		}
	break;
	#endregion
}