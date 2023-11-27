// Feather disable all
//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

return {
    
    keyboard_and_mouse:
    {
        up:   input_binding_key(vk_up),
        down:  input_binding_key(vk_down),
        left:  input_binding_key(vk_left),
        right: input_binding_key(vk_right),
        
		interact:  input_binding_key("Z"),
        cancel:  input_binding_key("X"),
		forward: input_binding_key("A"),
		thought: input_binding_key("S"),
		
        menu: input_binding_key("C"),
		
		swap_l: input_binding_key(vk_shift), // Swap Interaction Mode
 		swap_r: input_binding_key("V")  // Swap Leader
    },
    
    gamepad:
    {
        up:    [input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
        down:  [input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
        left:  [input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
        right: [input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
				
        interact:  input_binding_gamepad_button(gp_face1),
        cancel:  input_binding_gamepad_button(gp_face2),
		forward:  input_binding_gamepad_button(gp_face3),
		thought:  input_binding_gamepad_button(gp_face4),
        
		menu: input_binding_gamepad_button(gp_start),
		
		swap_l: input_binding_gamepad_button(gp_shoulderl),
		swap_r: input_binding_gamepad_button(gp_shoulderr)            
    },
    
    touch:
    {
        up:    input_binding_virtual_button(),
        down:  input_binding_virtual_button(),
        left:  input_binding_virtual_button(),
        right: input_binding_virtual_button(),
        
        interact: input_binding_virtual_button(),
        cancel:  input_binding_virtual_button(),
        forward: input_binding_virtual_button(),
		thought: input_binding_virtual_button(),
		
		menu: input_binding_virtual_button(),
		
		swap_l: input_binding_virtual_button(),
		swap_r: input_binding_virtual_button()
    }
    
};