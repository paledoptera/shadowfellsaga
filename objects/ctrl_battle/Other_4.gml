instance_create(0,0,obj_battle_ui);

var ENCOUNTER=flag_get(global.flags,"enc");
encounter_check();
switch(ENCOUNTER)
{
	case 99:
		mus_playx(mus_load("sheriffduel"),true,0.6,0,0.95);
	break;
}
//var proc=0;
//repeat(3){
//	battle_set_enemy(__enemy_inst[proc],proc);
//	proc+=1;
//}