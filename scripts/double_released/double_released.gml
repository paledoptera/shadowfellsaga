// Feather disable all
/// @desc    Returns a boolean indicating whether the given verb had been double-tapped and was deactivated this frame
///          If an array of verbs is given then this function will return <true> if ANY verb was double-tapped and then deactivated this frame
///          If a buffer duration is specified then this function will return <true> if the verb double-tapped and then deactivated at any point within that timeframe
/// @param   verb/array
/// @param   [playerIndex=0]
/// @param   [bufferDuration=0]
function double_released(_verb, _player_index = 0, _buffer_duration = 0){
	return input_check_double_released(_verb,_player_index,_buffer_duration)
}