if keyboard_check(ord("R")) {game_restart();}
if keyboard_check(ord("L")) { if(!instance_exists(obj_loadmenu)) instance_create(0,0,obj_loadmenu);}
if keyboard_check(vk_f3) { room_restart(); }
if keyboard_check(vk_f5) { screen_save("screenshot_shadowfellsaga");}
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
}
