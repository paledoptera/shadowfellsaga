// Feather disable all
/// @desc    Returns a boolean indicating whether the given verb has been actived by a quick tap on an analogue (thumbstick/trigger) axis this frame
///          Behaviour of this function can be customised using the INPUT_QUICK_BUFFER macro
///          If an array of verbs is given then this function will return <true> if ANY verb has crossed the long-hold threshold this frame
///          If a buffer duration is specified then this function will return <true> if the verb has crossed the long-hold threshold at any point within that timeframe
/// @param   verb/array
/// @param   [playerIndex=0]
/// @param   [bufferDuration=0]

function pressed_quick(_verb, _player_index = 0, _buffer_duration = 0){
	return input_check_quick_pressed(_verb,_player_index,_buffer_duration)
}