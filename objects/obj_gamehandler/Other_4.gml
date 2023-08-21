if(room!=STAGE_BATTLE){
	global.currentroom=room;	
}
check_world_type(); 
party_get_room_name(global.currentroom);

//ini_open("sfsaga.ini");
//PLAYER.x									= ini_read_real("General","pX",320)
//PLAYER.y									= ini_read_real("General","pY",320)
//FOLLOWER.x							= ini_read_real("General","pfX",320)
//FOLLOWER.y							= ini_read_real("General","pfY",320)
//ini_close();