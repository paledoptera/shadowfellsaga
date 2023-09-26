function item_set_pocketed(slot,amt){
	if(global.itempocketed[slot]<global.itempocketlimit){
		global.itempocketed[slot]+=amt
	} 
}