// Save game data to a file
function savegame(){
	if(global.tempsave_buffer != noone && buffer_exists(global.tempsave_buffer)){
		buffer_delete(global.tempsave_buffer);
		global.tempsave_buffer=noone;
	}
	global.lpartyname=global.partynames[2];
	global.lcurrentarea=global.currentarea;
	global.lloadedroom=global.currentroom;
	global.ltime=global.timeseconds;
	var buffOverall=buffer_create(1024,buffer_grow,1);
	buffer_write(buffOverall,buffer_text,"SHADOWFELLSAGA");
	buffer_write(buffOverall,buffer_u8,1);
	var buff=buffer_create(512,buffer_grow,1);
	savegame_serialize(buff);
	save_general(global.filechoice);
	config_save();
	var ii=0;
	for (var xx=123; xx<143;xx++)
	{
		if((xx % 4) == 0)
			buffer_write(buff, buffer_u8, (xx + ii))
		else
			  buffer_write(buff, buffer_u8, (floor((xx * 0.5131)) * floor((xx * 0.0142))))
        ii += 2
	}
	var h=string_lower(buffer_sha1(buff,0,buffer_tell(buff)))
	var l=string_length(h)
	buffer_seek(buff,buffer_seek_relative,-20)
	for (i=1; i<=40; i+=2){
		var c=ord(string_char_at(h,i))
		var c2=ord(string_char_at(h,(i+1)))
		if (c >= 48 && c <= 57)
            c -= 48
        else if (c >= 97 && c <= 102)
            c = ((c - 97) + 10)
        if (c2 >= 48 && c2 <= 57)
            c2 -= 48
        else if (c2 >= 97 && c2 <= 102)
            c2 = ((c2 - 97) + 10)
        buffer_write(buff, buffer_u8, (c2 | (c << 4)))
	}
	var cmpBuff = buffer_compress(buff, 0, buffer_tell(buff))
    buffer_delete(buff)
    var cmpSize = buffer_get_size(cmpBuff)
    buffer_write(buffOverall, buffer_u32, cmpSize)
    buffer_copy(cmpBuff, 0, cmpSize, buffOverall, buffer_tell(buffOverall))
    buffer_delete(cmpBuff)
    buffer_save(buffOverall, ("file" + string(global.filechoice)))
    buffer_delete(buffOverall)
	return;
}