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
					ini_write_real("General-SL0","pDir",PLAYER.direction);
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
					ini_write_string("General-SL1","pDir",PLAYER.direction);
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
						ini_write_string("General-SL2","pDir",PLAYER.direction);
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