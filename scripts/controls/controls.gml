/// Rebinds a given key to a new keycode
/// @arg key - Takes a global variable as input, refer to input_keyboard_defaults() 
//if you need a reference for the names
// @arg binding - The keycode to replace the old key value with, must be a vk or ord() value
// eg vk_up or ord("S")
function input_key_rebind(key, binding){
	if(key!=global.keyd_pgdn||key!=global.keyd_pgup||key!=global.key_fscrn||key!=global.keyd_shot||
	key!=global.keyd_grst||key!=global.keyd_rrst){
		if(key==global.key_up){
			global.key_up=binding;		
		}
		if(key==global.key_down){
			global.key_down=binding;		
		}
		if(key==global.key_left){
			global.key_left=binding;		
		}
		if(key==global.key_right){
			global.key_right=binding;		
		}
		if(key==global.key_action){
			global.key_action=binding;		
		}
	}
}

/// Rebinds a given button to a new button type
/// @arg button - Takes a global variable as input, refer to input_gp_defaults() 
//if you need a reference for the names
// @arg binding - The keycode to replace the old key value with, must be gp_* value
//eg gp_padr or gp_face1
function input_gp_button_rebind(button,binding){
	button=binding;
	return binding;
}
	
#region Keyboard Press Functions
function input_key_pressed(key){
	///@arg key - Input key	
	return keyboard_check_pressed(key);
}
function input_key_multicheck_pressed(argument0, key){
	if(argument0==0&&input_key_pressed(key))
		return 1;
}

function input_key_multicheck_released(argument0, key){
	if(argument0==0&&input_key_released(key))
		return 1;
}

function input_key_multicheck_held(argument0, key){
	if(argument0==0&&input_key_held(key))
		return 1;
}
function input_key_held(key){
	///@arg key - Input key (held)
	return keyboard_check(key);
}
function input_key_released(key){
	///@arg key - Input key (released)
	return keyboard_check_released(key);
}
#endregion

function input_keyboard_defaults(){
	global.key_up			=vk_up;
	global.key_down		=vk_down;
	global.key_left			=vk_left;
	global.key_right		=vk_right;
	global.key_action	=ord("Z");
	global.key_cancel	=ord("X");
	global.key_menu	=ord("C");
	global.key_run		=vk_shift;	
	
	//  Reserved keys (non-rebindable
	global.key_fscrn		=vk_f4
	
	global.keyd_shot	=vk_f5
	global.keyd_rrst		=vk_f3
	global.keyd_grst		=ord("R")
	global.keyd_pgup	=vk_pageup
	global.keyd_pgdn	=vk_pagedown	

}

#region Gamepad Button Press Functions
function input_gp_button_pressed(index=global.gp_device,button){
	return gamepad_button_check_pressed(index,button);
}	

function input_gp_button_held(index=global.gp_device,button){
	return gamepad_button_check(index,button);
}	

function input_gp_button_released(index=global.gp_device,button){
	return gamepad_button_check_released(index,button);
}	
function input_gp_button_multicheck_pressed(argument0, device=global.gp-device,button){
	if(argument0==0&&input_gp_button_pressed(device,button))
		return 1;
}

function input_gp_button_multicheck_released(argument0,device=global.gp-device,button){
	if(argument0==0&&input_gp_button_released(device,button))
		return 1;
}

function input_gp_button_multicheck_held(argument0,device=global.gp-device, button){
	if(argument0==0&&input_gp_button_held(device,button))
		return 1;
}
#endregion
#region Gamepad Mischellaneous Functions
function input_gp_stick_pressed(index=global.gp_device){
	down_stick = 0
	left_stick = 0
	up_stick = 0
	right_stick = 0
	if (gamepad_axis_value(index, gp_axislv) > global.gp_axis_deadzone && global.gp_down_pressed == 0){
	    down_stick = 1
	    global.gp_down_pressed = 1
	}
	else
	    down_stick = 0
	if (gamepad_axis_value(index, gp_axislv) < (-global.gp_axis_deadzone) && global.gp_up_pressed == 0){
	    up_stick = 1
	   global.gp_up_pressed = 1
	}
	else
	    up_stick = 0
	if (gamepad_axis_value(index, gp_axislh) < (-global.gp_axis_deadzone) && global.gp_left_pressed == 0){
	    left_stick = 1
	    global.gp_left_pressed = 1
	}
	else
	    left_stick = 0
	if (gamepad_axis_value(index, gp_axislh) > global.gp_axis_deadzone && global.gp_right_pressed == 0){
	    right_stick = 1
	    global.gp_right_pressed = 1
	}
	else
	    right_stick = 0
	if (gamepad_axis_value(index, gp_axislh) > (-global.gp_axis_deadzone) && gamepad_axis_value(0, gp_axislh) < global.gp_axis_deadzone){
	    global.gp_left_pressed = 0
	    global.gp_right_pressed = 0
	}
	if (gamepad_axis_value(index, gp_axislv) > (-global.gp_axis_deadzone) && gamepad_axis_value(0, gp_axislv) < global.gp_axis_deadzone)
{
	    global.gp_up_pressed = 0
	    global.gp_down_pressed = 0
	}

}
function input_gp_axis_value(index=global.gp_device,axis){
	return gamepad_axis_value(index,axis);
}
function input_gp_set_axis_deadzone(index=global.gp_device,deadzone){
	return gamepad_set_axis_deadzone(index,deadzone=global.gp_axis_deadzone);
}
function input_gp_set_button_threshold(index=global.gp_device,threshold=global.gp_button_threshold){
	return gamepad_set_button_threshold(index,threshold);
}
function input_gp_set_vibration(strength,duration,index=global.gp_device){
	///@arg strength
	///@arg 
	return Vibrate(strength,duration,index);
}
function input_gp_set_vibration_ext(strength_l,strength_r,duration_l,duration_r, device=global.gp_device, animcurve){
	return VibrateExtended(strength_l,strength_r,duration_l,duration_r, device, animcurve);
}
#endregion

#region Gamepad Debug Tools
function input_gp_get_mapping(device=global.gp_device){
	return gamepad_get_mapping(device)
}
#endregion
function input_gp_defaults(){
	global.gp_action=gp_face1;
	global.gp_cancel=gp_face2;
	global.gp_menu=gp_face4;
	global.gp_run=gp_shoulderlb
	global.gp_up=gp_padu;
	global.gp_up_pressed=0;
	global.gp_down=gp_padd;
	global.gp_down_pressed=0;
	global.gp_left=gp_padl;
	global.gp_left_pressed=0;
	global.gp_right=gp_padr;
	global.gp_right_pressed=0;
	global.gp_stickside=2;
	global.gp_axis_deadzone=0.25
	global.gp_button_threshold=0.3
	return;
}

function input_init(){
	global.gp_supported=gamepad_is_supported();
	global.gp_index=0;	
	global.gp_device=-1;
	input_gp_defaults();
	input_keyboard_defaults();
}