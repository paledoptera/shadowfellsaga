
function cutscene_move_instances_2(){
///@description cutscene_move_instance
///@arg obj
///@arg x
///@arg y
///@arg relative
///@arg spd
///@arg obj_2
///@arg x_2
///@arg y_2
///@arg relative_2
///@arg spd_2

var obj1moved = false, obj2moved = false;

//--------------------------INSTANCE 1----------------------------------------------------
var obj = argument0, relative = argument3, spd = argument4;

if(x_dest == -1){if(!relative){x_dest = argument1; y_dest = argument2;}
else {x_dest = obj.x + argument1; y_dest = obj.y + argument2;}}

var xx = x_dest;
var yy = y_dest;

with(obj)
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
		with(other) {x_dest = -1; y_dest = -1; obj1moved = true;}
	}
}

//--------------------------INSTANCE 2----------------------------------------------------
var obj_2 = argument5, relative_2 = argument8, spd_2 = argument9;

if(x_dest_2 == -1){if(!relative_2){x_dest_2 = argument6; y_dest_2 = argument7;}
else {x_dest_2 = obj_2.x + argument6; y_dest_2 = obj_2.y + argument7;}}

var xx_2 = x_dest_2;
var yy_2 = y_dest_2;

with(obj_2)
{ 
	if(point_distance(x,y,xx_2,yy_2) >= spd_2)
	{
		var dir_2 = point_direction(x,y,xx_2,yy_2);
		var ldirx_2 = lengthdir_x(spd_2,dir_2);
		var ldiry_2 = lengthdir_y(spd_2,dir_2);
		inputdirection = point_direction(x,y,xx_2,yy_2); 
		inputmagnitude = 2;
		x += ldirx_2;
		y += ldiry_2;

	}
	else
	{
		x = xx_2;
		y = yy_2;
		inputmagnitude = 0;
		with(other) {x_dest_2 = -1; y_dest_2 = -1; obj2moved = true;}
	}
}


//-------------------------------------END CHECKS------------------------------
if obj1moved = true and obj2moved = true {cutscene_end_action();}

}