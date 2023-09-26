function Item () constructor {
	longName = "";
	shortName = "";
	seriousName = "";
	checkText = "";
	buyPrice = 0;
	sellPrice = 0;
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

function Test () : HealingItem () constructor {
	longName = "TestItem"
	shortName = "";
	seriousName = "Test";
	checkText = "Test Item!#Heals 10 HP."
	buyPrice = 0;
	sellPrice = 0;
	
	hpGain  = 10;
}

function DarkCandy () : HealingItem () constructor {
	static longName = get_lang_string("item_info_slash_item_info_gml_0_0") // Dark Candy
	shortName = get_lang_string("item_info_slash_item_info_gml_0_0") // Dark Candy
	seriousName = get_lang_string("item_info_slash_item_info_gml_0_0") // Dark Candy
	checkText = get_lang_string("item_info_slash_item_info_gml_1_0") // Heals#40HP
	buyPrice = 40;
	sellPrice = 13;
	
	hpGain  = 40;
}