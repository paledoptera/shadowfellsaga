// Feather disable all
/// @desc    Returns the most recently pressed verb from among the array of verbs provided
///          If no verb array is provided, all defined verbs will be check instead
/// @param   [verbArray=all]
/// @param   [playerIndex=0]
function press_recent(_verb_array = all, _player_index = 0){
	return input_check_press_most_recent(_verb_array, _player_index)
}