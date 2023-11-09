function armor_equip(target,item,slot,slot2){
	///@arg target*
	///@arg item
	///@arg slot	- Target slot (where item is stored)
	//@arg slot2 - Destination slot (where the item will be equipped)
	switch(item){
		case 0:
			armornameb="(Nothing)"
			armordescb=""
		break;
		case 200:
			armornameb="Amber Card"
			armordescb=""
			switch(target){
				case 0:
					global.armor[slot] = 0;
					global.armequip[slot2] = item	
				break;
				case 1:
					global.armor[slot] = 0;
					global.armequip[slot2] = item	
				break;
			}
		break;
	}
}