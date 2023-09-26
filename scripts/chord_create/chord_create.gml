// Feather disable all
/// @desc    Creates a chord verb that is considered active when all of its constituent verbs are active
///          The maxTimeBetweenPresses argument determines how far apart each verb activation is allowed to be
///          The units for maxTimeBetweenPresses is determined by INPUT_TIMER_MILLISECONDS
/// @param   name
/// @param   maxTimeBetweenPresses
/// @param   verb1
/// @param   verb2
/// @param   ...
function chord_create(){
	return input_chord_create()
}