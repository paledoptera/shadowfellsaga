#region Save
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
	var buffOverall=buffer_create(512,buffer_grow,1);
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
	
// Ran inside of savegame()
// Saves all data necessary for loading the game and displaying as strings to an ini file
// Does not take any arguments
function save_general(slot){
	var savroom;
	obj_gamehandler.drawnseconds = obj_gamehandler.seconds
	obj_gamehandler.drawnminutes = obj_gamehandler.minutes
	ini_open("sfsaga.ini");
	savroom=global.currentroom;
	global.loadroom=savroom;
	switch(slot){
		case 0:
					#region Slot 0
					ini_write_real("General-SL0","room",savroom);
					ini_write_real("General-SL0","plot",flag_get(global.flags,"plot"));
					ini_write_real("General-SL0","pX",PLAYER.x);
					ini_write_real("General-SL0","pY",PLAYER.y);
					ini_write_real("General-SL0","pfX",PLAYER.x);
					ini_write_real("General-SL0","pfY",PLAYER.y);
					savroom=global.currentroom;
					ini_write_real("Party-SL0","HP0",global.partyhp[0]._curr) // Papyrus
					ini_write_real("Party-SL0","MAXHP0",global.partyhp[0]._curr)
					ini_write_real("Party-SL0","HP1",global.partyhp[1]._curr) // Sans
					ini_write_real("Party-SL0","MAXHP1",global.partyhp[1]._max)
					ini_write_real("Party-SL0", "Level0",global.partylv[0])  // Papyrus level
					ini_write_real("Party-SL0", "Level1",global.partylv[1]) // Sans level
					ini_write_real("Party-SL0", "Money",global.money)
					ini_write_string("Party-SL0", "Name0",global.partynames[0]) 
					ini_write_string("Party-SL0", "Name1",global.partynames[1]) 
					ini_write_string("Party-SL0", "Name2",global.partynames[2]) 
					ini_write_string("World-SL0", "roomname",party_get_room_name(savroom));
					ini_write_real("World-SL0","SP",obj_gamehandler.ticks)	
					ini_write_real("World-SL0","MN",obj_gamehandler.minutes)
					ini_write_real("World-SL0","SC",obj_gamehandler.seconds)
					ini_write_real("World-SL0","MN2",obj_gamehandler.drawmninutes)
					ini_write_real("World-SL0","SC2",obj_gamehandler.drawnseconds)
					#endregion
		break;
		case 1:
					#region Slot 1
					ini_write_real("General-SL1","room",savroom);
					ini_write_real("General-SL1","plot",flag_get(global.flags,"plot"));
					ini_write_real("General-SL1","pX",PLAYER.x);
					ini_write_real("General-SL1","pY",PLAYER.y);
					ini_write_real("General-SL1","pfX",PLAYER.x);
					ini_write_real("General-SL1","pfY",PLAYER.y);
					savroom=global.currentroom;
					ini_write_real("Party-SL1","HP0",global.partyhp[0]._curr) // Papyrus
					ini_write_real("Party-SL1","MAXHP0",global.partyhp[0]._curr)
					ini_write_real("Party-SL1","HP1",global.partyhp[1]._curr) // Sans
					ini_write_real("Party-SL1","MAXHP1",global.partyhp[1]._max)
					ini_write_real("Party-SL1", "Level0",global.partylv[0])  // Papyrus level
					ini_write_real("Party-SL1", "Level1",global.partylv[1]) // Sans level
					ini_write_real("Party-SL1", "Money",global.money)
					ini_write_string("Party-SL1", "Name0",global.partynames[0]) 
					ini_write_string("Party-SL1", "Name1",global.partynames[1]) 
					ini_write_string("Party-SL1", "Name2",global.partynames[2]) 
					ini_write_string("World-SL1", "roomname",party_get_room_name(savroom));
					ini_write_real("World-SL1","SP",obj_gamehandler.ticks)	
					ini_write_real("World-SL1","MN",obj_gamehandler.minutes)
					ini_write_real("World-SL1","SC",obj_gamehandler.seconds)
					ini_write_real("World-SL1","MN2",obj_gamehandler.drawmninutes)
					ini_write_real("World-SL1","SC2",obj_gamehandler.drawnseconds)
					#endregion
		break;
		case 2:
					#region Slot 2
						ini_write_real("General-SL2","room",savroom);
						ini_write_real("General-SL2","plot",flag_get(global.flags,"plot"));
						ini_write_real("General-SL2","pX",PLAYER.x);
						ini_write_real("General-SL2","pY",PLAYER.y);
						ini_write_real("General-SL2","pfX",PLAYER.x);
						ini_write_real("General-SL2","pfY",PLAYER.y);
						savroom=global.currentroom;
						ini_write_real("Party-SL2","HP0",global.partyhp[0]._curr) // Papyrus
						ini_write_real("Party-SL2","MAXHP0",global.partyhp[0]._curr)
						ini_write_real("Party-SL2","HP1",global.partyhp[1]._curr) // Sans
						ini_write_real("Party-SL2","MAXHP1",global.partyhp[1]._max)
						ini_write_real("Party-SL2", "Level0",global.partylv[0])  // Papyrus level
						ini_write_real("Party-SL2", "Level1",global.partylv[1]) // Sans level
						ini_write_real("Party-SL2", "Money",global.money)
						ini_write_string("Party-SL2", "Name0",global.partynames[0]) 
						ini_write_string("Party-SL2", "Name1",global.partynames[1]) 
						ini_write_string("Party-SL2", "Name2",global.partynames[2]) 
						ini_write_string("World-SL2", "roomname",party_get_room_name(savroom));
						ini_write_real("World-SL2","SP",obj_gamehandler.ticks)	
						ini_write_real("World-SL2","MN",obj_gamehandler.minutes)
						ini_write_real("World-SL2","SC",obj_gamehandler.seconds)
						ini_write_real("World-SL2","MN2",obj_gamehandler.drawmninutes)
						ini_write_real("World-SL2","SC2",obj_gamehandler.drawnseconds)
						#endregion
		break;
	}
	ini_close();

}
	
// Creates a temporary save buffer, ran inside of savegame()
// Does not take any arguments
function tempsave(){
	if (global.tempsave_buffer != -4 && buffer_exists(global.tempsave_buffer))
        buffer_delete(global.tempsave_buffer)
    global.tempsave_buffer = buffer_create(512, buffer_grow, 1)
    savegame_serialize(global.tempsave_buffer)
    return;
}
	
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
#endregion
#region Load

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
//	load_general();
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

// Load all relevant game data for display using an ini file
function load_general(){
	var loadedroom; 
	if(file_exists("sfsaga.ini"))
	{
		ini_open("sfsaga.ini");
		#region Slot 0
		loadedroom							= ini_read_real("General-SL0","room",1)
		flag_set(global.flags,"plot",ini_read_real("General-SL0","plot",0));
		PLAYER.x									= ini_read_real("General-SL0","pX",320)
		PLAYER.y									= ini_read_real("Genera-SL0","pY",320)
		FOLLOWER.x							= ini_read_real("General-SL0","pfX",320)
		FOLLOWER.y							 = ini_read_real("General-SL0","pfY",320)
		
		#region Party Data
		global.partyhp[0]._curr = ini_read_real("Party-SL0","HP0",1);
		global.partyhp[0]._max = ini_read_real("Party-SL0","MAXHP0",1);
		global.partyhp[1]._curr = ini_read_real("Party-SL0","HP1",1);
		global.partyhp[1]._max = ini_read_real("Party-SL0","MAXHP1",1);
		
		global.partylv[0] = ini_read_real("Party-SL0","Level0",1);		
		global.partylv[1] = ini_read_real("Party-SL0","Level1",1);
		
		global.money = ini_read_real("Party-SL0","Money",0);
		global.partynames[0] = ini_read_string("Party-SL0","Name0","ERROR");
		global.partynames[1] = ini_read_string("Party-SL0","Name1","error");
		global.partynames[2] = ini_read_string("Party-SL0","Name2","ERROR");
		#endregion
		
		#region World Data
		obj_gamehandler.ticks			= ini_read_real("World-SL0","SP",0)
		obj_gamehandler.minutes	 =ini_read_real("World-SL0","MN",0)
		obj_gamehandler.seconds    =ini_read_real("World-SL0","SC",0)
		obj_gamehandler.drawnminutes = ini_read_real("World-SL0","MN2",0)
		obj_gamehandler.drawnseconds = ini_read_real("World-SL0","SC2",0)
		#endregion
		#endregion
		#region Slot 1
		loadedroom							= ini_read_real("General-SL1","room",1)
		flag_set(global.flags,"plot",ini_read_real("General-SL1","plot",0));
		PLAYER.x									= ini_read_real("General-SL1","pX",320)
		PLAYER.y									= ini_read_real("General-SL1","pY",320)
		FOLLOWER.x							= ini_read_real("General-SL1","pfX",320)
		FOLLOWER.y							 = ini_read_real("General-SL1","pfY",320)
		
		#region Party Data
		global.partyhp[0]._curr = ini_read_real("Party-SL1","HP0",1);
		global.partyhp[0]._max = ini_read_real("Party-SL1","MAXHP0",1);
		global.partyhp[1]._curr = ini_read_real("Party-SL1","HP1",1);
		global.partyhp[1]._max = ini_read_real("Party-SL1","MAXHP1",1);
		
		global.partylv[0] = ini_read_real("Party-SL1","Level0",1);		
		global.partylv[1] = ini_read_real("Party-SL1","Level1",1);
		
		global.money = ini_read_real("Party-SL1","Money",0);
		global.partynames[0] = ini_read_string("Party-SL1","Name0","ERROR");
		global.partynames[1] = ini_read_string("Party-SL1","Name1","error");
		global.partynames[2] = ini_read_string("Party-SL1","Name2","ERROR");
		#endregion
		
		#region World Data
		obj_gamehandler.ticks			= ini_read_real("World-SL1","SP",0)
		obj_gamehandler.minutes	 =ini_read_real("World-SL1","MN",0)
		obj_gamehandler.seconds    =ini_read_real("World-SL1","SC",0)
		obj_gamehandler.drawnminutes = ini_read_real("World-SL1","MN2",0)
		obj_gamehandler.drawnseconds = ini_read_real("World-SL1","SC2",0)
		#endregion
		#endregion
		#region Slot 2
		loadedroom							= ini_read_real("General-SL2","room",1)
		flag_set(global.flags,"plot",ini_read_real("General-SL2","plot",0));
		PLAYER.x									= ini_read_real("General-SL2","pX",320)
		PLAYER.y									= ini_read_real("General-SL2","pY",320)
		FOLLOWER.x							= ini_read_real("General-SL2","pfX",320)
		FOLLOWER.y							 = ini_read_real("General-SL2","pfY",320)
		
		#region Party Data
		global.partyhp[0]._curr = ini_read_real("Party-SL2","HP0",1);
		global.partyhp[0]._max = ini_read_real("Party-SL2","MAXHP0",1);
		global.partyhp[1]._curr = ini_read_real("Party-SL2","HP1",1);
		global.partyhp[1]._max = ini_read_real("Party-SL2","MAXHP1",1);
		
		global.partylv[0] = ini_read_real("Party-SL2","Level0",1);		
		global.partylv[1] = ini_read_real("Party-SL2","Level1",1);
		
		global.money = ini_read_real("Party-SL2","Money",0);
		global.partynames[0] = ini_read_string("Party-SL2","Name0","ERROR");
		global.partynames[1] = ini_read_string("Party-SL2","Name1","error");
		global.partynames[2] = ini_read_string("Party-SL2","Name2","ERROR");
		#endregion
		
		#region World Data
		obj_gamehandler.ticks			= ini_read_real("World-SL2","SP",0)
		obj_gamehandler.minutes	 =ini_read_real("World-SL2","MN",0)
		obj_gamehandler.seconds    =ini_read_real("World-SL2","SC",0)
		obj_gamehandler.drawnminutes = ini_read_real("World-SL2","MN2",0)
		obj_gamehandler.drawnseconds = ini_read_real("World-SL2","SC2",0)
		#endregion
		#endregion
		ini_close();
		room_goto(loadedroom);
	}
}
	
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
#endregion