/// @description Text

//Gui maximise
if(!ctrl_global.borderEnabled){
	display_set_gui_size(640,480);
}

//t is for modifiers
t++;

//Set Font
draw_set_font(font);

//Set Colour
draw_set_colour(c_white);

//Read in array length
message_end = array_length_1d(message);

//If there are messages
if (message_end > 0)
{
    //Draw chat box
	textboxy = 600;
	if pos = "paps" {textboxy = 460 }
	if pos = "sans" {textboxy = 500 }
	
	cam = view_get_camera(ctrl_battlecamera.camera);
	
    //This is for the effects
    var modifier = 0;
    //How many characters allowed in each line
    if (portrait == "none") var lineEnd = 88;
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
    if (portrait == "none") var tX = 60;
    else var tX = 180;
    
    //If we are done printing out the current message
    if (cutoff == string_length(message[message_current]))
    {
        ////Check player input
        //if (input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action))
        //{
		//	facetimer = 1;
        //    //If we still have messages left, go to next message
        //    if (message_current < message_end-1)
        //    {
        //        message_current++;
        //        cutoff = 0;
        //    }
        //    //If we dont, make done = true and destroy this object
        //    else 
        //    {
        //        timer = 0;
		//		done=true;
        //    }
        //}
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
			
			if string_char_at(message[message_current], cutoff+1) != " " audio_play_sound(talksound, 10, false,0.75,0,pitch);
            cutoff++;
            timer = 0;
        }
        else timer++;
        
		
        //If player presses button, display the entire message.
        if (input_key_pressed(global.key_action)||input_gp_button_pressed(global.gp_device,global.gp_action) && cutoff > 2)
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
			if (portrait == "none") var tX = 60;
			else var tX = 180;
			if string_char_at(message[message_current], i) != "*" and font != fnt_papyrus {space = 2;} else space = 0;
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
			if string_char_at(message[message_current], i) != "*" and font != fnt_papyrus {space = 2;} else space = 0;
			line++;
			if (portrait == "none") tX = 60;
			else tX = 180;
        }
        i -= length;
        
        //Accounting for character specific widths (ie "i", "l" etc)
		
		if font = fnt_papyrus {char_big[0] = "O"; char_big[1] = "A"; char_big[2] = "B"; char_big[3] = "Q"; char_big[4] = "W"; char_big[5] = "G"; char_big[6] = "M";
							   char_small[0] = "I"; char_small[1] = "'"; char_small[2] = "P"; char_small[3] = "L"; char_small[4] = "'"}
		else {char_small[0] = "_"; char_big[0] = "_";}
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
					 draw_text_transformed_shadow(tX+(space*charWidth), tY+(26*line)+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,c_white,1,font);
				}
                break;
            }
            case 1: //shaky
            {
                draw_set_colour(c_white);
				if(flag_get(global.flags,"world")==0){
					draw_text(tX+(space*charWidth)+round(random_range(-2, 2)), tY+(26*line)+(line*charLineSep)+round(random_range(-2, 2)), string_hash_to_newline(string_char_at(message[message_current], i)));
				} else if(flag_get(global.flags,"world")==1){
					draw_text_transformed_shadow(tX+(space*charWidth)+round(random_range(-2, 2)), tY+(26*line)+(line*charLineSep)+round(random_range(-2, 2)), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,c_white,1,font);
				}
                break;
            }
            case 2: //color
            {
                draw_set_colour(c_lime);
				if(flag_get(global.flags,"world")==0){
					 draw_text(tX+(space*charWidth), tY+(26*line)+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)));
				} else if(flag_get(global.flags,"world")==1){
					draw_text_transformed_shadow(tX+(space*charWidth), tY+(26*line)+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,c_lime,1,font);
				}
                break;
            }
            case 3: //color and shake
            {
                draw_set_colour(c_red);
				if(flag_get(global.flags,"world")==0){
					draw_text(tX+(space*charWidth)+round(random_range(-2, 2)), tY+(26*line)+(line*charLineSep)+round(random_range(-2, 2)), string_hash_to_newline(string_char_at(message[message_current], i)));
				} else if(flag_get(global.flags,"world")==1){
					draw_text_transformed_shadow(tX+(space*charWidth)+round(random_range(-2, 2)), tY+(26*line)+(line*charLineSep)+round(random_range(-2, 2)), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,c_red,1,font);
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
					 draw_text_transformed_shadow(tX+(space*charWidth), tY+(26*line)+shift+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,c_white,1,font);
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
					draw_text_transformed_shadow(tX+(space*charWidth), tY+(26*line)+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,gradientcol,1,font);
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
					 draw_text_transformed_shadow(tX+(space*charWidth), tY+(26*line)+shift, string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,gradientcol,1,font);
				}
                break;
            }
        }
        
        //Move to next character
        space++;
        i++;
    }
}
