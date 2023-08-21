/// @description newChat(messageArray, Portrait, Font, Talksound, Speed, TxtboxPosition);
/// @param messageArray
/// @param  Portrait
/// @param  Font
/// @param  Talksound
/// @param  Speed
/// @param  TxtboxPosition
/// @param Character
function newChat_alt(argument0, argument1, argument2 = fnt_main, argument3 = snd_txt, argument4 = 1, argument5 = "dynamic", argument6) {
	var sent = argument0;
	var portrait = argument1;
	var text = instance_create(0, 0, argument6);

	text.portrait = "none";
	text.font = argument2;
	text.talksound = argument3;
	text.txtdelay = argument4;
	text.pos = argument5;

	
	//FONT SPECIFIC CHARACTER PROPERTIES
	text.charWidth = 16;
	text.charLineSep = 8;
	if argument2 = fnt_papyrus {text.charWidth = 23; text.charLineSep = 10;}
	if argument2 = fnt_semi {text.charWidth = 20;}
	
	//FONT SPECIFIC CHARACTER ADJUSTMENTS
	text.char_big_value = 0;
	text.char_small_value = 0;
	if argument2 = fnt_papyrus {text.char_small_value = 8; text.char_big_value = 4;}
	if argument2 = fnt_sans {text.char_small_value = 8;}
	

	

	for (i = 0; i < array_length_1d(sent); i++)
	{
	    text.message[i] = sent[i];
	}



}
