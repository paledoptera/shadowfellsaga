function scr_debugger(){
	if keyboard_check(ord("R")) {game_restart();}
	if keyboard_check(ord("L")) { if(!instance_exists(obj_loadmenu)) instance_create(0,0,obj_loadmenu);}
	if keyboard_check(vk_f3) { room_restart(); }
	if keyboard_check(vk_f5) { screen_save("capture_sfsaga.png");}
	if keyboard_check(vk_pageup) and room != room_last {room_goto_next();}
	if keyboard_check(vk_pagedown) and room != room_first {room_goto_previous();}
	if keyboard_check(vk_shift)
	{
		if instance_exists(PLAYER)
		{
			if mouse_check_button(mb_left)
			{
				with(PLAYER){
					execute_tween(PLAYER,"x",mouse_x,"easeInOut",0.1);
					execute_tween(PLAYER,"y",mouse_y,"easeInOut",0.1);
				}
				with(PLAYER){
					active=false;
				}
			} else {
				with(PLAYER){
					active=true;
				}
			}
		}
	//with(other){
	//	if(mouse_over()&&mouse_check_button_pressed(mb_right)){
	//			instance_create(other.x,other.y,obj_explosion);
	//			with(obj_explosion){ 
	//					target_inst=other;	
	//			}
	//	}
	}

}