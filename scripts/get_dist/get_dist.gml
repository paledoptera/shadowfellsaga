// Feather disable all
/// @desc    Returns the length of the vector represented by the sum of the verb values
/// @param   leftVerb
/// @param   rightVerb
/// @param   upVerb
/// @param   downVerb
/// @param   [playerIndex=0]
/// @param   [mostRecent]
function get_dist(_verb_l, _verb_r, _verb_u, _verb_d, _player_index = undefined, _most_recent = INPUT_DEFAULT_2D_MOST_RECENT){
	return input_distance(_verb_l,_verb_r,_verb_u,_verb_d,_player_index,_most_recent)
}