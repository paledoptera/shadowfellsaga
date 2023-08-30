ini_open("sfsaga.ini");
if(global.loaded){
	switch(global.filechoice){
	case 0:
	PLAYER.x						= ini_read_real("General-SL0","pX",320)
	PLAYER.y						= ini_read_real("General-SL0","pY",320)
	PLAYER.direction		= ini_read_real("General-SL0","pDir",90);
	global.filechoice=-1;
	break;
	case 1:
	PLAYER.x						= ini_read_real("General-SL1","pX",320)
	PLAYER.y						= ini_read_real("General-SL1","pY",320)
	PLAYER.direction		= ini_read_real("General-SL1","pDir",90);
	global.filechoice=-1;
	break;
	case 2:
	PLAYER.x						= ini_read_real("General-SL2","pX",320)
	PLAYER.y						= ini_read_real("General-SL2","pY",320)
	PLAYER.direction		= ini_read_real("General-SL2","pDir",90);
	global.filechoice=-1;
	break;
	}
}
ini_close();