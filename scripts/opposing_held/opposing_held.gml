// Feather disable all
/// @desc    Returns the sign of the result of the negative and positive active verbs
/// @param   verbNegative
/// @param   verbPositive
/// @param   [playerIndex=0]
/// @param   [mostRecent]
function opposing_held(_verb_negative, _verb_positive, _player_index = 0, _most_recent = INPUT_DEFAULT_OPPOSING_MOST_RECENT){
	return input_check_opposing(_verb_negative,_verb_positive,_player_index,_most_recent)
}