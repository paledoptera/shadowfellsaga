/// Initializes the flag system, ran in game init as flags_init()
/// There's no need to run this manually
function flags_init(){
		
	global.flags	=	ds_map_create();
	ds_map_set(global.flags, "world",0);
	ds_map_set(global.flags, "enc", -1);

	global.pflags	=	ds_map_create();
	ds_map_set(global.pflags, "party",-1);
	ds_map_set(global.pflags, "names",-1);
	ds_map_set(global.pflags, "partyhp",-1);
	ds_map_set(global.pflags, "e_wep",-1);
	ds_map_set(global.pflags, "e_arm",-1);
	ds_map_set(global.pflags,"area","Carrion Isles");
	ds_map_set(global.pflags,"rm",global.currentroom);
	ds_map_set(global.pflags,"item0",-1);
	ds_map_set(global.pflags,"item1",-1);
	ds_map_set(global.pflags,"item2",-1);
	ds_map_set(global.pflags,"item3",-1);
	ds_map_set(global.pflags,"item4",-1);
	ds_map_set(global.pflags,"item5",-1);
	ds_map_set(global.pflags,"item6",-1);
	ds_map_set(global.pflags,"item7",-1);
	ds_map_set(global.pflags,"item8",-1);
	
	global.cflags	=	ds_map_create();
	ds_map_set(global.cflags, "wildcliffs_intro",-1);
	ds_map_set(global.cflags, "papyrus_jump_enabled",-1);
	ds_map_set(global.cflags, "sans_acquired",-1);
	ds_map_set(global.cflags, "sans_jump_enabled",-1);
}


// Sets a flag
// @arg type - DS Map stored within global variable, normal flags are global.flags,
//persistent data is global.pflags
// @arg flag - The actual flag id, must be a string (e.g "area"
// @arg value - The value to assign to the flag, can be an integer, array or string depending on what
// the flag needs (if you're unsure, check flags_init for the flag you are trying to modify)
function flag_set(type,flag,value){
	return ds_map_set(type,flag,value)
}

// Gets the value of a given flag
// @arg type - DS Map stored within global variable, normal flags are global.flags,
// @arg flag - The actual flag id, must be a string (e.g "area"
function flag_get(type,flag){
	return ds_map_find_value(type,flag);	
}

// Returns true if the flag exists
// @arg type - DS Map stored within global variable, normal flags are global.flags,
// @arg flag - The actual flag id, must be a string (e.g "area")
function flag_exists(type,flag){
	if ds_map_exists(type,flag){
		return true;	
	}
	return false;
}