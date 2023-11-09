// Feather disable all
/// @desc    Returns a boolean indicating whether the given verb was newly activated this frame (a button was pressed etc.)
///          If the keyword <all> is used then this function will return <true> if ANY verb whatsoever was newly activated
///          If an array of verbs is given then this function will return <true> if ANY of the verbs in the array were newly activated
///          If a buffer duration is specified then this function will return <true> if the verb has been newly active at any point within that timeframe
/// @param   verb/array
/// @param   [playerIndex=0]
/// @param   [bufferDuration=0]
function pressed(_verb, _player_index = 0, _buffer_duration = 0){
	return input_check_pressed(_verb,_player_index,_buffer_duration)
}