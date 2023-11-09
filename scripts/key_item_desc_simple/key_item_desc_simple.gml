function key_item_desc_simple(key_item){
	///@arg key_item_id
	__keyitemdesc = "---";
	switch(key_item){
		case 0:
			__keyitemdesc="---";
		break;
		case 100:
			__keyitemdesc=string_hash_to_newline(str_set_loc("It can be used to make calls.","item_info_slash_item_info_gml_1_0"))
		break;
	}
	
	return __keyitemdesc;
}