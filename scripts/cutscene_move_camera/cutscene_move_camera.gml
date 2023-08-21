
function cutscene_move_camera(){
///@description cutscene_move_camera
///@arg x
///@arg y
///@arg relative?
///@arg spd

var relative = argument2, spd = argument3;

if(!player_is_in_battle()){
		if(x_dest == -1){if(!relative){x_dest = argument0; y_dest = argument1;}
			else {x_dest = ctrl_camera.x + argument0; y_dest = ctrl_camera.y + argument1;}}
		var xx = x_dest;
		var yy = y_dest;

		with(ctrl_camera)
		{ 
			if(point_distance(x,y,xx,yy) >= spd)
			{
				var dir = point_direction(x,y,xx,yy);
				var ldirx = lengthdir_x(spd,dir);
				var ldiry = lengthdir_y(spd,dir);
				inputdirection = point_direction(x,y,xx,yy); 
				inputmagnitude = 2;
				x += ldirx;
				y += ldiry;

			}
			else
			{
				x = xx;
				y = yy;
				inputmagnitude = 0;
				with(other) {x_dest = -1; y_dest = -1; cutscene_end_action();}
			}
		}
} else if(player_is_in_battle()){
		if(x_dest == -1){if(!relative){x_dest = argument0; y_dest = argument1;}
			else {x_dest = ctrl_battlecamera.x + argument0; y_dest = ctrl_battlecamera.y + argument1;}}
		var xx = x_dest;
		var yy = y_dest;

		with(ctrl_battlecamera)
		{ 
			if(point_distance(x,y,xx,yy) >= spd)
			{
				var dir = point_direction(x,y,xx,yy);
				var ldirx = lengthdir_x(spd,dir);
				var ldiry = lengthdir_y(spd,dir);
				inputdirection = point_direction(x,y,xx,yy); 
				inputmagnitude = 2;
				x += ldirx;
				y += ldiry;

			}
			else
			{
				x = xx;
				y = yy;
				inputmagnitude = 0;
				with(other) {x_dest = -1; y_dest = -1; cutscene_end_action();}
			}
		}
}


}