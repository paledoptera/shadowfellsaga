// Feather disable all
/// @desc    Returns the vector represented by the sum of the verb values
/// @param   leftVerb
/// @param   rightVerb
/// @param   upVerb
/// @param   downVerb
/// @param   [playerIndex=0]
/// @param   [mostRecent]
function get_xy(_verb_l, _verb_r, _verb_u, _verb_d, _player_index = 0, _most_recent = INPUT_DEFAULT_2D_MOST_RECENT){
	return input_xy(_verb_l,_verb_r,_verb_u,_verb_d,_player_index,_most_recent)
}