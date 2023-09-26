// Feather disable all
/// @desc    Returns a generic, human-readable name for the binding
///          For a list of return values, please see https://www.jujuadams.com/Input/#/latest/Binding-Names
/// @param   binding

function get_binding_name(_binding)
{
    if (!input_value_is_binding(_binding)) return "INVALID";
	switch (_binding.__label){
		case "arrow up":
			_binding.__label = "UP";
		break;
		case "arrow down":
			_binding.__label = "DOWN";
		break;
		case "arrow left":
			_binding.__label = "LEFT";
		break;
		case "arrow right":
			_binding.__label = "RIGHT";
		break;
		case "shift":
			_binding.__label = "SHIFT";
		break;
	}
    return _binding.__label;
}
