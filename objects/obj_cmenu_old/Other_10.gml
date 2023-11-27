///@desc Slide in
execute_tween(id,"_menu_opt_start_y",_menu_opt_dest_y,"easeInOut",0.6)
execute_tween(id,"_menu_opttxt_start_y",30,"easeInOut",0.6)
execute_tween(id,"_menu_opticon0_start_y",24,"easeInOut",0.6)
execute_tween(id,"_menu_opt_alpha",1,"easeInOut",1)

execute_tween(id,"_menu_stat_start_y",_menu_stat_dest_y,"easeInOut",0.6)
execute_tween(id,"_menu_stat_papicon_start_y",415,"easeInOut",0.6)
execute_tween(id,"_menu_stat_papname_start_y",418,"easeInOut",0.6)
execute_tween(id,"_menu_stat_hplabel_start_y",430,"easeInOut",0.6)
execute_tween(id,"_menu_stat_hpbox_start_y",436,"easeInOut",0.6)
execute_tween(id,"_menu_stat_hptxt_start_y",410,"easeInOut",0.6)
execute_tween(id,"_menu_stat_paphpl_start_y",410,"easeInOut",0.6)
execute_tween(id,"_menu_stat_sansicon_start_y",413,"easeInOut",0.6)
execute_tween(id,"_menu_stat_alpha",1,"easeInOut",0.5)
subState=0;
if instance_exists(PLAYER) {PLAYER.image_speed = 0;  PLAYER.active = false;}
if instance_exists(FOLLOWER) {FOLLOWER.image_speed = 0} 
enable=true;