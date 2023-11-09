function armor_info(armor){
	armordesc="---";
	armorname= " ";
	armorsubimg=0;
	switch(armor){
		case 0:
			armordesc="---";
			armorname= " ";
			armorsubimg = 5;
			break;
		case 200:
			var _amberCard = new AmberCard()
			armorname= _amberCard.longName;
			armordesc= _amberCard.checkText;
			armorsubimg = 3;
			break;
	}
	return;
}