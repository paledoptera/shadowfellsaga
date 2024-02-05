/// @description newChat(messageArray, Speed, TxtboxPosition);
/// @param messageArray
/// @param  Speed
/// @param  TxtboxPosition
function newChat_old(argument0, argument1 = 1, argument2 = "dynamic") {
	var text = instance_create(0, 0, ctrl_dialogue);
	text.txtdelay = argument1;
	text.pos = argument2;

	for (i = 0; i < array_height_2d(argument0); i++)
	{
	    text.message[i] = argument0[i,0];
		text.portrait[i] = argument0[i,1];
		text.font[i] = argument0[i,2];
		text.talksound[i] = argument0[i,3];
	}



}
