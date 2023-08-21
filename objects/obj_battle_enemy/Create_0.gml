_list_attacks=ds_map_create();

global.enemyTargetNum=undefined;
enemy = 
{
		identifier :		undefined,
		_name:			"Enemy",
		hp:					undefined,
		df:					undefined,
		at:					undefined,
		es0:				undefined,   // Elemental slot A
		es1:				undefined,  // Elemental slot B
		idle:				undefined,
		cut:					undefined,
		atk:					undefined,
		talk:				undefined,
		
}

_hp_max = enemy.hp;
_hp = _hp_max;
_df = enemy.df;
_at = enemy.at;
_element[0,0]=enemy.es0;
_element[0,1]=enemy.es1;

// -1 = Skips enemy transition, sets directly to idle phase
// "cut"  - Cutscene
// "talk" - Talking
// "atk" - Attacking
_state=-1;   

function SetEnemyState(state){
	switch(state){
		default:
			sprite_index=enemy.idle;
		break;
		case "cut":
			sprite_index=enemy.cut;			
		break;
		case "idle":
			sprite_index=enemy.idle;
		break;
		case "talk":
			sprite_index=enemy.talk;
		break;
		case "atk":
			sprite_index=enemy.atk;
		break;
	}
//	_state=state;
//	sprite_index=sprite;
}
