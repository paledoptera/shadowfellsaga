///@description font_correct
///@arg font_array
function font_correct(){
	//FONT SPECIFIC - Character sizes/Line seperation
	charWidth = 16;
	charLineSep = 8;
	if argument0 = fnt_papyrus {charWidth = 23; charLineSep = 10;}
	if argument0 = fnt_semi {charWidth = 20;}
	
	//FONT SPECIFIC - Character Adjustment values
	char_big_value = 0;
	char_small_value = 0;
	if argument0 = fnt_papyrus {char_small_value = 8; char_big_value = 4;}
	if argument0 = fnt_sans {char_small_value = 8;}
	
	//FONT SPECIFIC - Establishing which characters are larger than normal, which are smaller
	if font[message_current] = fnt_papyrus {char_big[0] = "O"; char_big[1] = "A"; char_big[2] = "B"; char_big[3] = "Q"; char_big[4] = "W"; char_big[5] = "G"; char_big[6] = "M"; char_big[7] = "L"; char_big[8] = "S";
						   char_small[0] = "I"; char_small[1] = "'"; char_small[2] = "P"; char_small[3] = "L"; char_small[4] = "'";  char_small[5] = "!"; char_small[6] = ".";}
	else {char_small[0] = "_"; char_big[0] = "_";}
}