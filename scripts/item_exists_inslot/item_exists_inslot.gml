function item_exists_inslot(slot,item){
		if(global.item[slot]==item){
				global.selecteditem=item;
		} else {
			global.selecteditem=0;	
		}
}