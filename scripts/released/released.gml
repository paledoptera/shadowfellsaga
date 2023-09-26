// Feather disable all
/// @desc    Returns a boolean indicating whether the given verb was newly deactivated this frame (a button was released etc.)
///          If the keyword <all> is used then this function will return <true> if ANY verb whatsoever was newly deactivated
///          If an array of verbs is given then this function will return <true> if ANY of the verbs in the array were newly deactivated
///          If a buffer duration is specified then this function will return <true> if the verb has been newly deactive at any point within that timeframe
/// @param   verb/array
/// @param   [playerIndex=0]
/// @param   [bufferDuration=0]
function released(_verb, _player_index = 0, _buffer_duration = 0){
	return input_check_released(_verb,_player_index,_buffer_duration)
}