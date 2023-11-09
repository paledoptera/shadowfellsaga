function item_remove_pocketed(slot){
	global.itempocketed[slot]=number_sub(global.itempocketed[slot],0,1);
	if global.itempocketed[slot] == 0 {
		global.item[slot] = 0
	}
}