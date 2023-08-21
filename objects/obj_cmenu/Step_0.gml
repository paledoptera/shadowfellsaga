if  input_key_pressed(global.key_right) ||input_gp_button_pressed(global.gp_device,global.gp_right) && subState==1
	snd_play(snd_squeak,8,false);
if  input_key_pressed(global.key_left) ||input_gp_button_pressed(global.gp_device,global.gp_left) && subState==1
	snd_play(snd_squeak,8,false);
	
if(_menu_opt_alpha==0&&_menu_stat_alpha==0&&subState==0)
	instance_destroy();
switch(subState){
	case -1:
		if(!enable){
		event_user(0);
		}
	break;
	case 0:
		if(enable){
		cmenuActive=true;
		}
		if(input_key_pressed(global.key_cancel)){
			event_user(2);	
		}
		switch(selection){
			case 0: 
				if(enable){
					if(input_key_pressed(global.key_action)&&cmenuActive==true){
						snd_play(snd_select,8,false,0.6,0,1);
						subState=1;
						cmenuState=(1<<0);
						cmenuActive=true;
					}
				}
			break;
		}
	break;
	case 1:
			if(selectedInventory<1){
				if  input_key_pressed(global.key_right)||input_gp_button_pressed(global.gp_device,global.gp_right)
					subSelection++;
				if  input_key_pressed(global.key_left)||input_gp_button_pressed(global.gp_device,global.gp_left)
					subSelection--;		
			} 
			subSelection=clamp(subSelection,0,2);
			optSelection=clamp(optSelection,0,2);
			switch(subSelection){
				case 0:
					if(input_key_pressed(global.key_action)&&cmenuActive==true){
							optSelection=0;
							selectedInventory=1;
							optAlpha=0;
							optSoulAlpha=0;
					}
					if  input_key_pressed(global.key_down)||input_gp_button_pressed(global.gp_device,global.gp_down)
							if(selectedItem<5){
								selectedItem++;
								item_exists_inslot(selectedItem,1)
							} else if(selectedItem<12){
									selectedItem++;
									item_exists_inslot(selectedItem,1)
							}
					if  input_key_pressed(global.key_up)||input_gp_button_pressed(global.gp_device,global.gp_up)
							if(selectedItem<5){
								selectedItem--;
								item_exists_inslot(selectedItem,1)
							} else if(selectedItem<12){
								selectedItem--;
								item_exists_inslot(selectedItem,1)
							}
					selectedItem=clamp(selectedItem,0,11);
					switch(selectedItem){
						case 0:
							optSoulSX=90;
							optSoulSY=175;
							if  input_key_pressed(global.key_right)||input_gp_button_pressed(global.gp_device,global.gp_right)
								selectedItem=6;
								item_exists_inslot(selectedItem,1)
								if(selectedInventory==1){
									if(input_key_pressed(global.key_action))&&cmenuActive==true{
										subState=2;
									}
								}
						break;
						case 1:
							optSoulSX=90;
							optSoulSY=175+(30);
							if  input_key_pressed(global.key_right)||input_gp_button_pressed(global.gp_device,global.gp_right)
								selectedItem=7;
								item_exists_inslot(selectedItem,1)
						break;
						case 2:
							optSoulSX=90;
							optSoulSY=175+(63);
							if  input_key_pressed(global.key_right)||input_gp_button_pressed(global.gp_device,global.gp_right)
								selectedItem=8;
								item_exists_inslot(selectedItem,1)
						break;
						case 3:
							optSoulSX=90;
							optSoulSY=175+(93);
							if  input_key_pressed(global.key_right)||input_gp_button_pressed(global.gp_device,global.gp_right)
								selectedItem=9;
								item_exists_inslot(selectedItem,1)
						break;
						case 4:
							optSoulSX=90;
							optSoulSY=175+(125);
							if  input_key_pressed(global.key_right)||input_gp_button_pressed(global.gp_device,global.gp_right)
								selectedItem=10;
								item_exists_inslot(selectedItem,1)
						break;
						case 5:
							optSoulSX=90;
							optSoulSY=175+(155);
							if  input_key_pressed(global.key_right)||input_gp_button_pressed(global.gp_device,global.gp_right)
								selectedItem=11;
								item_exists_inslot(selectedItem,1)
						break;
						case 6:
							optSoulSX=190+150;
							optSoulSY=175;
							if  input_key_pressed(global.key_left)||input_gp_button_pressed(global.gp_device,global.gp_left)
								selectedItem=0;
								item_exists_inslot(selectedItem,1)
						break;
						case 7:
							optSoulSX=190+150;
							optSoulSY=175+(30);
							if  input_key_pressed(global.key_left)||input_gp_button_pressed(global.gp_device,global.gp_left)
								selectedItem=1;
								item_exists_inslot(selectedItem,1)
						break;
						case 8:
							optSoulSX=190+150;
							optSoulSY=175+(63);
							if  input_key_pressed(global.key_left)||input_gp_button_pressed(global.gp_device,global.gp_left)
								selectedItem=2;
						break;
						case 9:
							optSoulSX=190+150;
							optSoulSY=175+(93);
							if  input_key_pressed(global.key_left)||input_gp_button_pressed(global.gp_device,global.gp_left)
								selectedItem=3;
						break;
						case 10:
							optSoulSX=190+150;
							optSoulSY=175+(125);
							if  input_key_pressed(global.key_left)||input_gp_button_pressed(global.gp_device,global.gp_left)
								selectedItem=4;
						break;
						case 11:
							optSoulSX=190+150;
							optSoulSY=175+(155);
							if  input_key_pressed(global.key_left)||input_gp_button_pressed(global.gp_device,global.gp_left)
								selectedItem=5;
						break;
					}
					if(input_key_pressed(global.key_cancel)){
							selectedInventory=0;
							optAlpha=1;
							optSoulAlpha=1;
					}
				break;
				case 1:
					if(input_key_pressed(global.key_action)&&cmenuActive==true){
							optSelection=1;
							selectedInventory=1;
							tempState=1;
					}				
				break;
				case 2:
					if(input_key_pressed(global.key_action)&&cmenuActive==true){
							optSelection=2;
					}
				break;
			}
			if(input_key_pressed(global.key_cancel)){
				cmenuState=(0<<0);
				subState--;
		}
		break;
		case 2:
			if(input_key_pressed(global.key_action))&&cmenuActive==true{
				snd_play(snd_select,8,false,0.6,0,1);
				item_use(global.selecteditem,0);		
			}
			if(input_key_pressed(global.key_cancel)){
				subState--;
			}
			global.charselect=targetSelection;
			if  input_key_pressed(global.key_right)||input_gp_button_pressed(global.gp_device,global.gp_right)
					targetSelection++;
			if  input_key_pressed(global.key_left)||input_gp_button_pressed(global.gp_device,global.gp_left)
				targetSelection--;		
				targetSelection = clamp(targetSelection,0,1);
			if(global.partyhp[0]._curr>global.partyhp[0]._max){
					global.partyhp[0]._curr=global.partyhp[0]._max
			} else  if(global.partyhp[1]._curr>global.partyhp[1]._max){
					global.partyhp[1]._curr=global.partyhp[1]._max
			}
		break;
	break;
}
show_debug_message(string(global.itempocketed[0]))