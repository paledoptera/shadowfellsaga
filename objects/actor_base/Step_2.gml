//Z AXIS
//the reason we use z axis stuff, as well as 2.5 platform collision is we don't want 
//the character to clip into terrain, we want them to stand on top of it.
//if they jump in a cutscene, we also want to keep their gravity.
if zsp < 20 {zsp += grav;}
if z+zsp > zfloor {zsp = 0; z = zfloor;}  
z += zsp;

//changing sprite
var _old_sprite = sprite_index;
	
#region ANIMATION
switch state
{
	case "default":
		if x != xprevious or y != yprevious 
		{
			sprite_index = sprite_run;
			var dif =  abs(x-xprevious)
			image_speed = dif/2.5;
			if image_speed < 0.5 {image_speed = 0.5}
			direction = point_direction(xprevious,yprevious,x,y);
			
		}
		else {sprite_index = sprite_idle;}
		if z != zfloor {sprite_index = sprite_jump;}
		if (_old_sprite != sprite_index) local_frame = 0;
		player_animate_sprite();
	break;
	
	case "talking":
		if sprite_index != sprite_talk[current_talk_sprite] {sprite_index = sprite_talk[current_talk_sprite];}
		if instance_exists(ctrl_dialogue) {if char = ctrl_dialogue.char[message_current] {image_index = 0+ctrl_dialogue.facetimer}}
	break;
	
	case "other":
		image_index = local_frame + (_cardinal_direction * _total_frames);
		local_frame += sprite_get_speed(sprite_index) / FRAME_RATE * image_speed;
		var _total_frames = sprite_get_number(sprite_index)
		if (local_frame >= _total_frames)
		{
			animation_end = true;
			if looping_sprite = true {local_frame -= _total_frames;} else {image_speed = 0; local_frame = _total_frames-1;}
		}
		else animation_end = false;

		if (_old_sprite != sprite_index) local_frame = 0;
	break;
}



#endregion

//SETTING DEPTH
depth = -y;