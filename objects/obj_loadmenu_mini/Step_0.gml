if instance_exists(PLAYER) {PLAYER.image_speed = 0;  PLAYER.active = false;}
if instance_exists(FOLLOWER) {FOLLOWER.image_speed = 0}

if input_key_pressed(global.key_down)||input_gp_button_pressed(global.gp_device,global.gp_down) && subState==0
	snd_play(snd_squeak,8,false);
if  input_key_pressed(global.key_up) ||input_gp_button_pressed(global.gp_device,global.gp_up) && subState==0
	snd_play(snd_squeak,8,false);
if  input_key_pressed(global.key_right) ||input_gp_button_pressed(global.gp_device,global.gp_right) && subState==1
	snd_play(snd_squeak,8,false);
if  input_key_pressed(global.key_left) ||input_gp_button_pressed(global.gp_device,global.gp_left) && subState==1
	snd_play(snd_squeak,8,false);
if  input_key_pressed(global.key_action) ||input_gp_button_pressed(global.gp_device,global.gp_action) && subState==0{
	snd_play(snd_select,8,false)
}
if  input_key_pressed(global.key_cancel) ||input_gp_button_pressed(global.gp_device,global.gp_cancel) && subState==1 && saved==1 {
	instance_destroy();	
}
switch(subState)
{
	case -1:
		if(!_fade_out_ready)
			event_user(0);
	break;
	case 0:
		if!(_overwrite){
			if  input_key_pressed(global.key_down) ||input_gp_button_pressed(global.gp_device,global.gp_down)
				selection++
			if  input_key_pressed(global.key_up) ||input_gp_button_pressed(global.gp_device,global.gp_up)
				selection--
			selection = clamp(selection, 0,2);
			global.filechoice=selection;
		 if( input_key_pressed(global.key_cancel)||input_gp_button_pressed(global.gp_device,global.gp_cancel)){
				_alpha=0;
			 	instance_destroy();
			}
			if( input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action)&& buffer<0){
				if(selection<3){
					_state=STATE_MENU_SAVE.FILE_CHOSEN;	
					if(_state==STATE_MENU_SAVE.FILE_CHOSEN)
					{
						subState=1;
					}
				} 
			}
		}
	break
	case 1:
		if(!_overwrite){
			if  input_key_pressed(global.key_right)||input_gp_button_pressed(global.gp_device,global.gp_right)
				subSelection++;
				choicemade=true;
			if  input_key_pressed(global.key_left)||input_gp_button_pressed(global.gp_device,global.gp_left)
				subSelection--;		
				choicemade=true;
			subSelection=clamp(subSelection,0,1);
			switch(subSelection){
				case 0:
						if  input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action) && subState == 1 && subSelection==0{
						snd_play(snd_save,8,false);	
						if file_exists("file"+string(selection)){
							loadgame(selection);	
							load_general()
							global.loaded=true;
							room_goto(global.currentroom);
						} else {
							// do nothing
							// what? did you want an illegal buffer exception or something?
						}
					}
				break;
				case 1:
						 if input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action) && subState == 1 && subSelection==1{
							snd_play(snd_select,8,false);	
							subState=0;
						}
				break;
			}
		}
		case 2:
			if(input_key_pressed(global.key_cancel)||input_gp_button_pressed(global.gp_device,global.gp_cancel) && subState==2){
				instance_destroy();	
			}
		break;
}
