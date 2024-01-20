if init = false
{
	init = true;
	x = PLAYER.x
	y = PLAYER.y
}

// Follows the player
if instance_exists(target) and following_target = true
{
	var targetX = target.x
	var targetY = target.y
	if target = obj_ow_player
	{ 
		targetY -= 40
		if obj_ow_player.z = obj_ow_player.zfloor {zoffset = obj_ow_player.zfloor}
	}

	//clamp
	targetX = clamp(targetX,320,room_width-320);
	targetY = clamp(targetY,240,room_height-240);

	//smoooth shmoovin
	x += (targetX-x)/4;
	y += (targetY-y+zoffset)/4;
}

// Calculates screen shake
var shake_x = 0;
var shake_y = 0;
if(shaking)
{
	shake_time--;
		
	//sets shake offset
	shake_x = choose(-shake_magnitude,shake_magnitude);
	shake_y = choose(-shake_magnitude,shake_magnitude);
		
	//starts decay once timer is done counting down
	if(shake_time <= 0) 
	{
		//decays shake magnitude
		shake_magnitude -= shake_decay;
		//turns off shake effect
		if(shake_magnitude <= 0) {shaking = false;}
	}
}

//Sets view position
camera_set_view_pos(view_camera[0],x-(camWidth*0.5)+shake_x,y-(camHeight*0.5)+shake_y);