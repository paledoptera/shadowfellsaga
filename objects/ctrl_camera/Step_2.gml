//get current camera position
var camX = camera_get_view_x(camera);
var camY = camera_get_view_y(camera);
var camW = camera_get_view_width(camera);
var camH = camera_get_view_height(camera);

//set target camera position
if target != -1 and !instance_exists(ctrl_cutscene)
{
var targetX = target.x
var targetY = target.y
if target = obj_ow_player
{ 
	targetY -= 40
	if obj_ow_player.z = obj_ow_player.zfloor {zoffset = obj_ow_player.zfloor/2}
}

//clamp
targetX = clamp(targetX,320,room_width-320);
targetY = clamp(targetY,240,room_height-240);

//smoooth shmoovin
switch(global.camtype){
	case 0:
		x += (targetX-x)/3;
		y += (targetY-y+zoffset)/3;
	break;
	case 1:
		execute_tween(id,"x",targetX,"easeInOut",0.125)
		execute_tween(id,"y",targetY,"easeInOut",0.125)
	break;
}
}



//fix camera
camW = clamp(camW,160,960);
camH = clamp(camH,120,720);

camX = x - camW/2;
camY = y - camH/2;


//apply cam position
camera_set_view_pos(camera,camX,camY);
camera_set_view_size(camera,camW,camH);