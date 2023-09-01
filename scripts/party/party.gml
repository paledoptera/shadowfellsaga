// Initializes all party data, does not take any arguments.
function party_init(){
	global.party=[0,-1];
	global.partynames[0]=str_set_loc("PAPYRUS","DEVICE_WORLD_DATA_MEMBERPAP_REVISED_Draw_64_slash_8_0");
	global.partynames[1]=str_set_loc("sans","DEVICE_WORLD_DATA_MEMBERSANS_REVISED_Draw_64_slash_8_0");
	global.partynames[2]=str_set_loc("SKELEBROS","DEVICE_WORLD_DATA_TEAMNAME_REVISED_Draw_64_slash_8_0");
	global.partyhp[0]={_curr:120,_max:120};
	global.partyhp[1]={_curr:1,_max:1};
	global.partylv[0]=1; 
	global.partylv[1]=1;
	global.partyequippedwep=[-1,-1];
	global.partyequippedarm=[-1,-1,-1,-1,-1,-1,-1];
}

// Returns the size of the party.
function party_get_size(){
	return array_length(global.party)
}
	
// Adds a member to the party, currently only can add sans, but it's possible to expand
// This later down the line with relative ease if we have more followers in-game.
function party_add_follower(member){
	global.party=[0,member]
}

// Returns the name of the current room
// If you need to adjust the name data, edit the default strings here
// And the localized strings in the JSON file.
function party_get_room_name(){
//	 flavor_rms = [DW_flavortown]
//	 carrion_rms = [DW_carrionisles_1,DW_carrionisles_2]
	var rm=argument[0];	
	var area="";
	var name="";
	
	#region ASSIGN ROOM NAMES FOR FLAVORTOWN
    if (asset_has_tags(rm,"flavor",asset_room)){
		area="Flavortown"
		switch(rm){
			case DW_flavortown:
			name=string(area)+str_set_loc(" - ???","DEVICE_WORLD_DATA_FLAVORTOWN_REVISED_Draw_64_slash_9_1")
			break;
		}
	}
	#endregion
	#region ASSIGN ROOM NAMES FOR CARRIN ISLES
	if (asset_has_tags(rm,"carrion",asset_room)){
		area="Carrion Isles"
		switch(rm){
			case DW_carrionisles_1:
			name=string(area)+str_set_loc(" - Beach","DEVICE_WORLD_DATA_CARRION ISLES_REVISED_Draw_64_slash_9_1")
			break;
			case DW_carrionisles_2:
				name=string(area)+str_set_loc(" - Docks","DEVICE_WORLD_DATA_CARRION ISLES_REVISED_Draw_64_slash_9_2")
				break;
		}
	}
	#endregion
	return name;
	
}