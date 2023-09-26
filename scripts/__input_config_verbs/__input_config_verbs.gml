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
        up:   [input_binding_key(vk_up),input_binding_key(vk_numpad8)],
        down:  [input_binding_key(vk_down),input_binding_key(vk_numpad2)],
        left:  [input_binding_key(vk_left),input_binding_key(vk_numpad4)],
        right: [input_binding_key(vk_right),input_binding_key(vk_numpad6)],
		
		run: input_binding_key(vk_shift),
		
		pause: input_binding_key(vk_backspace), // Used solely to cancel rebinding
        
		action:  [input_binding_key("Z"),input_binding_key(vk_enter)],
        cancel:  input_binding_key("X"),
        menu: [input_binding_key("C"),input_binding_key(vk_control)],
		
		swap1: input_binding_key("A"), // Swap Interaction Mode
 		swap2: input_binding_key("S")  // Swap Leader
    },
    
    gamepad:
    {
        up:    [input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
        down:  [input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
        left:  [input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
        right: [input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
        
		run: input_binding_gamepad_button(gp_shoulderlb),
				
        action:  input_binding_gamepad_button(gp_face1),
        cancel:  input_binding_gamepad_button(gp_face2),
        menu: input_binding_gamepad_button(gp_face4),
		
		swap1: input_binding_gamepad_button(gp_shoulderl),
		swap2: input_binding_gamepad_button(gp_shoulderr)            
    },
    
    touch:
    {
        up:    input_binding_virtual_button(),
        down:  input_binding_virtual_button(),
        left:  input_binding_virtual_button(),
        right: input_binding_virtual_button(),
		
		run: input_binding_virtual_button(),
        
        action: input_binding_virtual_button(),
        cancel:  input_binding_virtual_button(),
        menu: input_binding_virtual_button(),
		
		swap1: input_binding_virtual_button(),
		swap2: input_binding_virtual_button(),     
    }
    
};
