#region Dialogue Data
#region Lines
dialogue[0,0]=str_set_loc("AH... DELICIOUS!!!", "COOKING_WITH_PAPYRUS_INTERACT_TABLE_slash_0_0")
dialogue[1,0] =str_set_loc("AN ARRAY OF&MY ABSOLUTE&CULINARY EXPERTISE!", "COOKING_WITH_PAPYRUS_INTERACT_TABLE_slash_0_0")
dialogue[2,0] = str_set_loc("A FINE RISOTTO,&A TOWERING SAUCY &LASAGNA,", "COOKING_WITH_PAPYRUS_INTERACT_TABLE_slash_0_0")
dialogue[3,0] = str_set_loc("MY INCREDIBLE&HOMETOWN-FAMOUS&HANDMADE LINGUINE,", "COOKING_WITH_PAPYRUS_INTERACT_TABLE_slash_0_0")
dialogue[4,0] = str_set_loc("AND OF COURSE,&THE CHEFS TREAT...", "COOKING_WITH_PAPYRUS_INTERACT_TABLE_slash_0_0")
dialogue[5,0] = str_set_loc("...DINO EGG&OATMEAL!", "COOKING_WITH_PAPYRUS_INTERACT_TABLE_slash_0_0")
#endregion
dialogue_setup(dialogue,port_chefp);
#region Portraits
dialogue[1,1]=port_chefp_confident;
dialogue[2,1]=port_chefp_confident2;
dialogue[3,1]=port_chefp_confident;
dialogue[4,1]=port_chefp_sly;
dialogue[5,1]=port_chefp_wacky;
#endregion
#endregion


scene_info = [
	[cutscene_newChat,dialogue,1,"bottom"],
	[cutscene_wait_for_dialogue],
	[cutscene_end]
]