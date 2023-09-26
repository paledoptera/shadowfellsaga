if(live_call()) return live_result;
if(!obj_gamehandler.borderEnabled){
	display_set_gui_size(global.gui_res_w,global.gui_res_h);
}
//draw_sprite_ext(spr_battlesect,  0 , 641/2, 445,2.22,1.5,0,c_white,1);
//draw_sprite_ext(spr_cemnubox,  0 , 641/2, 438,2.23,1.5,0,c_white,1);

#region DRAW BROS HP BAR AND TEXT
switch(selectedBattleChar){
	#region Papyrus
	case 0:
	if(selectedBattleChar!=1){
	draw_sprite_ext(spr_mlbattlecharsel,0,0,400,1,1,0,c_white,1)
	}
	draw_sprite_ext(spr_mlbattlecharinfo,1,136,400,1,1,0,c_white,1)
	draw_sprite_ext(spr_pixel,0,x+40,y+459,global.partyhp[0]._max*1.25/2,10,0,c_maroon,1);
	draw_sprite_ext(spr_pixel,0,x+40,y+459,global.partyhp[0]._curr*1.25/2,10,0,make_color_rgb(223,113,38),1);
	
	draw_sprite_ext(spr_pixel,0,x+175,y+459,global.partyhp[1]._max*10,10,0,c_maroon,1);
	draw_sprite_ext(spr_pixel,0,x+175,y+459,global.partyhp[1]._curr*10,10,0,make_color_rgb(122,201,255),1);
	
	#region DRAW CURRENT PAPS HP
	var STR=string(global.partyhp[0]._curr);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext);
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+65,445,1,1,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	#endregion
	
	#region DRAW MAX PAPS HP
	var STR=string(global.partyhp[0]._max);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext);
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+105,445,1,1,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	#endregion
	
	#region DRAW CURRENT SANS HP
	var STR=string(global.partyhp[1]._curr);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext);
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+200,446,1,1,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	#endregion
	
	#region DRAW MAX SANS HP
	var STR=string(global.partyhp[1]._max);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext);
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+230,446,1,1,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	#endregion
	break;
	#endregion
	#region Sans
	case 1:
	draw_sprite_ext(spr_mlbattlecharsel,0,0,400,1,1,0,c_white,1)
	draw_sprite_ext(spr_mlbattlecharsel,1,136,400,1,1,0,c_white,1)
	draw_sprite_ext(spr_mlbattlecharinfo,0,0,400,1,1,0,c_white,1)
	draw_sprite_ext(spr_pixel,0,x+40,y+459,global.partyhp[0]._max*1.25/2,10,0,c_maroon,1);
	draw_sprite_ext(spr_pixel,0,x+40,y+459,global.partyhp[0]._curr*1.25/2,10,0,make_color_rgb(223,113,38),1);
	
	draw_sprite_ext(spr_pixel,0,x+175,y+459,global.partyhp[1]._max*10,10,0,c_maroon,1);
	draw_sprite_ext(spr_pixel,0,x+175,y+459,global.partyhp[1]._curr*10,10,0,make_color_rgb(122,201,255),1);
	
	#region DRAW CURRENT PAPS HP
	var STR=string(global.partyhp[0]._curr);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext);
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+65,445,1,1,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	#endregion
	
	#region DRAW MAX PAPS HP
	var STR=string(global.partyhp[0]._max);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext);
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+105,445,1,1,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	#endregion
	
	#region DRAW CURRENT SANS HP
	var STR=string(global.partyhp[1]._curr);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext);
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+200,446,1,1,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	#endregion
	
	#region DRAW MAX SANS HP
	var STR=string(global.partyhp[1]._max);
	var LEN=string_length(STR);
	var SPR_W=sprite_get_width(spr_drbttext);
	var draw_x=x;
	
	if(LEN%2!=0){
		draw_x-=(LEN-1)*((SPR_W)/2);	
	} else {
		draw_x-=((SPR_W)/2)+(LEN/2-1)*(SPR_W);
	}
	var proc=1;
	repeat(LEN){
		draw_sprite_ext(spr_drbttext,real(string_char_at(STR,proc)),draw_x+230,446,1,1,0,c_white,1);
		draw_x+=SPR_W+1;
		proc+=1;
	}
	#endregion
	break;
	#endregion
}
#endregion

#region SHOW CURRENTLY TARGETED ENEMY
switch(enemyTarget){
	case 1:
		if(targetXOffset>0){
			draw_sprite_ext(spr_battle_target,targetIndex,global.enc_slot[1].x+targetXOffset,global.enc_slot[1].y-targetYOffset,1.8,1.8,0,c_white,1);
		} else {
			draw_sprite_ext(spr_battle_target,targetIndex,global.enc_slot[1].x-targetXOffset,global.enc_slot[1].y-targetYOffset,1.8,1.8,0,c_white,1);
		}
	break;
}
#endregion

#region PROCESS ACTION VISUALS
switch(actionType){
	#region SOLO ATK 
	case 1:
			draw_set_alpha(specAlpha);
			draw_rectangle_color(100,140,300,80,c_orange,c_orange,c_orange,c_orange,true);
			draw_rectangle_color(100,140,-400,80,c_black,c_black,c_black,c_black,false);
			draw_rectangle_color(100,140,300,80,c_black,c_black,c_black,c_black,false);
			draw_rectangle_color(100+lineX,138,110+lineX,81,c_yellow,c_yellow,c_yellow,c_yellow,true);
			draw_sprite_ext(spr_btpress,0,30,81,1,1,0,c_white,specAlpha);
			switch(patternType){
				case 0:
					create_prompt(110,90,1,1);
					create_prompt(135,90,1,1);
					create_prompt(200,90,1,1);
					create_prompt(260,90,1,1);
				break;
				case 1:
					create_prompt(110,90,1,1);
					create_prompt(200,90,1,1);
					create_prompt(260,90,1,1);
				break;
			}
			draw_sprite_ext(spr_btpress_prompt,0,10,100,1,1,0,c_white,specAlpha);		
			draw_sprite_ext(spr_btpress_notice,0,260,90,1,1,0,c_white,specAlpha);
			draw_set_alpha(1);
	
	break;
	#endregion
	#region BROS ATK
	case 2:
		draw_set_color(c_yellow);
	break;
	#endregion
}
#endregion