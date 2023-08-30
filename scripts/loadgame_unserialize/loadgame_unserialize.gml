// Ran inside of loadgame()
// This takes all relevant game data and loads it using a buffer
function loadgame_unserialize(buff,argument1)
{
	global.partynames[0]=buffer_read(buff,buffer_string);
	global.partynames[1]=buffer_read(buff,buffer_string);
	global.partynames[2]=buffer_read(buff,buffer_string);
	global.partyhp[0]._curr=buffer_read(buff,buffer_u16);
	global.partyhp[0]._max=buffer_read(buff,buffer_u16);
	global.partyhp[1]._curr=buffer_read(buff,buffer_u16);
	global.partyhp[1]._max=buffer_read(buff,buffer_u16);
	global.currentroom=buffer_read(buff,buffer_u16);
	global.timeseconds=buffer_read(buff,buffer_u32);
	s = buffer_read(buff,buffer_u8)
	for(i = 0; i<s; i++){
		var key = buffer_read(argument0, buffer_string)
        var val = buffer_read_val(argument0)
        ds_map_set(global.flags, key, val)
	}
	return;
}