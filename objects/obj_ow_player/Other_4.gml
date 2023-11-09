ini_open("sfsaga.ini");
if(global.loaded){
	switch(global.filechoice){
	case 0:
	x						= ini_read_real("General-SL0","pX",320)
	y						= ini_read_real("General-SL0","pY",320)
	direction		= ini_read_real("General-SL0","pDir",90);
	global.filechoice=-1;
	break;
	case 1:
	x						= ini_read_real("General-SL1","pX",320)
	y						= ini_read_real("General-SL1","pY",320)
	direction		= ini_read_real("General-SL1","pDir",90);
	global.filechoice=-1;
	break;
	case 2:
	x						= ini_read_real("General-SL2","pX",320)
	y						= ini_read_real("General-SL2","pY",320)
	direction		= ini_read_real("General-SL2","pDir",90);
	global.filechoice=-1;
	break;
	}
}
ini_close();

instance_create(x,y,ctrl_camera);
//instance_create(x,y,obj_interact);
//instance_create(0,0,ctrl_debug);

if room != LW_skelekitchen and room != DW_wildcliffs1 
{
	instance_create(x,y,obj_ow_p_follower);
}