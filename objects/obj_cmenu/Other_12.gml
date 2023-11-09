/// @desc Slide out
execute_tween(id,"_menu_opt_start_y",-65,"easeInOut",0.6)
execute_tween(id,"_menu_opttxt_start_y",-100,"easeInOut",0.6)
execute_tween(id,"_menu_opticon0_start_y",-100,"easeInOut",0.6)
execute_tween(id,"_menu_opt_alpha",0,"easeInOut",0.5)

execute_tween(id,"_menu_stat_start_y",700,"easeInOut",0.6)
execute_tween(id,"_menu_stat_papicon_start_y",700,"easeInOut",0.6)
execute_tween(id,"_menu_stat_papname_start_y",700,"easeInOut",0.6)
execute_tween(id,"_menu_stat_hplabel_start_y",700,"easeInOut",0.6)
execute_tween(id,"_menu_stat_hpbox_start_y",700,"easeInOut",0.6)
execute_tween(id,"_menu_stat_hptxt_start_y",700,"easeInOut",0.6)
execute_tween(id,"_menu_stat_paphpl_start_y",700,"easeInOut",0.6)
execute_tween(id,"_menu_stat_sansicon_start_y",700,"easeInOut",0.6)
execute_tween(id,"_menu_stat_alpha",0,"easeInOut",0.5)

if instance_exists(PLAYER) {PLAYER.image_speed = 1;  PLAYER.active = true;}
if instance_exists(FOLLOWER) {FOLLOWER.image_speed = 1;} 

disable=true;
enable=false;
cmenuActive = false;

instance_destroy()
global.canusemenu = true