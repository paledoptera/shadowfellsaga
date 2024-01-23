function item_info(item_id){
	usable = 0
	pocketable = 0 // Can the item be stacked? (JRPG Style, including M&L Superstar Saga and Chrono Trigger)
    buyvalue = 0
	sellvalue = 0
	pocketed = 0
    itemtarget = 0
    itemnameb = " "
    itemdescb = " "
	
	switch(item_id)
	{
		case 0:
			itemnameb = " "
            itemdescb = "---"
			break;
		case 1:
			var _darkcandy = new DarkCandy(); 
			itemnameb = _darkcandy.longName; // Dark Candy
            itemdescb = item_desc_simple(1); 
            itemtarget = 1
            buyvalue = _darkcandy.buyPrice
			sellvalue = _darkcandy.sellPrice
            usable = 1
			pocketed=1;
			pocketable = 1;
			break;
	}
	return;
}