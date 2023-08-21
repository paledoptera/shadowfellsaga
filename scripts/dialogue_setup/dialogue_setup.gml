// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dialogue_setup(argument0, argument1 = "none", argument2 = fnt_papyrus, argument3 = snd_txtpapyrus)
{
	///@description dialogue_setup
	///@arg dialogue_array
	///@arg portrait_default
	///@arg font_default
	///@arg talksound_default
	
	// Input the "dialogue" 3d array into argument0, then this function will
	// automatically create arrays for fonts and portraits.
	// - dialogue[x,1] will become the portraits
	// - dialogue[x,2] will become the fonts
	// - dialogue[x,3] will become the talksounds
	// "portrait_default", "font_default" and "talksound_default" are 
	// the values the array will default to in every entry.
	
	// IMPORTANT!!!
	// Put this before any portrait or font definitions in dialogue code
	// but AFTER dialogue definitions
	
	for (i = 0; i < array_length(argument0); i++)
	{
		argument0[i,1] = argument1;
		argument0[i,2] = argument2;
		argument0[i,3] = argument3;
	}
}