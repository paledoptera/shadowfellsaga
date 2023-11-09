function item_desc_simple(item){
	__itemdesc = "---";
	switch(item){
		case 0:
			__itemdesc="---";
		break;
		case 1:
			__itemdesc=string_hash_to_newline(str_set_loc("Heals 40 HP. A red-and-black star#that tastes like marshmallows.","item_info_slash_item_info_gml_1_0"))
		break;
	}
	
	return __itemdesc;
}