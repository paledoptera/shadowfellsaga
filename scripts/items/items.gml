// Intiializes all item data
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
        global.itemvalue[i] = value
        global.itemusable[i] = usable
		global.itempocketed[i] = pocketed
    }
	//var name = "DarkCandy";
	//var desc = "Heals 40 HP. A red-and-black star\nthat tastes like marshmallows.";
	return;
}
	
#region Normal Items

function item_info(item_id){
	usable = 0
	pocketable = 0 // Can the item be stacked? (JRPG Style, including M&L Superstar Saga and Chrono Trigger)
    value = 0
	pocketed = 0
    itemtarget = 0
    itemnameb = " "
    itemdescb = " "
	switch(item_id){
		case 0:
			itemnameb = " "
            itemdescb = "---"
			break;
		case 1:
			itemnameb = get_lang_string("item_info_slash_item_info_gml_0_0") // Dark Candy
            itemdescb = get_lang_string("item_info_slash_item_info_gml_1_0") // Heals#40HP
            itemtarget = 1
            value = 25
            usable = 1
			pocketed=1;
			pocketable = 1;
			break;
	}
	return;
}
	
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
	
function item_add(slot,item,amt){
		global.item[slot]=item;
		item_set_pocketed(slot,amt);
}
	
function item_remove_all(slot){
	global.item[slot]=0;
	item_set_pocketed(slot,0);
}
	
function item_use(item,slot){
	switch(item){
		case 0:
			itemnameb=" ";
			itemdescb="---";
		break;
		case 1:
			if(global.partyhp[0]._curr<global.partyhp[0]._max||global.partyhp[1]._curr<global.partyhp[1]._max){
				item_heal(global.charselect, 40)
				item_remove_pocketed(0)	
			    if(global.itempocketed[slot]==0){
					item_remove_all(slot)
				}
				
				switch(global.charselect){
					case 0:
						item_comment(global.charselect, "DELICIOUS!", fnt_papyrus)
					break;
					case 1:
						item_comment(global.charselect, "* this is a sticky situation...", fnt_sans)
					break;
				}
			}
		break;
	}
}
	
function item_remove_pocketed(slot){
	global.itempocketed[slot]=number_sub(global.itempocketed[slot],0,0.5);
}

function item_heal(target,amt){
	switch(target){
		case 0:
			if(global.partyhp[0]._curr<global.partyhp[0]._max){
				global.partyhp[0]._curr+=amt/2;
				global.charselect=0;
			} 
		break;
		case 1:
			if(global.partyhp[1]._curr<global.partyhp[1]._max){
				global.partyhp[1]._curr+=amt/2;
				global.charselect=1;
			}
		break;
	}
}

function item_heal_party(amt){
		global.partyhp[0]._curr+=amt;
		global.partyhp[1]._curr+=amt;
}

function item_heal_party_full(){
		global.partyhp[0]._curr+=global.partyhp[0]._max;
		global.partyhp[1]._curr+=global.partyhp[1]._max;
}

function item_set_pocketed(slot,amt){
	if(global.itempocketed[slot]<global.itempocketlimit){
		global.itempocketed[slot]+=amt
	} 
}
	
function item_get(item){
	i=0;
	loop=1;
	nr=0;
	global.item[12]=999;
	while (loop==1){
		if(global.item[i] == 0)
		{
				global.item[i] = item;	
				break;
		} else if (i == 12){
			nr=1;
			break;
		} else {
			i+=1;
			continue;
		}
	}
	return;
}
	
function item_exists_inslot(slot,item){
		if(global.item[slot]==item){
				global.selecteditem=item;
		} else {
			global.selecteditem=0;	
		}
}
	
function item_getdesc(){
	for (i=0; i<12; i+=1){
		itemid=global.item[i];
		itemdesc[i] = item_desc_simple(itemid);
	}
	return;
}

function item_desc_simple(item){
	__itemdesc = "---";
	switch(item){
		case 0:
			__itemdesc="---";
		break;
		case 1:
			__itemdesc=string_hash_to_newline(str_set_loc("Heals 40 HP. A red-and-black star#that tastes like marshmallows.","item_info_slash_item_info_gml_1_0"))
		break;
	}
	
	return __itemdesc;
}
	
function item_comment(target, str, font){
	var _xx = -1;
	switch(target){
		case  0:
			_xx=20;
		break;
		case 1:
			_xx=380;
		break;		
	}
	comment = instance_create(_xx,460,obj_commentwriter);
	comment.msg = str;
	comment.font = font;
	return;
}

function item_name(){
	for (i = 0; i<12; i+=1){
		itemid=global.item[i];
		item_name_list();
	}
}

function item_name_list(){
	var __count_min=1;
	switch itemid {
		case 0:
			global.itemname[i] = "----------"
		break;
		case 1:
			if(global.itempocketed[i]>__count_min){
				 global.itemname[i] = str_set_loc("Dark Candy", "item_name_list_slash_item_name_list_gml_1_0") + "(" + string(global.itempocketed[i])+")";
			} else {
				global.itemname[i] = str_set_loc("Dark Candy", "item_name_list_slash_item_name_list_gml_1_0")
			}
			break;
	}
	
	return;
}
	
#endregion

#region Key Items

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
	
function key_item_add(slot, key_item){
	global.keyitem[slot]=key_item;
}
	
function key_item_get(key_item){
	i=0;
	loop=1;
	nr=0;
	global.keyitem[12]=999;
	while (loop==1){
		if(global.keyitem[i] == 0)
		{
				global.keyitem[i] = item;	
				break;
		} else if (i == 12){
			nr=1;
			break;
		} else {
			i+=1;
			continue;
		}
	}
	return;
}
	
#endregion