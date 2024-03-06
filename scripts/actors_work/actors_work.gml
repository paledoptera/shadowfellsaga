// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function actors_work()
{
with actor_base
{
	
	//Z AXIS
	//the reason we use z axis stuff, as well as 2.5 platform collision is we don't want 
	//the character to clip into terrain, we want them to stand on top of it.
	//if they jump in a cutscene, we also want to keep their gravity.
	if zsp < 20 {zsp += grav;}
	if z+zsp > zfloor {zsp = 0; z = zfloor;}  
	z += zsp;

	//changing sprite
	_old_sprite = sprite_index;
	
	state = "default"
	if instance_exists(ctrl_dialogue)
	{
		if char = ctrl_dialogue.char[ctrl_dialogue.message_current] {state = "talking"}
	}
	if sprite_custom != -1 {state = "custom";}
	
	
	#region ANIMATION
	switch state
	{
	case "default":
		if x != xprevious or y != yprevious 
		{
			sprite_index = sprite_run;
			var dif =  abs(x-xprevious)
			img_speed = dif/2.5;
			direction = point_direction(xprevious,yprevious,x,y);	
		}
		else {sprite_index = sprite_idle;}
		
		if z != zfloor {sprite_index = sprite_jump;}
		if (_old_sprite != sprite_index) local_frame = 0;
		player_animate_sprite();
	break;
	
	case "talking":
		if sprite_index != sprite_talk[current_talk_sprite] {sprite_index = sprite_talk[current_talk_sprite];}
		switch char
		{
			case "papy": 
				var _total_frames = sprite_get_number(sprite_index) / 8;
				var _cardinal_direction = round(direction/45);
				var _facetimer = ctrl_dialogue.facetimer
				if _facetimer > 1 _facetimer = 1
				if ctrl_dialogue.cutoff = string_length(ctrl_dialogue.message[ctrl_dialogue.message_current]) _facetimer = 0;
				image_index = floor(_facetimer) + (_cardinal_direction * _total_frames);
			break;
			
			case "sans":
				sprite_index = sprite_idle;
				player_animate_sprite();
			break;
		}
	break;
	
	case "custom":
		if (_old_sprite != sprite_index) local_frame = sprite_custom_img_start;
		sprite_index = sprite_custom;
		image_index = local_frame
		local_frame += sprite_get_speed(sprite_index) / FRAME_RATE * img_speed;
		var _total_frames = (sprite_custom_img_end-sprite_custom_img_start)
		
		if (local_frame >= sprite_custom_img_end)
		{
			animation_end = true;
			if looping_sprite = true {local_frame -= _total_frames;} else {img_speed = 0; local_frame = sprite_custom_img_end}
		}
		else animation_end = false;
	break;
	}
	#endregion

	//SETTING DEPTH
	depth = -y;
}
}