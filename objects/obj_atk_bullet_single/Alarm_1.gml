///@desc Spawn bullet
instance_create_depth(SEMI.x-15,SEMI.y,0,obj_atk_bullet, {
	image_angle: direction,
	direction: point_direction(x,y,PAPS.x+60,PAPS.y+60),
	moveSpeed: 2
})
