// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function weapon_info(){
	weapondesc="---";
	weaponname= " ";
	weaponsubimg=0;
	switch(weapon){
		case 0:
			weapondesc="---";
			weaponname= " ";
			weaponsubimg = 5;
			break;
		case 200:
			var _spookySword = new Spookysword()
			weapondesc= "Obama";
			weaponname= "Spookysword";
			weaponsubimg = 0;
			break;
	}
	return;
}