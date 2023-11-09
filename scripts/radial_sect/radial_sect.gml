// Feather disable all
/// @desc    Returns whether the vector represented by the sum of the verb values points to the radial sector indicated by angle and magnitude bounds
/// @param   leftVerb
/// @param   rightVerb
/// @param   upVerb
/// @param   downVerb
/// @param   [minAngle=0]
/// @param   [maxAngle=360]
/// @param   [minMagnitude=0]
/// @param   [maxMagnitude=1]
/// @param   [playerIndex=0]
function radial_sect(_verb_l, _verb_r, _verb_u, _verb_d, _angle_min = 0, _angle_max = 360, _magnitude_min = 0, _magnitude_max = 1, _player_index = undefined){
	return input_radial_sector(_verb_l,_verb_r,_verb_u,_verb_d,_angle_min,_angle_max,_magnitude_min,_magnitude_max,_player_index)
}