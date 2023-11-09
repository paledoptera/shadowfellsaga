function Item () constructor {
	longName = "";
	shortName = "";
	seriousName = "";
	checkText = "";
	buyPrice = 0;
	sellPrice = 0;
}

function Armor () : Item() constructor {
	longName = "";
	shortName = "";
	seriousName = "";
	checkText = "";
	shopText = "";
	hpGain  = 0
	defGain = 0
	buyPrice = 0;
	sellPrice = 0;
	ability = "";  // e.g "SPOOKINESS UP"
}

function Weapon () : Item() constructor {
	longName = "";
	shortName = "";
	seriousName = "";
	checkText = "";
	shopText = "";
	hpGain  = 0
	atGain = 0
	buyPrice = 0;
	sellPrice = 0;
	ability = "";  // e.g "SPOOKINESS UP"
}


function KeyItem () : Item () constructor {
	longName = "";
	shortName = "";
	seriousName = "";
	checkText = "";
}

function HealingItem () : Item () constructor {
	longName = ""
	shortName = "";
	seriousName = "";
	checkText = ""
	buyPrice = 0;
	sellPrice = 0;
	
	hpGain  = 0;
}
#region Healing Items

#region TEST ITEM
function Test () : HealingItem () constructor {
	longName = "TestItem"
	shortName = "";
	seriousName = "Test";
	checkText = "Test Item!#Heals 10 HP."
	buyPrice = 0;
	sellPrice = 0;
	
	hpGain  = 10;
}
#endregion

#region DARK CANDY
function DarkCandy () : HealingItem () constructor {
	longName = get_lang_string("item_info_slash_item_info_gml_0_0") // Dark Candy
	shortName = get_lang_string("item_info_slash_item_info_gml_0_0") // Dark Candy
	seriousName = get_lang_string("item_info_slash_item_info_gml_0_0") // Dark Candy
	checkText = get_lang_string("item_info_slash_item_info_gml_1_0") // Heals#40HP
	buyPrice = 40;
	sellPrice = 13;
	
	hpGain  = 40;
}
#endregion
#endregion

#region Key Items
function CellPhone () : KeyItem () constructor {
	longName = get_lang_string("key_item_info_slash_key_item_info_gml_0_0")
	shortName = get_lang_string("key_item_info_slash_key_item_info_gml_0_0")
	seriousName = get_lang_string("key_item_info_slash_key_item_info_gml_0_0")
	checkText = get_lang_string("key_item_info_slash_key_item_info_gml_1_0")
}
#endregion

#region Equipment
#region Armor
function AmberCard () : Armor() constructor {
	longName = "";
	shortName = "";
	seriousName = "";
	checkText = "A thin square charm that sticks to you, increasing defense.";
	shopText = "Defensive charm."
	hpGain  = 0
	defGain = 1
	buyPrice = 100;
	sellPrice = 50;
}
#endregion
#region Weapons
function Spookysword () : Weapon () constructor {
	longName = "";
	shortName = "";
	seriousName = "";
	checkText = "A black-and-orange sword with a bat hilt.";
	shopText = "Black-and orange"
	hpGain  = 0
	atGain = 2;
	buyPrice = 200;
	sellPrice = 100;
	ability = "Spookiness UP"
}
#endregion
#endregion