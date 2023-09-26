function item_name_list(){
	var __count_min=1;
	switch itemid {
		case 0:
			global.itemname[i] = "----------"
		break;
		case 1:
			if(global.itempocketed[i]>__count_min){
				 global.itemname[i] = str_set_loc("Dark Candy", "item_name_list_slash_item_name_list_gml_1_0") + " (" + string(global.itempocketed[i])+")";
			} else {
				global.itemname[i] = str_set_loc("Dark Candy", "item_name_list_slash_item_name_list_gml_1_0")
			}
			break;
	}
	
	return;
}