// Initializes all party data, does not take any arguments.
function party_init(){
	global.party_names[0]="PAPYRUS";
	global.party_names[1]="sans";
	
	global.party_hp[0]={_curr:60,_max:60};
	global.party_hp[1]={_curr:40,_max:40};
	
	global.party_lv=1; 
	
	global.party_atk[0] = 5;
	global.party_atk[1] = 8;
	
	global.party_def[0] = 5;
	global.party_def[1] = 4;
	
	global.party_sp[0] = 10;
	global.party_sp[1] = 14;
	
	global.party_exp_to_next = 7;

	global.party_equipped_wep[0] = -1;
	global.party_equipped_wep[1] = -1;
	
	global.party_equipped_armr[0] = -1;
	global.party_equipped_armr[1] = -1;

}