/// @description HOW TO USE
//diestware.tumblr.com

/*///////////////////////////////
////      Start a chat      /////
/////////////////////////////////

// First create an array with your desired messages. for example:
message[0] = "Hello this is the first message!";
message[0] = "This is the second message!";

// Secondly, if you have a portrait sprite, write the name of the sprite
// as the second parameter. The default sprite size is 50x50.
// If you don't want a portrait just write "none"

// Then when you're ready call this script to start the chat in game:
newChat(message, portrait, font);

*/




/*///////////////////////////////
////    Effects in chat     /////
/////////////////////////////////
// If you'd like to have effects in your message then you must put the
// correct modifier code. For example:
message[0] = "\4Wavy text";

// The modifier code is "\" followed by the number for the corresponding effect.
// The modifiers are as follows:
\0 - Normal text
\1 - Shaky text
\2 - Color text
\3 - Color & shake text
\4 - Wavy text
\5 - Gradient text
\6 - Gradient & wavy text

// We can mix and match the effects by doing the following:
message[0] = "\0Normal \1Shaky \2Color \4Wavy";

// The text functions follow the same principle.
// Text functions are as follows:
& - Line Break
*/




/*///////////////////////////////
////      Editing Chat      /////
/////////////////////////////////

// WARNING
// Not recommended unless you're an advanced user

// Go to the listed line number in the Draw GUI event to edit

// To move around the chat box go to line 19
// To move around the portrait go to line 21
// To move around the text starting position go to line 38 for the Y and 40-41 for the X
// To edit the chat sound go to line 75
// To edit any of the modifiers they start at line 109
// To add a new modifier add a new case in the switch statement starting at line 109
// To edit how many characters fit on each line go to line 28-29
// To edit space between characters go to line 26
// To edit time between characters go to line 35

*/

/* */
///Initialize Variables
depth=-999;
message_current = 1;
boxtype = -1; // Are we in the dark world or light world?

xxscale=2;
yyscale=2;

timer = 0;
facetimer = 1;
cutoff = 0;

port_scale_multi = 1;
port_speed = 0.1;

talk_pitchbends = 1;

t = 0;
//Amplitude & Freq for Wavy Text
amplitude = 3;
freq = 2;

done = false;

audio_group_load(Talksounds);

playerExists			= instance_exists(PLAYER);
followerExists		= instance_exists(FOLLOWER); 

if (playerExists)  {PLAYER.image_speed = 0; PLAYER.active = false;}
if (followerExists) {FOLLOWER.image_speed = 0}

//Input
_input = false;

if(flag_get(global.flags,"world")==0){
	boxtype=0;
} else if(flag_get(global.flags,"world")==1){
	boxtype=1;
}
/* */
/*  */
