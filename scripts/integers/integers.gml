function number_add(number, valMax = undefined, incrementAmount = 1) {
	if (!is_undefined(valMax)) {
		if (number < valMax) && (!is_undefined(valMax)) {
			if (number + incrementAmount >= valMax)
				number = valMax;
			else number += incrementAmount;
		}
	}
	else number += incrementAmount;
	
	return number;
}

function number_sub(number, valMin = undefined, decrementAmount = 1) {
	if (!is_undefined(valMin)) {
		if (number > valMin) {
			if (number - decrementAmount <= valMin)
				number = valMin;
			else number -= decrementAmount;
		}
	}
	else number -= decrementAmount;
	
	return number;
}
	
function is_int(val) 
{
	///@arg val
    if ((!is_int32(val)) && (!is_real(val)))
        return 0;
    return frac(val) == 0;
}