if(instance_count>1){
	instance_destroy(instance_number);	
}
depth=DEPTH_UI
global.currentroom=room;
global.currentarea=flag_get(global.pflags,"area")
tempname=str_set_loc("[EMPTY]","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_0_0")
menulabel="Please select a file.";
temparea="------------"
temptime="--:--"  
choice[0]=str_set_loc("Yes","DEVICE_MENU_CHOICE_REVISED_Draw_64_slash_2_0")
choice[1]=str_set_loc("No","DEVICE_MENU_CHOICE_REVISED_Draw_64_slash_3_0")

extra[0]=str_set_loc("Copy","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_4_0")
extra[1]=str_set_loc("Delete","DEVICE_SAVE_MENU_REVISED_Draw_64_slash_5_0")
extra[2]=str_set_loc("Return","DEVICE_MENU_CHOICE_REVISED_Draw_64_slash_6_0")
index=spr_heartsmall;

style=-1;
#region Are we in light world or dark world?
if(flag_get(global.flags,"world")==0){
	style=0;
} else if(flag_get(global.flags,"world")==1){
	style=1;	
}
#endregion
subState=-1;
selection=0;
copySelection=-1;
copyBaseValue=-1;
saved=0;
erased=0;
copied=0;
subSelection=-1;
choicemade=false;
global.filechoice=selection;
XL = 550
YL = 100
YS = 20
SS=3;  // menu soul scale
col_main = c_white
col_choice[1]=subSelection == 1 ? c_yellow : c_white;
time=0;
minute=0;
seconds=0;
color=c_white;

_tween_executed_once=false;
_fade_out_ready=false;
_overwrite=false;
_alpha=0;
_bg_alpha=0;
_menu_soul_xpos=270;
_menu_soul_ypos=132;
_menu_soul_xposh=60;
_menu_soul_yposh=110;

menu_soul_dest_x=0;  // Tween destination for X
menu_soul_dest_y=0;  // Tween destination for Y
menu_soul_dest_scale=2; // Tween destination for Image X and Y scale
canscale=false;
x_shift_allowed=false;

buffer=-1; // Save buffer
