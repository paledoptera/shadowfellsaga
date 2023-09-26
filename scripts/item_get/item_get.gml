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