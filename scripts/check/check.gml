// Feather disable all
/// @desc    Returns a boolean indicating whether the given verb is currently active (a button is being held etc.)
///          If the keyword <all> is used then this function will return <true> if ANY verb whatsoever is active
///          If an array of verbs is given then this function will return <true> if ANY of the verbs in the array are active
///          If a buffer duration is specified then thi
/// @param   verb/array
/// @param   [playerIndex=0]
/// @param   [bufferDuration=0]
function check(_verb, _player_index = 0, _buffer_duration = 0){
	return input_check(_verb,_player_index,_buffer_duration)
}