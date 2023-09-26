///@desc On Slider Adjust
switch(type){
	case "master":
		audio_master_gain(value_)
	break;
	case "music":
		mus_set_volume(global.currentmus,value_,0,true)
	break;
	case "sfx":
		audio_group_set_gain(sfx,value_,0)
	break;
	case "voice":
		audio_group_set_gain(sfx,value_,0)
	break;	
}