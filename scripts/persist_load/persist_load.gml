// Load persistent game data from a buffer
function persist_load(){
	if (argument_count >= 1)
        var gotogamebroke = argument[0]
    else
        gotogamebroke = 1
    var buff = buffer_load("file9")
    if (buff == -1 || buffer_get_size(buff) < 21 || chr(buffer_read(buff, buffer_u8)) != "S" || chr(buffer_read(buff, buffer_u8)) != "H" || chr(buffer_read(buff, buffer_u8)) != "A" || chr(buffer_read(buff, buffer_u8)) != "D" 
	 || chr(buffer_read(buff, buffer_u8)) != "O" || chr(buffer_read(buff, buffer_u8)) != "W" || chr(buffer_read(buff, buffer_u8)) != "F" || chr(buffer_read(buff, buffer_u8)) != "E") || chr(buffer_read(buff, buffer_u8)) != "L"
	 || chr(buffer_read(buff, buffer_u8)) != "L" || chr(buffer_read(buff, buffer_u8)) != "S" || chr(buffer_read(buff, buffer_u8)) != "A" || chr(buffer_read(buff, buffer_u8)) != "G" || chr(buffer_read(buff, buffer_u8)) != "A"
    {
        global.gamebroke = 5
        if gotogamebroke
            room_goto(STAGE_GAME_BROKE)
        buffer_delete(buff)
        return;
    }
    var v = buffer_read(buff, buffer_u8)
    if (v != 0 && v != 1)
    {
        global.gamebroke = 6
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
        if (newBuff < 0)
        {
            global.gamebroke = 2
            if gotogamebroke
                room_goto(rm_gamebroke)
            return;
        }
        else
            buff = newBuff
    }
    var s = buffer_read(buff, buffer_u16)
    for (var i = 0; i < s; i++)
    {
        var key = buffer_read(buff, buffer_string)
        var val = buffer_read_val(buff)
        ds_map_set(global.pflags, key, val)
    }
    var h = array_create(5)
    for (i = 0; i < 5; i++)
        h[i] = buffer_read(buff, buffer_u32)
    buffer_seek(buff, buffer_seek_relative, -20)
    var h2 = ""
    t[5] = "5"
    t[13] = "d"
    t[0] = "0"
    t[14] = "e"
    t[1] = "1"
    t[9] = "9"
    t[10] = "a"
    t[6] = "6"
    t[15] = "f"
    t[2] = "2"
    t[8] = "8"
    t[7] = "7"
    t[11] = "b"
    t[12] = "c"
    t[4] = "4"
    t[3] = "3"
    for (var _x = 27; _x < 47; _x++)
    {
        if ((_x % 4) == 0)
            buffer_write(buff, buffer_u8, (_x + string_length(h2)))
        else
            buffer_write(buff, buffer_u8, (floor((_x * 0.4987)) * floor((_x * 0.012))))
        var d = ((_x - 27) / 4)
        var b = ((h[floor(d)] >> (32 * frac(d))) & 255)
        h2 += (t[(b >> 4)] + t[(b & 15)])
    }
    if (h2 != string_lower(buffer_sha1(buff, 0, buffer_tell(buff))))
        v = 666
    buffer_delete(buff)
    if ((v - 667) == -1)
    {
        global.gamebroke = 7
        room_goto(STAGE_GAME_BROKE)
    }
    return;
}