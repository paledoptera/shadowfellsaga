// Ran in obj_savemenu
// Handles copying of saved data, specifically core information stored in sfsaga.ini
function copy_general(src,slot){
	ini_open("sfsaga.ini");
	switch(slot){
		case 0:
					ini_write_real("General-SL0","room",ini_read_real("General-SL"+string(src),"room",0));
					ini_write_real("General-SL0","plot",ini_read_real("General-SL"+string(src),"plot",0));
					ini_write_real("General-SL0","pX",ini_read_real("General-SL"+string(src),"pX",320));
					ini_write_real("General-SL0","pY",ini_read_real("General-SL"+string(src),"pY",320));
					ini_write_real("General-SL0", "pDir",ini_read_string("General-SL"+string(src), "pDir", "down"))
					ini_write_real("General-SL0","pfX",ini_read_real("General-SL"+string(src),"pfX",320));
					ini_write_real("General-SL0","pfY",ini_read_real("General-SL"+string(src),"pfX",320));
					ini_write_real("Party-SL0","HP0",ini_read_real("Party-SL"+string(src),"HP0",0)) // Papyrus
					ini_write_real("Party-SL0","MAXHP0",ini_read_real("Party-SL"+string(src),"MAXHP0",0))
					ini_write_real("Party-SL0","HP1",ini_read_real("Party-SL"+string(src),"HP1",0)) // Sans
					ini_write_real("Party-SL0","MAXHP1",ini_read_real("Party-SL"+string(src),"MAXHP1",1))
					ini_write_real("Party-SL0", "Level0",ini_read_real("Party-SL"+string(src),"Level0",0))  // Papyrus level
					ini_write_real("Party-SL0", "Level1",ini_read_real("Party-SL"+string(src),"Level1",0)) // Sans level
					ini_write_real("Party-SL0", "Money",ini_read_real("Party-SL"+string(src),"Money",0))
					ini_write_string("Party-SL0", "Name0",ini_read_string("Party-SL"+string(src),"Name0","ERROR")) 
					ini_write_string("Party-SL0", "Name1",ini_read_string("Party-SL"+string(src),"Name1","error")) 
					ini_write_string("Party-SL0", "Name2",ini_read_string("Party-SL"+string(src),"Name2","error")) 
					ini_write_string("World-SL0", "roomname",ini_read_string("World-SL"+string(src),"roomname","room"));
					ini_write_real("World-SL0","SP",ini_read_real("World-SL"+string(src),"SP",0))	
					ini_write_real("World-SL0","MN",ini_read_real("World-SL"+string(src),"MN",0))
					ini_write_real("World-SL0","SC",ini_read_real("World-SL"+string(src),"SC",0))
					ini_write_real("World-SL0","MN2",ini_read_real("World-SL"+string(src),"MN2",0))
					ini_write_real("World-SL0","SC2",ini_read_real("World-SL"+string(src),"SC2",0))
		break;
		case 1:
					ini_write_real("General-SL1","room",ini_read_real("General-SL"+string(src),"room",0));
					ini_write_real("General-SL1","plot",ini_read_real("General-SL"+string(src),"plot",0));
					ini_write_real("General-SL1","pX",ini_read_real("General-SL"+string(src),"pX",320));
					ini_write_real("General-SL1","pY",ini_read_real("General-SL"+string(src),"pY",320));
					ini_write_real("General-SL1", "pDir",ini_read_string("General-SL"+string(src), "pDir", "down"))
					ini_write_real("General-SL1","pfX",ini_read_real("General-SL"+string(src),"pfX",320));
					ini_write_real("General-SL1","pfY",ini_read_real("General-SL"+string(src),"pfX",320));
					ini_write_real("Party-SL1","HP0",ini_read_real("Party-SL"+string(src),"HP0",0)) // Papyrus
					ini_write_real("Party-SL1","MAXHP0",ini_read_real("Party-SL"+string(src),"MAXHP0",0))
					ini_write_real("Party-SL1","HP1",ini_read_real("Party-SL"+string(src),"HP1",0)) // Sans
					ini_write_real("Party-SL1","MAXHP1",ini_read_real("Party-SL"+string(src),"MAXHP1",1))
					ini_write_real("Party-SL1", "Level0",ini_read_real("Party-SL"+string(src),"Level0",0))  // Papyrus level
					ini_write_real("Party-SL1", "Level1",ini_read_real("Party-SL"+string(src),"Level1",0)) // Sans level
					ini_write_real("Party-SL1", "Money",ini_read_real("Party-SL"+string(src),"Money",0))
					ini_write_string("Party-SL1", "Name0",ini_read_string("Party-SL"+string(src),"Name0","ERROR")) 
					ini_write_string("Party-SL1", "Name1",ini_read_string("Party-SL"+string(src),"Name1","error")) 
					ini_write_string("Party-SL1", "Name2",ini_read_string("Party-SL"+string(src),"Name2","error")) 
					ini_write_string("World-SL1", "roomname",ini_read_string("World-SL"+string(src),"roomname","room"));
					ini_write_real("World-SL1","SP",ini_read_real("World-SL"+string(src),"SP",0))	
					ini_write_real("World-SL1","MN",ini_read_real("World-SL"+string(src),"MN",0))
					ini_write_real("World-SL1","SC",ini_read_real("World-SL"+string(src),"SC",0))
					ini_write_real("World-SL1","MN2",ini_read_real("World-SL"+string(src),"MN2",0))
					ini_write_real("World-SL1","SC2",ini_read_real("World-SL"+string(src),"SC2",0))
		break;
		case 2:
					ini_write_real("General-SL2","room",ini_read_real("General-SL"+string(src),"room",0));
					ini_write_real("General-SL2","plot",ini_read_real("General-SL"+string(src),"plot",0));
					ini_write_real("General-SL2","pX",ini_read_real("General-SL"+string(src),"pX",320));
					ini_write_real("General-SL2","pY",ini_read_real("General-SL"+string(src),"pY",320));
					ini_write_real("General-SL2", "pDir",ini_read_string("General-SL"+string(src), "pDir", "down"))
					ini_write_real("General-SL2","pfX",ini_read_real("General-SL"+string(src),"pfX",320));
					ini_write_real("General-SL2","pfY",ini_read_real("General-SL"+string(src),"pfX",320));
					ini_write_real("Party-SL2","HP0",ini_read_real("Party-SL"+string(src),"HP0",0)) // Papyrus
					ini_write_real("Party-SL2","MAXHP0",ini_read_real("Party-SL"+string(src),"MAXHP0",0))
					ini_write_real("Party-SL2","HP1",ini_read_real("Party-SL"+string(src),"HP1",0)) // Sans
					ini_write_real("Party-SL2","MAXHP1",ini_read_real("Party-SL"+string(src),"MAXHP1",1))
					ini_write_real("Party-SL2", "Level0",ini_read_real("Party-SL"+string(src),"Level0",0))  // Papyrus level
					ini_write_real("Party-SL2", "Level1",ini_read_real("Party-SL"+string(src),"Level1",0)) // Sans level
					ini_write_real("Party-SL2", "Money",ini_read_real("Party-SL"+string(src),"Money",0))
					ini_write_string("Party-SL2", "Name0",ini_read_string("Party-SL"+string(src),"Name0","ERROR")) 
					ini_write_string("Party-SL2", "Name1",ini_read_string("Party-SL"+string(src),"Name1","error")) 
					ini_write_string("Party-SL2", "Name2",ini_read_string("Party-SL"+string(src),"Name2","error")) 
					ini_write_string("World-SL2", "roomname",ini_read_string("World-SL"+string(src),"roomname","room"));
					ini_write_real("World-SL2","SP",ini_read_real("World-SL"+string(src),"SP",0))	
					ini_write_real("World-SL2","MN",ini_read_real("World-SL"+string(src),"MN",0))
					ini_write_real("World-SL2","SC",ini_read_real("World-SL"+string(src),"SC",0))
					ini_write_real("World-SL2","MN2",ini_read_real("World-SL"+string(src),"MN2",0))
					ini_write_real("World-SL2","SC2",ini_read_real("World-SL"+string(src),"SC2",0))
		break;
	}
	ini_close();
}