// Feather disable all
/// @desc    Returns the analogue value that the verb is currently receiving
///          If the verb is not received analogue input, this function will return either 0 or 1
///          If an array of verbs is provided, this function will return the sum of all verb values
/// @param   verb/array
/// @param   [playerIndex=0]
function get_value(_verb, _player_index = 0){
	return input_value(_verb,_player_index)
}