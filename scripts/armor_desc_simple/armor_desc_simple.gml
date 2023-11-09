function armor_desc_simple(armor){
	///@arg armor_id
	__armordesc = "---";
	switch(armor){
		case 0:
			__armordesc="---";
		break;
		case 100:
			__armordesc=string_hash_to_newline("A thin square charm that sticks#to you, increasing defense.");
		break;
	}
	
	return __armordesc;
}