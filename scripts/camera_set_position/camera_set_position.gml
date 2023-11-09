///@description manages camera position
///@function camera_set_position()
function camera_set_position(){
//Positions Camera on the Controller
	var view_x = x - camera_get_view_width(camera)/4 //clamp(x - camera_get_view_width(view)/4, 0, room_width - camera_get_view_width(view));
	var view_y = y - camera_get_view_height(camera)/4 //clamp(y - camera_get_view_height(view)/4, 0, room_height - camera_get_view_height(view));
	
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
		if(shake_time <= 0) {
			
			//decays shake magnitude
			shake_magnitude -= shake_decay;
			
			//turns off shake effect
			if(shake_magnitude <= 0) {shaking = false;}
			
		}
	}
	
	//Sets view position
	camera_set_view_pos(camera,view_x+shake_x,view_y+shake_y);
}