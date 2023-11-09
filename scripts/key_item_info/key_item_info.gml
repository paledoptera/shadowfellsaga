function key_item_info(key_item){
	keyitemdesc="---";
	keyitemname= " ";
	keyitemusable=0
	switch(key_item){
		case 0:
			keyitemdesc="---";
			keyitemname= " ";
			break;
		case 100:
			var _cellPhone = new CellPhone()
			keyitemname= _cellPhone.longName;
			keyitemdesc= _cellPhone.checkText;
			keyitemusable=1
			break;
	}
	return;
}