// Saves all game configuration data, does not take any arguments
function config_save(){
		ini_open("config.ini")
		ini_write_real("Keyboard","UP",global.key_up)
		ini_write_real("Keyboard","DOWN",global.key_down)
		ini_write_real("Keyboard","LEFT",global.key_left)
		ini_write_real("Keyboard","RIGHT",global.key_right)
		ini_write_real("Keyboard","ACTION",global.key_action)
		ini_write_real("Keyboard","CANCEL",global.key_cancel)
		ini_write_real("Keyboard","MENU",global.key_menu)
		ini_write_real("Keyboard","RUN",global.key_run)
	
		ini_write_real("Gamepad","UP",global.gp_up)
		ini_write_real("Gamepad","DOWN",global.gp_down)
		ini_write_real("Gamepad","LEFT",global.gp_left)
		ini_write_real("Gamepad","RIGHT",global.gp_right)
		ini_write_real("Gamepad","ACTION",global.gp_action)
		ini_write_real("Gamepad","CANCEL",global.gp_cancel)
		ini_write_real("Gamepad","MENU",global.gp_menu)
		ini_write_real("Gamepad","RUN",global.gp_run)
	ini_close();
}

// Loads all game configuration data, does not take any arugments
function config_load(){
	ini_open("config.ini")
	#region Keyboard Inputs
	global.key_up = ini_read_real("Keyboard","UP",vk_up)
	global.key_down = ini_read_real("Keyboard","DOWN",vk_down)
	global.key_left = ini_read_real("Keyboard","LEFT",vk_left)
	global.key_right = ini_read_real("Keyboard","RIGHT",vk_right)
	global.key_action = ini_read_real("Keyboard","ACTION", ord("Z"))
	global.key_cancel = ini_read_real("Keyboard","CANCEL", ord("X"))
	global.key_menu = ini_read_real("Keyboard","MENU",ord("C"))
	global.key_run = ini_read_real("Keyboard","RUN",vk_shift)
	#endregion
	#region Gamepad Inputs
	global.gp_up = ini_read_real("Gamepad","UP",gp_padu)
	global.gp_down = ini_read_real("Gamepad","DOWN",gp_padd)
	global.gp_left = ini_read_real("Gamepad","LEFT",gp_padl)
	global.gp_right = ini_read_real("Gamepad","RIGHT",gp_padr)
	global.gp_action = ini_read_real("Gamepad","ACTION", gp_face1)
	global.gp_cancel = ini_read_real("Gamepad","CANCEL", gp_face2)
	global.gp_menu = ini_read_real("Gamepad","MENU",gp_face4)
	global.gp_run = ini_read_real("Gamepad","RUN",vk_shift)
	#endregion
	
}