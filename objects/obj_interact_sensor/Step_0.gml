x = obj_ow_player.x;
y = obj_ow_player.y-10;

direction = obj_ow_player.direction;
image_angle = direction;

if place_meeting(x,y,obj_savelamp){
	 instance_tag_hit = "save_lamp" ;
	with PLAYER { hit = obj_interact_sensor.instance_tag_hit }
} else { instance_tag_hit = "" }; // reset if collision no longer active

if place_meeting(x,y,obj_ow_interacttrigger) or place_meeting(x,y,obj_ow_interacttriggerb){
	 instance_tag_hit = "interact_generic" ;
	with PLAYER { hit = obj_interact_sensor.instance_tag_hit }
} else { instance_tag_hit = "" }; // reset if collision no longer active
