function key_item_info(key_item){
	tempkeyitemdesc="---";
	tempkeyitemname= " ";
	tempkeyitemusable=0
	switch(key_item){
		case 0:
			tempkeyitemdesc="---";
			tempkeyitemname= " ";
			break;
		case 1:
			tempkeyitemdesc="It can be used to make calls.";
			tempkeyitemname= "Cell Phone";
			tempkeyitemusable=1
			break;
	}
}