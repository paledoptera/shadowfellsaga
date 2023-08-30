// Ran inside of savegame()
// This takes all relevant game data nad saves it to a file using a buffer
function savegame_serialize(buff){
	///@arg buff - The buffer to use as an input
	buffer_write(buff,buffer_string,global.partynames[0]);
	buffer_write(buff,buffer_string,global.partynames[1]);
	buffer_write(buff,buffer_string,global.partynames[2]);
	buffer_write(buff,buffer_u16,global.currentroom);
	buffer_write(buff,buffer_u32,global.timeseconds);
	buffer_write(buff,buffer_u16,global.partyhp[0]._curr);
	buffer_write(buff,buffer_u16,global.partyhp[0]._max);
	buffer_write(buff,buffer_u16,global.partyhp[1]._curr);
	buffer_write(buff,buffer_u16,global.partyhp[1]._max);
	buffer_write(buff,buffer_u16,global.partylv[0]);
	buffer_write(buff,buffer_u16,global.partylv[1]);
	buffer_write(buff,buffer_u16,global.pX);
	buffer_write(buff,buffer_u16,global.pY);
	buffer_write(buff,buffer_u16,global.pfX);
	buffer_write(buff,buffer_u16,global.pfY);
	buffer_write(buff,buffer_u16,global.money);
	buffer_write(buff,buffer_u16,global.exp);
	buffer_write(buff,buffer_u16,0);
	buffer_write(buff,buffer_u8,0);
	buffer_write(buff,buffer_string,global.currentarea);
	buffer_write(buff,buffer_u16,ds_map_size(global.flags))
	for (var key=ds_map_find_first(global.flags);
	key != undefined; key=ds_map_find_next(global.flags,key))
	{
		buffer_write(buff,buffer_string,key);
		buffer_write(buff,buffer_string, ds_map_find_value(global.flags,key));
	}
	return;
}