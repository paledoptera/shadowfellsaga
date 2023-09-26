// Feather disable all
/// @desc    Sets the value of a verb. This is "additive" to other physical inputs the player might be making
///          If you'd like to fully control a player's verbs, please set that player to ghost mode with input_player_ghost_set()
/// @param   verb
/// @param   value
/// @param   [playerIndex=0]
/// @param   [analogue=true]

function set_verb(_verb, _value, _player_index = 0, _analogue = true){
	return input_verb_set(_verb,_value,_player_index,_analogue)
}