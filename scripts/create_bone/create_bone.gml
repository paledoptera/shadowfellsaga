function create_bone(_xx,_yy,_scale_x,_scale_y,_speed,_angle){
	instance_create_depth(_xx,_yy,0,obj_atk_bone_solo,
	{
			image_xscale:		_scale_x,
			image_yscale:		_scale_y,
			moveSpeed:		_speed,
			image_angle:		_angle
	})
}