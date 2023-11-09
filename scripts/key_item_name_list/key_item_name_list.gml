function key_item_name_list(){
	switch keyitemid {
		case 0:
			global.keyitemname[i] = "---------"
		break;
		case 100:
				global.keyitemname[i] = str_set_loc("Cell Phone", "key_item_info_slash_key_item_info_gml_0_0")
			break;
	}
	
	return;
}