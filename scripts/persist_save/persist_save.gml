// Ran in game_init
// Creates a save file storing persistent game data on game startup
// Does not take any arguments
function persist_save(){
    var buffOverall = buffer_create(512, buffer_grow, 1)
    buffer_write(buffOverall, buffer_text, "SHADOWFELLSAGA")
    buffer_write(buffOverall, buffer_u8, 1)
    var buff = buffer_create(512, buffer_grow, 1)
    buffer_write(buff, buffer_u16, ds_map_size(global.pflags))
    for (var key = ds_map_find_first(global.pflags); key != undefined; key = ds_map_find_next(global.pflags, key))
    {
		buffer_write(buff, buffer_string, key)
        buffer_write_val(buff, ds_map_find_value(global.pflags, key))
    }
    var ii = 0
    for (var _x = 27; _x < 47; _x++)
    {
        if ((_x % 4) == 0)
            buffer_write(buff, buffer_u8, (_x + ii))
        else
            buffer_write(buff, buffer_u8, (floor((_x * 0.4987)) * floor((_x * 0.012))))
        ii += 2
    }
    var h = string_lower(buffer_sha1(buff, 0, buffer_tell(buff)))
    buffer_seek(buff, buffer_seek_relative, -20)
    for (var i = 1; i <= 40; i += 2)
    {
        var c = ord(string_char_at(h, i))
        var c2 = ord(string_char_at(h, (i + 1)))
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
	var filename="file9"; 
    buffer_save(buffOverall, filename)
    buffer_delete(buffOverall)
    return;
}