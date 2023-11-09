// Feather disable all
/// @desc    Returns a boolean indicating whether the given verb has been double-tapped this frame
///          If an array of verbs is given then this function will return <true> if ANY verb has been doubled-tapped this frame
///          If a buffer duration is specified then this function will return <true> if the verb has been double-tapped at any point within that timeframe
/// @param   verb/array
/// @param   [playerIndex=0]
/// @param   [bufferDuration=0]
function double_pressed(_verb, _player_index = 0, _buffer_duration = 0){
	return input_check_double_pressed(_verb,_player_index,_buffer_duration)
}