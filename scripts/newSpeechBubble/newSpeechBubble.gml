function newSpeechBubble(_xx, _yy,_bl_scale_x,_bl_scale_y,_font,_text,_scale,_pos="top",_color,_text_xx,_text_yy){
/// Creates a speech bubble with the given parameters/arguments
/// @arg self_x
/// @arg self_y
/// @arg self_scale_x
/// @arg self_scale_y
/// @arg font
/// @arg text
/// @arg scale
/// @arg pos
/// @arg color
/// @arg text_x
/// @arg text_y
	instance_create_depth(_xx,_yy,-100,obj_speech_bubble);
	global.bubbleTextX = _xx;
	global.bubbleTextY = _yy;
	
	var _realFnt = fnt_main;
	var _voice = snd_txt;
	
	switch(_font){
		case "main":
			_realFnt = fnt_main;
			_voice = snd_txt;
		break;
		case "sans":
			_realFnt = fnt_sans;
			_voice = snd_txtsans;
		break;
		case "paps":
			_realFnt = fnt_papyrus;
			_voice = snd_txtpapyrus;
		break;
		case "semi":
			_realFnt = fnt_semi;
			_voice = snd_txtsemi;
		break;
	}
	
	var blcon = obj_speech_bubble;
	switch(_pos){
		case "top":
			blcon.image_index=7;
		break;
		case "left":
			blcon.image_index=5;
		break;
		case "bottom":
			blcon.image_index=8;
		break;
	}
	blcon.image_xscale=_bl_scale_x;
	blcon.image_yscale = _bl_scale_y;
	
	var dialog=-1;
	dialog = instance_create(0 , 0 , obj_dialogue_bubble);
				//FONT SPECIFIC CHARACTER PROPERTIES
		dialog.charWidth = 8;
		dialog.charLineSep = 0;
		if _realFnt = fnt_papyrus {dialog.charWidth = 12; dialog.charLineSep = 5;}
		//if _realFnt = fnt_semi {dialog.charWidth = 12;}
	
		//FONT SPECIFIC CHARACTER ADJUSTMENTS
		dialog.char_big_value = 0;
		dialog.char_small_value = 0;
	
		//if _realFnt = fnt_papyrus {dialog.char_small_value = 8; dialog.char_big_value = 4;}
		if _realFnt = fnt_sans {dialog.char_small_value = 8;}
	
		for(var i=0; i<array_length_1d(_text); i++){
			dialog.message[i] = _text[i];
		}
		
		dialog.portrait=-1;
		dialog.font = _realFnt;
		dialog.talksound = _voice;
		dialog.txtdelay = 0;
		dialog.textScale=_scale;
		dialog.trueColor = _color;
		dialog.textX = _text_xx;
		dialog.textY = _text_yy;
	
}