#region Encounter
function encounter_init(){
	global.enc_id=-1;
	global.enc_slot[0]=noone;
	global.enc_slot[1]=noone;
	global.enc_slot[2]=noone;
	global.enc_name[0]="";
	global.enc_name[1]="";
	global.enc_name[2]="";
}

///@arg encounter_id
function encounter_start() {
	var ID=argument[0];
	global.enc_id=ID;
	flag_set(global.flags,"enc",global.enc_id);
	
	if(!player_is_in_battle()){
				mus_stop(global.currentmus);
		room_persistent=true;
	}
	room_goto(STAGE_BATTLE);
}
	
function encounter_check(){
	switch(global.enc_id){
		case 99:
			global.enc_name[1]="Semi Sheriff";
			global.enc_slot[1]=SEMI;
	//		instance_create_layer(549,168,"Instances",SEMI);
			instance_create_layer(384,256,"Instances",SEMI);
	//		instance_create_layer(549,256,"Instances",SEMI);
		break;
	}
}
#endregion


///@arg amount
function battle_set_available_options(){
	var OPTION_AMOUNT=argument[0];
	if(instance_exists(obj_battle_ui)){
		with(obj_battle_ui){
			optionsAvailable=OPTION_AMOUNT;
		}
	}
}
	
///@arg enemy_slot
///@arg name
function battle_set_enemy_name(){
	var ENEMY=argument[0];
	var NAME=argument[1];
	
	if(instance_exists(battle_get_enemy(ENEMY))){
		ctrl_battle._enemy_name[ENEMY]=NAME;	
		return true;
	} else {
		return false;	
	}
	
}
	
///@arg enemy_slot
///@arg def
function battle_set_enemy_def() {
	var ENEMY=argument[0];
	var DEF=argument[1];

	ctrl_battle._enemy_def[ENEMY]=DEF;
	return true;
}
