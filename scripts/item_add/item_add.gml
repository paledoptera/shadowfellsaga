function item_add(slot,item,amt){
		global.item[slot]=item;
		item_set_pocketed(slot,amt);
}