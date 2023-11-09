/// @func ease_out_circ
/// @param {float}	t	A float 0.0 - 1.0
/// @desc	An easing function.  Check <https://easings.net/> for examples on how these functions
///		behave.
/// @returns float
function ease_out_circ( _x ) {
	if ( is_numeric( _x ) == false )
		throw new InvalidArgumentType( "ease_out_circ", 0, _x, "real" );
	if ( _x < 0.0 || _x > 1.0 )
		throw new ValueOutOfBounds( "ease_out_circ", _x, 0.0, 1.0 );
	
	return sqrt(1 - power( _x - 1, 2));
	
}
