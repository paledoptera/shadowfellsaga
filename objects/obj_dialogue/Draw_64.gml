/// @description Text

if ran_creation_runcode = false
{
	ran_creation_runcode = true;
	_runcode[message_current]();
}

//Gui maximise
if(!obj_gamehandler.borderEnabled){
	display_set_gui_size(640,480);
}

//t is for modifiers
t++;

//Set Font
draw_set_font(font[message_current]);

//Set Colour
draw_set_colour(c_white);

//Read in array length
message_end = array_length_1d(message);

//If there are messages
if (message_end > 0)
{
    //Draw chat box
	textboxy = 380
	if pos = "bottom" {textboxy = 380}
	if pos = "dynamic" {if obj_ow_player.y > 240 textboxy = 100}
	if pos = "top" {textboxy = 100}
	
	font_correct(font[message_current]);
	
	cam = view_get_camera(ctrl_camera.camera);
	
	draw_sprite_ext(spr_textbox, boxtype==1 ? 1 : 0 , 640/2, textboxy,2,2,0,c_white,1);
	//Draw portrait
	if (portrait[message_current] != "none") {if portrait[message_current] = port_semi {port_scale_multi = 1.3}}
	if (portrait[message_current] != "none") draw_sprite_ext(portrait[message_current], facetimer, 52, textboxy-4,2*port_scale_multi,2*port_scale_multi,0,c_white,1);
	//Animating portrait
	if (cutoff != string_length(message[message_current]))
	{
		if (portrait[message_current] != "none")
		{
			var port_images = sprite_get_number(portrait[message_current])
			
			if portrait[message_current] = port_semi {port_speed = 0.18;}
			
			facetimer += port_speed;
			if facetimer > port_images facetimer = 0;
		}
	
	}
	else facetimer = 0;
    
    //This is for the effects
    var modifier = 0;
    //How many characters allowed in each line
    if (portrait[message_current] == "none") var lineEnd = 88;
    else var lineEnd = 52;
    //Variables for spacing characters
    var line = 0;
    var space = 0;
    var i = 1;
	
    //Delay time between printing each character
    var delay = txtdelay;
    
    //Text Position
    var tY = textboxy-50;
	
    //Change the horizontal position if there is a portrait
    if (portrait[message_current] == "none") var tX = 60;
    else var tX = 180;
    
    //If we are done printing out the current message
    if (cutoff == string_length(message[message_current]))
    {
        //draw blinking cursor
        timer++;
        if (timer < 15) draw_sprite_ext(spr_cursor, 0, 640-52, textboxy+100-44,2,2,0,c_white,1);
        if (timer > 30) timer = 0;
        
        //Check player input
        if (input)
        {
			facetimer = 1;
            //If we still have messages left, go to next message
            if (message_current < message_end-1)
            {
                message_current++;
                cutoff = 0;
				_runcode[message_current]();
            }
            //If we dont, make done = true and destroy this object
            else 
            {
                timer = 0;
				done=true;
            }
        }
    }
    //Typewriter
    //This is so we print each character one at a time
    if (cutoff < string_length(message[message_current]))
    {
        if (timer >= delay)
        {
			var pitch = 1;
			randomize();
			if talk_pitchbends = 1 {pitch = random_range(0.95,1.05);}
			
			if string_char_at(message[message_current], cutoff+1) != " " audio_play_sound(talksound[message_current], 10, false,0.75,0,pitch);
            cutoff++;
            timer = 0;
        }
        else timer++;
        
		
        //If player presses button, display the entire message.
        if (input && cutoff > 2)
        {
           cutoff = string_length(message[message_current]);
        }
    }
    
    //Text
    while(i <= string_length(message[message_current]) && i <= cutoff)
    {   
		///////////////////////////////
        //check for line break
		if (string_char_at(message[message_current], i) == "&")
        {
            line += 1;
			if (portrait[message_current] == "none") var tX = 60;
			else var tX = 180;
			if string_char_at(message[message_current], i) != "*" and font[message_current] != fnt_papyrus {space = 2;} else space = 0;
			++i;
        }
		//check for cutoff
		if string_char_at(message[message_current], i) = "~" {done = true; break;}
		///////////////////////////////
		//check for modifier
        if (string_char_at(message[message_current], i) == "\\")
        {
            modifier = real(string_char_at(message[message_current], ++i));
            ++i;
        }
		///////////////////////////////
		///////////////////////////////
		
        
        var length = 0;
        while (string_char_at(message[message_current], i) != " " && i <= string_length(message[message_current]))
        {
            i++;
            length++;
        }
        //Check if the current word fits inside the text box, and if not we go to the next line
		//If there's no * symbol on a new line, shift the letters forward 2 spaces.
        if (space+length > lineEnd)
        {
			if string_char_at(message[message_current], i) != "*" and font[message_current] != fnt_papyrus {space = 2;} else space = 0;
			line++;
			if (portrait[message_current] == "none") tX = 60;
			else tX = 180;
        }
        i -= length;
        
        //Accounting for character specific widths (ie "i", "l" etc)
		for(s=0; s<array_length(char_small); s++;)
		{
			if string_char_at(message[message_current], i-1) = char_small[s] {tX -= char_small_value} 
		}
		s = 0;
		for(s=0; s<array_length(char_big); s++;)
		{
			if string_char_at(message[message_current], i-1) = char_big[s] {tX += char_big_value} 
		}
		
		

		//Draw Text
        switch(modifier)
        {
            case 0: //normal
            {
                draw_set_colour(c_white);
				if(flag_get(global.flags,"world")==0){
					 draw_text_transformed(tX+(space*charWidth), tY+(26*line)+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0);
				} else if(flag_get(global.flags,"world")==1){
					 draw_text_transformed_shadow(tX+(space*charWidth), tY+(26*line)+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,c_white,1,font[message_current]);
				}
                break;
            }
            case 1: //shaky
            {
                draw_set_colour(c_white);
				if(flag_get(global.flags,"world")==0){
					draw_text(tX+(space*charWidth)+round(random_range(-2, 2)), tY+(26*line)+(line*charLineSep)+round(random_range(-2, 2)), string_hash_to_newline(string_char_at(message[message_current], i)));
				} else if(flag_get(global.flags,"world")==1){
					draw_text_transformed_shadow(tX+(space*charWidth)+round(random_range(-2, 2)), tY+(26*line)+(line*charLineSep)+round(random_range(-2, 2)), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,c_white,1,font[message_current]);
				}
                break;
            }
            case 2: //color
            {
                draw_set_colour(c_lime);
				if(flag_get(global.flags,"world")==0){
					 draw_text(tX+(space*charWidth), tY+(26*line)+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)));
				} else if(flag_get(global.flags,"world")==1){
					draw_text_transformed_shadow(tX+(space*charWidth), tY+(26*line)+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,c_lime,1,font[message_current]);
				}
                break;
            }
            case 3: //color and shake
            {
                draw_set_colour(c_red);
				if(flag_get(global.flags,"world")==0){
					draw_text(tX+(space*charWidth)+round(random_range(-2, 2)), tY+(26*line)+(line*charLineSep)+round(random_range(-2, 2)), string_hash_to_newline(string_char_at(message[message_current], i)));
				} else if(flag_get(global.flags,"world")==1){
					draw_text_transformed_shadow(tX+(space*charWidth)+round(random_range(-2, 2)), tY+(26*line)+(line*charLineSep)+round(random_range(-2, 2)), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,c_red,1,font[message_current]);
				}
                break;
            }
            case 4: //Sine movement
            {
                var so = t + i;
                var shift = sin(so*pi*freq/room_speed)*amplitude;
                draw_set_colour(c_white);
				if(flag_get(global.flags,"world")==0){
					 draw_text(tX+(space*charWidth), tY+(26*line)+shift+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)));
				} else if(flag_get(global.flags,"world")==1){
					 draw_text_transformed_shadow(tX+(space*charWidth), tY+(26*line)+shift+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,c_white,1,font[message_current]);
				}
                break;
            }
            case 5: //Gradient Text
            {
                draw_set_colour(make_colour_hsv(t+i, 255, 255));
				gradientcol=make_colour_hsv(t+i, 255, 255);
				if(flag_get(global.flags,"world")==0){
					draw_text(tX+(space*charWidth), tY+(26*line)+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)));
				} else if(flag_get(global.flags, "world")==1){
					draw_text_transformed_shadow(tX+(space*charWidth), tY+(26*line)+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,gradientcol,1,font[message_current]);
				}
                break;
            }
            case 6: //Gradient & Sine
            {
                draw_set_colour(make_colour_hsv(t+i, 255, 255));
				gradientcol=make_colour_hsv(t+i, 255, 255);
                var so = t + i;
                var shift = sin(so*pi*freq/room_speed)*amplitude;
				if(flag_get(global.flags, "world")==0){
					 draw_text(tX+(space*charWidth), tY+(26*line)+shift, string_hash_to_newline(string_char_at(message[message_current], i)));
				} else if(flag_get(global.flags, "world")==1){
					 draw_text_transformed_shadow(tX+(space*charWidth), tY+(26*line)+shift, string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,gradientcol,1,font[message_current]);
				}
                break;
            }
        }
        
        //Move to next character
        space++;
        i++;
    }
	
}
