// Load game data from a file
function loadgame()
{
	if(argument_count>=1){
		var saveid=argument[0]
		if(argument_count>=2)
			var gotogamebroke = argument[1]
		else
			gotogamebroke=1
	}
	 if (global.tempsave_buffer != -4 && buffer_exists(global.tempsave_buffer))
    {
        buffer_seek(global.tempsave_buffer, buffer_seek_start, 0)
        loadgame_unserialize(global.tempsave_buffer, 0)
        return;
    }
	var buff = buffer_load(("file" + string(saveid)))
	var v = buffer_read(buff, buffer_u8)
	if (buff == -1 || buffer_get_size(buff) < 21)
    {
        global.gamebroke = 2
        if gotogamebroke
            room_goto(STAGE_GAME_BROKE)
        buffer_delete(buff)
        return;
    }
    if (chr(buffer_read(buff, buffer_u8)) != "S" || chr(buffer_read(buff, buffer_u8)) != "H" || chr(buffer_read(buff, buffer_u8)) != "A" || chr(buffer_read(buff, buffer_u8)) != "D" 
	 || chr(buffer_read(buff, buffer_u8)) != "O" || chr(buffer_read(buff, buffer_u8)) != "W" || chr(buffer_read(buff, buffer_u8)) != "F" || chr(buffer_read(buff, buffer_u8)) != "E") || chr(buffer_read(buff, buffer_u8)) != "L"
	 || chr(buffer_read(buff, buffer_u8)) != "L" || chr(buffer_read(buff, buffer_u8)) != "S" || chr(buffer_read(buff, buffer_u8)) != "A" || chr(buffer_read(buff, buffer_u8)) != "G" || chr(buffer_read(buff, buffer_u8)) != "A"
    {
        //global.gamebroke = 2
        //if gotogamebroke
        //    room_goto(STAGE_GAME_BROKE)
        buffer_delete(buff)
        return;
    }
	 if (v != 0 && v != 1)
    {
        global.gamebroke = 3
        if gotogamebroke
            room_goto(STAGE_GAME_BROKE)
        buffer_delete(buff)
        return;
    }
    if (v == 1)
    {
        var size = buffer_read(buff, buffer_u32)
        var tempBuff = buffer_create(size, buffer_fixed, 1)
        buffer_copy(buff, buffer_tell(buff), size, tempBuff, 0)
        var newBuff = buffer_decompress(tempBuff)
        buffer_delete(tempBuff)
        buffer_delete(buff)
        buff = newBuff
    }
    loadgame_unserialize(buff, gotogamebroke)
	load_general();
	config_load();
    var h = array_create(5)
    for (i = 0; i < 5; i++)
        h[i] = buffer_read(buff, buffer_u32)
    buffer_seek(buff, buffer_seek_relative, -20)
    var h2 = ""
    t[15] = "f"
    t[13] = "d"
    t[0] = "0"
    t[14] = "e"
    t[1] = "1"
    t[5] = "5"
    t[9] = "9"
    t[10] = "a"
    t[11] = "b"
    t[2] = "2"
    t[3] = "3"
    t[7] = "7"
    t[6] = "6"
    t[12] = "c"
    t[4] = "4"
    t[8] = "8"
    for (var _x = 123; _x < 143; _x++)
    {
        if ((_x % 4) == 0)
            buffer_write(buff, buffer_u8, (_x + string_length(h2)))
        else
            buffer_write(buff, buffer_u8, (floor((_x * 0.5131)) * floor((_x * 0.0142))))
        var d = ((_x - 123) / 4)
        var b = ((h[floor(d)] >> (32 * frac(d))) & 255)
        h2 += (t[(b >> 4)] + t[(b & 15)])
    }
    if (h2 != string_lower(buffer_sha1(buff, 0, buffer_tell(buff))))
    {
        saveid = 400
        global.currentroom = undefined
    }
    buffer_delete(buff)
    global.lpartyname = global.partynames[2];
    global.lloadedroom = global.currentroom
	global.lloadedarea = global.currentarea;
    global.ltime =global.timeseconds
    global.lpartylv0 = global.partylv[0]; 
	global.lpartylv1 = global.partylv[1];
    global.lpartyhp0 = global.partyhp[0]._curr;
	global.lpartyhp1 = global.partyhp[1]._curr;
    global.lplayermoney = global.money
    global.lplayerxp = global.exp
    return;
}