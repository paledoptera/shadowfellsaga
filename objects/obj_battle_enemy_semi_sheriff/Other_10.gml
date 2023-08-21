///@desc Turn Start

if(BTUI.enemyTurnReady==false){BTUI.enemyTurnReady=true;};
// normally you'd put sprite_index=enemy,attacking here, where applicable
switch(global.currentBattleTurn){
		case 1:
			if(!instance_exists(obj_atk_bullet_single)){
				instance_create_depth(SEMI.x-15,SEMI.y,0,obj_atk_bullet_single);
			}
		break;
		case 2:
			if(!instance_exists(obj_atk_bullet_single)){
				instance_create_depth(SEMI.x-15,SEMI.y,0,obj_atk_bullet_single);
			}
		break;
		case 3:
			if(!instance_exists(obj_atk_bullet_triple)){
				instance_create_depth(SEMI.x-15,SEMI.y,0,obj_atk_bullet_triple);
			}
		break;
		case 7:
			if(!instance_exists(obj_atk_bullet_double)){
				instance_create_depth(SEMI.x-15,SEMI.y,0,obj_atk_bullet_double);
			}
		break;
}