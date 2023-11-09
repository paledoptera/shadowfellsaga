function weapon_desc_simple(weapon){
	///@arg weapon_id
	__weapondesc = "---";
	switch(weapon){
		case 0:
			__weapondesc="---";
		break;
		case 300:
			__weapondesc=string_hash_to_newline("A black-and-orange sword with a bat hilt.");
		break;
	}
	
	return __weapondesc;
}