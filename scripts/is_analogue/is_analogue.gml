// Feather disable all
/// @desc    Returns whether the given verb is currently received analogue input (e.g. from a gamepad thumbstick)
///          If an array of verbs is provided, this function will return <true> if ANY of the verbs have analogue input
/// @param   verb/array
/// @param   [playerIndex=0]
function is_analogue(_verb, _player_index = 0){
	return input_is_analogue(_verb,_player_index)
}