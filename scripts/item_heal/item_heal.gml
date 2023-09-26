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