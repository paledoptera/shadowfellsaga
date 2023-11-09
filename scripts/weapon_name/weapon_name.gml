// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function weapon_name(){
	for (i = 0; i<12; i+=1){
		weaponid=global.weapon[i];
		weapon_name_list();
	}
}