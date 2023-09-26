function item_use(item,slot){
	switch(item){
		case 0:
			itemnameb=" ";
			itemdescb="---";
		break;
		case 1:
			if(global.partyhp[0]._curr<global.partyhp[0]._max||global.partyhp[1]._curr<global.partyhp[1]._max){
				item_heal(global.charselect, 40)
				item_remove_pocketed(slot)	
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