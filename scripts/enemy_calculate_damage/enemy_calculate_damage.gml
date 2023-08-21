/// Calculates damage to you using any relevant stats
/// @arg base_damage
/// @arg damage_min
/// @arg damage_max
function enemy_calculate_damage(){
	var damage = argument[1];
	var _min = 1; 
	var _max = undefined;

		enemy_element_calculate_bonus_damage(global.elements[0,0],global.elements[0,0]) // Sans elemental pairs and bonus damage calculations
		player_element_calculate_bonus_damage(global.elements[4,1],global.elements[6,1])

	//var hp = global.partyhp[_member_index]._curr;
	var def = global.partydf[_member_index];
	//damage += (hp>=global.partyhp[_member_index]._max ? ceil(hp-global.partyhp[_member_index]._max/10) : 0)+global.elementBonusDamage;
	damage -= def/5;
	damage = round(damage);
	
	if(is_real(_min)){
		if(damage<_min){
			damage=_min;	
		}
	}
	
	if(is_real(_max)){
		if(damage>_max){
			damage=_max;	
		}
	}
	
	return damage;
}