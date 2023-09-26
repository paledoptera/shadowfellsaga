function stats_init(argument0){
	global.fun = irandom_range(0,99);
	if argument0==true
	{
		global.inv_item = ds_list_create();
		global.inv_key = ds_list_create();
	} else {
		ds_list_clear(global.inv_item);
		ds_list_clear(global.inv_key);
	}
	ds_list_add(global.inv_item,1);
	ds_list_add(global.inv_key,0);
	return;
}