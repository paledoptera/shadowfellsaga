// Feather disable all
/// @desc    Deactivates a verb until the button (or other physical input) is released and pressed again
///          If an array of verbs is given then this function will consume all verbs in the array
///          If the keyword <all> is used then all exant verbs are consumed
/// @param   verb/array
/// @param   [playerIndex]
function verb_consume(_verb, _player_index = 0){
	return input_verb_consume(_verb,_player_index)
}