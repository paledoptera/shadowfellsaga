/// @description Text
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
	if pos[message_current] = "bottom" {textboxy = 380}
	if pos[message_current] = "dynamic" {if obj_ow_player.y > 240 textboxy = 100}
	if pos[message_current] = "top" {textboxy = 100}
	
	font_correct(font[message_current]);
	
	draw_sprite_ext(style, 0, 640/2, textboxy,2,2,0,c_white,1);
	//Draw portrait
	if (portrait[message_current] != "none") {if portrait[message_current] = port_semi {port_scale_multi = 1.3}}
	if (portrait[message_current] != "none") draw_sprite_ext(portrait[message_current], floor(facetimer), 52, textboxy-4,2*port_scale_multi,2*port_scale_multi,0,c_white,1);
	//Animating portrait
	if (cutoff != string_length(message[message_current]))
	{
		if (portrait[message_current] != "none")
		{
			var port_images = sprite_get_number(portrait[message_current])

			facetimer += port_speed;
			if facetimer > port_images facetimer = 0;
		}
		if delay = 10 {facetimer = 1.9;}
	}
	else facetimer = 1;
    
    //This is for the effects
    var modifier = 0;
    //How many characters allowed in each line
    if (portrait[message_current] == "none") var lineEnd = 88;
    else var lineEnd = 52;
    //Variables for spacing characters
    var line = 0;
	var lastline = line;
    var space = 0;
    var i = 1;
	
    //Delay time between printing each character
	if delay = 0 {delay = txtdelay[message_current];}
    
    //Text Position
    var tY = textboxy-50;
	
    //Change the horizontal position if there is a portrait
    if (portrait[message_current] == "none") var tX = 60;
    else var tX = 180;
    
    //If we are done printing out the current message
	if cutoff > string_length(message[message_current]) {cutoff = string_length(message[message_current])}
    if (cutoff == string_length(message[message_current])) 
    {
        //draw blinking cursor
        timer++;
        if (timer < 15) draw_sprite_ext(spr_cursor, 0, 640-52, textboxy+100-44,2,2,0,c_white,1);
        if (timer > 30) timer = 0;
    
        //Check player input
		if (_input) or interrupted[message_current] = true
		{
			facetimer = 1;
			//If we still have messages left, go to next message
			if (message_current < message_end-1)
			{
				message_current++;
				cutoff = 0;
			}
			//If we dont, make done = true and destroy this object
			else 
			{
				timer = 0;
				done=true;
			}
			//registering the pause
			if message[message_current] = "^" and instance_exists(CS)
			{
				CS.stored_dialogue_start = message_current+1;
				timer = 0;
				done=true;
			}
		}
	}
    //Typewriter
    //This is so we print each character one at a time
    if (cutoff < string_length(message[message_current]))
    {
		//randomizing pitch of talksound
		var pitch = 1;
		randomize();
		if talk_pitchbends = 1 {pitch = random_range(0.95,1.05);}
		
		if (timer >= delay)
		{
			if string_char_at(message[message_current], cutoff+1) != " " audio_play_sound(talksound[message_current], 10, false,0.75,0,pitch);
			cutoff++;
			if timer >= (delay*2) {cutoff++;}
			if timer >= (delay*3) {cutoff++;}
			if timer >= (delay*4) {cutoff++;}
			if timer >= (delay*5) {cutoff++;}
			timer = 0;
		}
		else timer++;

        //If player presses button, display the entire message.
        if (_input && cutoff > 3 && delay != 10 && interrupted[message_current] = false)
        {
			if string_count("|",message[message_current]) > 0
			{
				for (d=cutoff;d<string_length(message[message_current]);d++)
				{
					if (string_char_at(message[message_current], d) == "|")
					{
						cutoff = d;
						break;
					}
				}
			}
			else cutoff = string_length(message[message_current]);
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
		///////////////////////////////
		//check for modifier
        if (string_char_at(message[message_current], i) == "#")
        {
            modifier = real(string_char_at(message[message_current], ++i));
            ++i;
        }
		///////////////////////////////
		//check for dialogue pause
		///////////////////////////////
		if (string_char_at(message[message_current], i) == "|")
        {
			delay = 10;
			++i;
		}
		else
		{delay = txtdelay[message_current];}
		///////////////////////////////
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
		if i>1
		{
			for(s=0; s<array_length(char_small); s++;)
			{
				if string_char_at(message[message_current], i-1) = char_small[s] {tX -= char_small_value; break;} 
			}
			s = 0;
			for(s=0; s<array_length(char_big); s++;)
			{
				if string_char_at(message[message_current], i-1) = char_big[s] {tX += char_big_value; break;} 
			}
		}
		
		

		//Draw Text
		draw_set_colour(c_white);
		
		switch(modifier)
        {

            case 0: //normal
            {
				draw_text_transformed_shadow(tX+(space*charWidth), tY+(26*line)+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,c_white,1,font[message_current]);
                break;
            }
            case 1: //shaky
            {
				draw_text_transformed_shadow(tX+(space*charWidth)+round(random_range(-2, 2)), tY+(26*line)+(line*charLineSep)+round(random_range(-2, 2)), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,c_white,1,font[message_current]);
                break;
            }
            case 2: //color
            {
				draw_text_transformed_shadow(tX+(space*charWidth), tY+(26*line)+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,color1[message_current],1,font[message_current]);
                break;
            }
            case 3: //color and shake
            {
				draw_text_transformed_shadow(tX+(space*charWidth)+round(random_range(-2, 2)), tY+(26*line)+(line*charLineSep)+round(random_range(-2, 2)), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,color1[message_current],1,font[message_current]);
                break;
            }
            case 4: //Sine movement
            {
                var so = t + i;
                var shift = sin(so*pi*freq/room_speed)*amplitude;
				draw_text_transformed_shadow(tX+(space*charWidth), tY+(26*line)+shift+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,c_white,1,font[message_current]);
                break;
            }
            case 5: //Gradient Text
            {
				draw_text_transformed_gradient_shadow(tX+(space*charWidth), tY+(26*line)+(line*charLineSep), string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,color1[message_current],color1[message_current],color2[message_current],color2[message_current],1,font[message_current]);
                break;
            }
            case 6: //Gradient & Sine
            {
                var so = t + i;
                var shift = sin(so*pi*freq/room_speed)*amplitude;
				draw_text_transformed_gradient_shadow(tX+(space*charWidth), tY+(26*line)+shift, string_hash_to_newline(string_char_at(message[message_current], i)),2,2,0,color1[message_current],color1[message_current],color2[message_current],color2[message_current],1,font[message_current]);
                break;
            }
        }
        
        //Move to next character
		space++;
		i++;
		lastline = line;
    }
}