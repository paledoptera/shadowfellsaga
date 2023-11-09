function item_getdesc(){
	for (i=0; i<12; i+=1){
		itemid=global.item[i];
		itemdesc[i] = item_desc_simple(itemid);
	}
	return;
}