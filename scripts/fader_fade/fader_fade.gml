///@arg start
///@arg target
///@arg time
///@arg delay*
function fader_fade(){
	var START=argument[0];
	var TARGET=argument[1];
	var TIME=argument[2];
	var DELAY=0;
	if(argument_count>=4){
		DELAY=argument[3];
	}
	if(START==-1){
		START=ef_fader_generic.alpha;
	}
	execute_tween(ef_fader_generic,"alpha",TARGET,"easeLinear",TIME,false,DELAY)
}