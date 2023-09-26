function item_info_all(){
    for (i = 0; i < 12; i += 1)
    {
        itemid = global.item[i]
        item_info(itemid)
        global.itemnameb[i] = itemnameb
        global.itemdescb[i] = itemdescb
        global.itemvalue[i] = value
        global.itemusable[i] = usable
		global.itempocketable[i] = pocketable;
		global.itempocketed[i] = pocketed
    }
    return;
}