/// @description newChat(messageStruct);
/// @param messageStruct
function newChat(argument0) {
	
	
	if struct_exists(argument0[0],"talkspeed") {var _txtdelay = argument0[0].talkspeed;}
	else {var _txtdelay = 1;}
	if struct_exists(argument0[0],"position") {var _pos = argument0[0].position;}
	else {var _pos = "dynamic";}
	
	var text = instance_create(0, 0, obj_dialogue);	
	text.txtdelay = _txtdelay;
	text.pos = _pos;
	
	var _char = -1;
	
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
		
		// if CHAR is CHEF PAPYRUS
		if _char = "chefp"
		{
			text.font[i] = fnt_papyrus;
			text.talksound[i] = snd_txtpapyrus;
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
		#endregion
		
		if struct_exists(argument0[i],"runcode") {text._runcode[i] = argument0[i].runcode;} else {text._runcode[i] = function () {var doodoofart = 1; /*do nothing*/}}
		
	    text.message[i] = argument0[i].line
	}



}