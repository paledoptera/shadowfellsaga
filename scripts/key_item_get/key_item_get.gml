function key_item_get(key_item){
	i=0;
	loop=1;
	nr=0;
	global.keyitem[12]=999;
	while (loop==1){
		if(global.keyitem[i] == 0)
		{
				global.keyitem[i] = keyitem;	
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
	