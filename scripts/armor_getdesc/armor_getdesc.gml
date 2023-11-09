function armor_getdesc(){
	for (i=0; i<12; i+=1){
		armorid=global.armor[i];
		armordesc[i] = armor_desc_simple(armorid);
	}
	return;
}