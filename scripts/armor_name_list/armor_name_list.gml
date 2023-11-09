function armor_name_list(){
switch armorid {
		case 0:
			global.armornameb[i] = "---------"
			global.armequipname[i] = "(Nothing)"
		break;
		case 200:
				global.armornameb[i] = "Amber Card"
				if global.show_equip_name == true
				global.armequipname[i] = "Amber Card"
			break;
		case 201:
				global.armornameb[i] = "Pink Ribbon"
				if global.show_equip_name == true
				global.armequipname[i] = "Pink Ribbon"
			break;
	}
	
	return;
}