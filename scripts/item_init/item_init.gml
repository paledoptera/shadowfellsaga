// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function item_init(){
global.item[0] = 0
    global.item[1] = 0
    global.item[2] = 0
    global.item[3] = 0
    global.item[4] = 0
    global.item[5] = 0
    global.item[6] = 0
    global.item[7] = 0
    global.item[8] = 0
    global.item[9] = 0
    global.item[10] = 0
    global.item[11] = 0
    global.item[12] = 0
    global.keyitem[0] = 1
    global.keyitem[1] = 0
    global.keyitem[2] = 0
    global.keyitem[3] = 0
    global.keyitem[4] = 0
    global.keyitem[5] = 0
    global.keyitem[6] = 0
    global.keyitem[7] = 0
    global.keyitem[8] = 0
    global.keyitem[9] = 0
    global.keyitem[10] = 0
    global.keyitem[11] = 0
    global.keyitem[12] = 0
    global.weapon[0] = 0
    global.weapon[1] = 0
    global.weapon[2] = 0
    global.weapon[3] = 0
    global.weapon[4] = 0
    global.weapon[5] = 0
    global.weapon[6] = 0
    global.weapon[7] = 0
    global.weapon[8] = 0
    global.weapon[9] = 0
    global.weapon[10] = 0
    global.weapon[11] = 0
    global.weapon[12] = 0
    global.armor[0] = 0
    global.armor[1] = 0
    global.armor[2] = 0
    global.armor[3] = 0
    global.armor[4] = 0
    global.armor[5] = 0
    global.armor[6] = 0
    global.armor[7] = 0
    global.armor[8] = 0
    global.armor[9] = 0
    global.armor[10] = 0
    global.armor[11] = 0
    global.armor[12] = 0
	
	global.charselect=0;
	global.itempocketlimit=99;
	
	 for (i = 0; i < 12; i += 1)
    {
        itemid = global.item[i]
        item_info(itemid)
        global.itemnameb[i] = itemnameb
        global.itemdescb[i] = itemdescb
        global.itembuyvalue[i] = buyvalue
		global.itemsellvalue[i] = sellvalue
        global.itemusable[i] = usable
		global.itempocketed[i] = pocketed
    }
}