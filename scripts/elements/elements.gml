function elements_init(){
	global.elements[0,0]="necro";
	global.elements[0,1]="dust";
	
	global.elements[1,0]="water";
	global.elements[1,1]="pirate";
	
	global.elements[2,0]="ice";
	global.elements[2,1]="crystal";
	
	global.elements[3,0]="chow";
	global.elements[3,1]="steel";
	
	global.elements[4,0]="wild";
	global.elements[4,1]="cowboy";
	
	global.elements[5,0]="holy";
	global.elements[5,1]="dog";
	
	global.elements[6,0]="blade";
	global.elements[6,1]="heart";
	
	global.elementBonusDamage=0;
}

/// Calculates bonus elemental damage using a source and target
/// @arg elementSource
/// @arg targetElement
function player_element_calculate_bonus_damage(_source, _target) {
	// If elemental damage is coming from Necro/Dust
	if(_source==global.elements[0,0]||_source==global.elements[0,1]){
		if(_target==global.elements[3,0]||_target==global.elements[3,1]){
				global.elementBonusDamage=20;
		}
		if(_target==global.elements[3,0]||_target==global.elements[3,1]){ // damaging holy/dog
				global.elementBonusDamage=30;
		}
		} else {
				global.elementBonusDamage=0;	
		}
}

/// Calculates bonus elemental damage using a source and target
/// @arg elementSource
/// @arg targetElement
function enemy_element_calculate_bonus_damage(_source, _target) {
	// If elemental damage is coming from Necro/Dust
	if(_source==global.elements[0,0]||_source==global.elements[0,1]){
		if(_target==global.elements[3,0]||_target==global.elements[3,1]){ // damaging chow/steel
				global.elementBonusDamage=20-global.partydf[0];
		}
	}
	
	// If elemental damage is coming from Water/Pirate
	if(_source==global.elements[1,0]||_source==global.elements[1,1]){
		if(_target==global.elements[4,0]||_target==global.elements[4,1]){ // damaging wild/cowboy
				global.elementBonusDamage=25-global.partydf[0];
		}
	}
	
	// If elemental damage is coming from Ice/Crystal
	if(_source==global.elements[2,0]||_source==global.elements[2,1]){
			global.elementBonusDamage=0; // no defined weakness/strength as of yet, temporarily set to 0 until defined otherwise
	}
	
	// If elemental damage is coming from Chow/Steel
	if(_source==global.elements[3,0]||_source==global.elements[3,1]){
		if(_target==global.elements[1,0]||global.elements[1,1]){ // damaging water/pirate
				global.elementBonusDamage=25-global.partydf[0];
		}
	}
	
	// If elemental damage is coming from Wild/Cowboy
	if(_source==global.elements[4,0]||_source==global.elements[4,1]){
		if(_target==global.elements[6,0]||_target==global.elements[6,1]){ // damaging blade/heart
				global.elementBonusDamage=25-global.partydf[0];
		}
	}
	
	// If elemental damage is coming from Holy/Dog
	if(_source==global.elements[5,0]||_source==global.elements[5,1]){
		if(_target==global.elements[0,0]||_target==global.elements[0,1]){  // Strong against ALL elements
				global.elementBonusDamage=25-global.partydf[0];
		}	
		if(_target==global.elements[1,0]||_target==global.elements[1,1]){ 
				global.elementBonusDamage=25-global.partydf[0];
		}	
		if(_target==global.elements[2,0]||_target==global.elements[2,1]){ 
				global.elementBonusDamage=25-global.partydf[0];
		}
		if(_target==global.elements[3,0]||_target==global.elements[3,1]){ 
				global.elementBonusDamage=25-global.partydf[0];
		}
		if(_target==global.elements[4,0]||_target==global.elements[4,1]){ 
				global.elementBonusDamage=25-global.partydf[0];
		}
		if(_target==global.elements[6,0]||_target==global.elements[6,1]){ 
				global.elementBonusDamage=25-global.partydf[0];
		}
	}

}