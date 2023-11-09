function item_remove_all(slot){
	global.item[slot]=0;
	item_set_pocketed(slot,0);
}