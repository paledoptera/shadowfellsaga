/// @desc Tween Menu Soul Position
execute_tween(id, "_menu_soul_xpos",menu_soul_dest_x,"linear",0.125)
execute_tween(id, "_menu_soul_ypos",menu_soul_dest_y,"linear",0.125)
if(x_shift_allowed==true){
execute_tween(id, "_menu_soul_xpos",_menu_soul_xposh,"linear",0.125)
execute_tween(id, "_menu_soul_ypos",_menu_soul_yposh,"linear",0.125)
}
if(canscale==true){
	execute_tween(id,"SS",menu_soul_dest_scale,"linear",0.125)
} else {
	execute_tween(id,"SS",3,"linear",0.125)
}