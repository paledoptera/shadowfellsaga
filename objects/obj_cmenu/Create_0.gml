depth=DEPTH_UI
selection=0;
cmenuActive=false;
disable=true;
enable=false;
cmenuState= (0 << 0);
cellAvailable=true;
selectedItem=0;
selectedInventory=0;
res_length = array_length(global.resolutions);
storedText=-4;
subState=-1;
subSelection=0;
optSelection=-1;
targetSelection=-1;
charSelection=-1;
configHubSelection=-1;
configHubSoulY=142;
tempState=0;
targetOverride=false; // overrides the target selection, best used for items that affect everyone
optSoulAlpha=1;
optAlpha=1;
optSoulSY=0;
optSoulSX=0;
itemPocketed=-1;

hpdmg=c_red;
hpcolor[0]=make_color_rgb(223,113,38)
hpcolor[1]=make_color_rgb(122,201,255)
invopt_col[0]=c_white;
invopt_col[1]=make_color_rgb(223,113,38)
invopt_col[2]=c_gray;
invopt[0]="USE";
invopt[1]="TOSS";
invopt[2]="KEY";

_slide_in_tween_executed_once=false;

_opt_index=0;

_menu_opt_start_y=-65; // Black BG
_menu_opttxt_start_y=-100;
_menu_opticon0_start_y=-100;
_menu_opt_dest_y=55;
_menu_opt_alpha=0;

_menu_stat_start_y=700;
_menu_stat_papicon_start_y=700;
_menu_stat_papname_start_y=700;
_menu_stat_hplabel_start_y=700;
_menu_stat_hptxt_start_y=700;
_menu_stat_hpbox_start_y=700;
_menu_stat_paphpl_start_y=700;
_menu_stat_sansicon_start_y=700;
_menu_stat_start_y=700;
_menu_stat_dest_y=438;
_menu_stat_alpha=0;
_cmenu_tween_executed_once=false;
_cmenu_fade_out_ready=false;

rebinding_verb = undefined;
pause = false;
is_rebinding = false;

res_sel = global.resolution_index;	
win_label = "Windowed";
cam_label = "Smooth";
vfx_label = "Off";
// DO NOT UNCOMMENT THESE LINES
// These are commented out variables for later use once the rest of the buttons
// Are implemented
//_equipbt_index=0;
//_taskbt_index=0;
//_configbt_index;