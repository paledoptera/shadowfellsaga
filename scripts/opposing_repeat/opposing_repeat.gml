// Feather disable all
/// @desc    Returns the sign of the result of the negative and positive active verbs as re-triggered by a repeater behaviour
///          This function will not return <true> on the same frame a verb is activated (unless predelay is set to 0)
///          You'll probably want to combine this function with input_check_opposing_pressed()
/// @param   verbNegative
/// @param   verbPositive
/// @param   [playerIndex=0]
/// @param   [mostRecent]
/// @param   [delay]
/// @param   [predelay]
function opposing_repeat(_verb_negative, _verb_positive, _player_index = 0, _most_recent = INPUT_DEFAULT_OPPOSING_MOST_RECENT, _delay = INPUT_REPEAT_DEFAULT_DELAY, _predelay = INPUT_REPEAT_DEFAULT_PREDELAY){
	return input_check_opposing_repeat(_verb_negative,_verb_positive,_player_index,_most_recent,_delay,_predelay)
}