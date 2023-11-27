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
		PLAYER.direction								= ini_read_real("General-SL0", "pDir", 90)
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
		ctrl_global.ticks			= ini_read_real("World-SL0","SP",0)
		ctrl_global.minutes	 =ini_read_real("World-SL0","MN",0)
		ctrl_global.seconds    =ini_read_real("World-SL0","SC",0)
		ctrl_global.drawnminutes = ini_read_real("World-SL0","MN2",0)
		ctrl_global.drawnseconds = ini_read_real("World-SL0","SC2",0)
		#endregion
		#endregion
		#region Slot 1
		loadedroom							= ini_read_real("General-SL1","room",1)
		flag_set(global.flags,"plot",ini_read_real("General-SL1","plot",0));
		PLAYER.x									= ini_read_real("General-SL1","pX",320)
		PLAYER.y									= ini_read_real("General-SL1","pY",320)
		PLAYER.direction					= ini_read_real("General-SL1", "pDir", 90)
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
		ctrl_global.ticks			= ini_read_real("World-SL1","SP",0)
		ctrl_global.minutes	 =ini_read_real("World-SL1","MN",0)
		ctrl_global.seconds    =ini_read_real("World-SL1","SC",0)
		ctrl_global.drawnminutes = ini_read_real("World-SL1","MN2",0)
		ctrl_global.drawnseconds = ini_read_real("World-SL1","SC2",0)
		#endregion
		#endregion
		#region Slot 2
		loadedroom							= ini_read_real("General-SL2","room",1)
		flag_set(global.flags,"plot",ini_read_real("General-SL2","plot",0));
		PLAYER.x									= ini_read_real("General-SL2","pX",320)
		PLAYER.y									= ini_read_real("General-SL2","pY",320)
		PLAYER.direction								= ini_read_real("General-SL2", "pDir", 90)
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
		ctrl_global.ticks			= ini_read_real("World-SL2","SP",0)
		ctrl_global.minutes	 =ini_read_real("World-SL2","MN",0)
		ctrl_global.seconds    =ini_read_real("World-SL2","SC",0)
		ctrl_global.drawnminutes = ini_read_real("World-SL2","MN2",0)
		ctrl_global.drawnseconds = ini_read_real("World-SL2","SC2",0)
		#endregion
		#endregion
		ini_close();
		room_goto(loadedroom);
	}
}