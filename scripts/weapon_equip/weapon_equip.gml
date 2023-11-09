function weapon_equip(target,item,slot,slot2){
	///@arg target*
	///@arg item
	///@arg slot	- Target slot (where item is stored)
	//@arg slot2 - Destination slot (where the item will be equipped)
	switch(item){
		case 0:
			weaponnameb="(Nothing)"
			weapondescb=""
		break;
		case 200:
			weaponnameb="Spookysword"
			weapondescb=""
			switch(target){
				case 0:
					global.weapon[slot] = 0;
					global.wepequip[slot2] = item	
					global.wepquipname[slot2] = weaponnameb
				break;
				case 1:
					global.weapon[slot] = 0;
					global.wepequip[slot2] = item	
					global.wepquipname[slot2] = weaponnameb
				break;
			}
		break;
	}
}