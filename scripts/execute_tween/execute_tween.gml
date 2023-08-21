/// @arg instance - The object instance to tween a variable of (best to just put "id" inside of the obejct, but you can use with statements to handle this as well)
/// @arg variable - The variable to tween
/// @arg targetValue - The target value of the variable, must be greater than the initial value even if only by 0.1
/// @arg curveSubName - Linear is the default animation curve used with execute tween, but it is 
/// Adivisable to choose depending on what your needs are for an animation, example use cases listed below
/// You have a moving object and want it to smoothly slow down- use easeInOut
/// You want an object to smoothly move in, and be rigid from then on - use easeIn
/// You want an image to have smooth animation all the way up until it reaches the target value
/// use linear
/// Note that these use cases MAY vary depending on what your actual needs are
/// @arg seconds  - The time (in seconds), that the tween should last for 
/// @arg  relative - Whether or not the tween is relative to the position of this object or its parent
/// @arg delay - Set a delay before tween begins
function execute_tween(instance, variable, targetValue, curveSubName = "linear", seconds = 1, relative = false, delay = 0){
	// Set the values
	with (instance_create_depth(0, 0, 0, obj_tweenhandler)) {
		curveTimer = 0;
		curveName = curveSubName;
		targetInstance = instance;
		targetVariable = variable;
		oldValue = variable_instance_get(instance, variable);
		newValue = targetValue - (relative ? 0 : variable_instance_get(instance, variable));
		duration = seconds;
		self.delay = delay;
	}
}