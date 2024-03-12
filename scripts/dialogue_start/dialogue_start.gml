
function dialogue_start(argument0) {
	/// @description dialogue_start(messageStruct);
	/// @param messageStruct
	// ----------------------ATTENTION------------------------------
	// HERE IS A LIST OF PARAMETERS THAT YOU CAN CHANGE IN A MESSAGE
	// -------------------------------------------------------------
	// - talkspeed
	//	   (defaults to 1, aka 1 character every frame.)
	//	   (if you want quicker speech, put the talkspeed to a lower value. ex: talkspeed = 0.5)
	//     (if you want slower speech, put the talkspeed to a higher value. ex: talkspeed = 3)
	// - char 
	//     (defaults to "noone")
	//		options:
	//			- "chefp"
	//			- "sans"
	//			- "papy"
	//			- "toquelle"
	// - talksound
	// - font
	// - position
	//     (defaults to "dynamic")
	//		options:
	//			- "bottom"
	//			- "dynamic"
	//			- "top"
	// - color1 & color2
	//     (defaults to c_yellow and c_red)

	var text = instance_create(0, 0, ctrl_dialogue);	
	
	var _char = -1;
	var _pos = "dynamic";
	for (i = 0; i < array_length(argument0); i++)
	{
		#region DEFINING CHARACTERS
		//making sure that char is defined
		if !struct_exists(argument0[i],"char")
		{
			d = i;
			while (d > 1)
			{
				d -= 1;
				if struct_exists(argument0[d],"char") {_char = argument0[d].char; break;}
			}
		}
		else _char = argument0[i].char	
		//making sure that position is defined
		if !struct_exists(argument0[i],"position") 
		{
			d = i;
			while (d > 1)
			{
				d -= 1;
				if struct_exists(argument0[d],"position") {_pos = argument0[d].position; break;}
			}
		}
		else _pos = argument0[i].position	
		//////////////////////////////////////////
		//////////////////////////////////////////
		//////////////////////////////////////////
		// if CHAR is NOONE
		if _char = "noone"
		{
			text.font[i] = fnt_main_sm
			text.talksound[i] = snd_txt
			text.char[i] = "noone"
			if !struct_exists(argument0[i],"port") {text.portrait[i] = "none";}
		}
		// if CHAR is CHEF PAPYRUS
		if _char = "chefp"
		{
			text.font[i] = fnt_papyrus;
			text.talksound[i] = snd_txtpapyrus;
			text.char[i] = "chefp"
			if !struct_exists(argument0[i],"port") {text.portrait[i] = port_chefp;}
			else if argument0[i].port = "confident" {text.portrait[i] = port_chefp_confident;}
			else if argument0[i].port = "confident2" {text.portrait[i] = port_chefp_confident2;}
			else if argument0[i].port = "displeased" {text.portrait[i] = port_chefp_displeased;}
			else if argument0[i].port = "nervous" {text.portrait[i] = port_chefp_nervous;}
			else if argument0[i].port = "shock" {text.portrait[i] = port_chefp_shock;}
			else if argument0[i].port = "shock_lookleft" {text.portrait[i] = port_chefp_shock_lookleft;}
			else if argument0[i].port = "sly" {text.portrait[i] = port_chefp_sly;}
			else if argument0[i].port = "trousle" {text.portrait[i] = port_chefp_trousle;}
			else if argument0[i].port = "wacky" {text.portrait[i] = port_chefp_wacky;}
		}
		// if CHAR is SANS
		else if _char = "sans"
		{
			text.font[i] = fnt_sans;
			text.talksound[i] = snd_txtsans;
			text.char[i] = "sans"
			if !struct_exists(argument0[i],"port") {text.portrait[i] = port_sans;}
			else if argument0[i].port = "blankeyes" {text.portrait[i] = port_sans_blankeyes;}
			else if argument0[i].port = "closedeyes" {text.portrait[i] = port_sans_closedeyes;}
			else if argument0[i].port = "joking" {text.portrait[i] = port_sans_joking;}
			else if argument0[i].port = "joking_alt" {text.portrait[i] = port_sans_joking_alt;}
			else if argument0[i].port = "lookleft" {text.portrait[i] = port_sans_lookleft;}
			else if argument0[i].port = "lookup" {text.portrait[i] = port_sans_lookup;}
			else if argument0[i].port = "wary" {text.portrait[i] = port_sans_wary;}
			else if argument0[i].port = "wink" {text.portrait[i] = port_sans_wink;}
		}
		else if _char = "papy"
		{
			text.font[i] = fnt_papyrus;
			text.talksound[i] = snd_txtpapyrus;
			text.char[i] = "papy"
			if !struct_exists(argument0[i],"port") {text.portrait[i] = port_papy;}
			else if argument0[i].port = "goofycry" {text.portrait[i] = port_papy_goofycry;}
			else if argument0[i].port = "confident" {text.portrait[i] = port_papy_confident;}
			else if argument0[i].port = "displeased" {text.portrait[i] = port_papy_displeased;}
			else if argument0[i].port = "nervous" {text.portrait[i] = port_papy_nervous;}
			else if argument0[i].port = "sly" {text.portrait[i] = port_papy_sly;}
			else if argument0[i].port = "wacky" {text.portrait[i] = port_papy_wacky;}
		}
		else if _char = "papy_messedup"
		{
			text.font[i] = fnt_papyrus;
			text.talksound[i] = snd_txtpapyrus;
			text.char[i] = "papy_messedup"
			if !struct_exists(argument0[i],"port") {text.portrait[i] = port_papy_messedup;}
			else if argument0[i].port = "displeased" {text.portrait[i] = port_papy_messedup_displeased;}
			else if argument0[i].port = "happy" {text.portrait[i] = port_papy_messedup_happy;}
			else if argument0[i].port = "sly" {text.portrait[i] = port_papy_messedup_sly;}
			else if argument0[i].port = "goofycry" {text.portrait[i] = port_papy_messedup_goofycry;}	
		}
		else if _char = "toquelle"
		{
			text.font[i] = fnt_main;
			text.talksound[i] = snd_txttoquelle;
			text.char[i] = "toquelle"
			if !struct_exists(argument0[i],"port") {text.portrait[i] = "none";}
		}
		
		#endregion
		if struct_exists(argument0[i],"talkspeed") {text.txtdelay[i] = argument0[i].talkspeed;} else {text.txtdelay[i] = 1;}
		if struct_exists(argument0[i],"interrupted") {text.interrupted[i] = argument0[i].interrupted;} else {text.interrupted[i] = false;}
		if struct_exists(argument0[i],"talksound") {text.talksound[i] = argument0[i].talksound;}
		if struct_exists(argument0[i],"color1") {text.color1[i] = argument0[i].color1;} else {text.color1[i] = c_yellow;}
		if struct_exists(argument0[i],"color2") {text.color2[i] = argument0[i].color2;} else {text.color2[i] = c_red;}
	    text.pos[i] = _pos
		text.message[i] = argument0[i].line
	}



}