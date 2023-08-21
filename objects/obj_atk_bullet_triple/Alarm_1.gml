///@desc Spawn bullet
instance_create_depth(SEMI.x-15,SEMI.y,0,obj_atk_bullet, {
	image_angle: direction,
	direction: point_direction(x,y,192+60,160+60),
	moveSpeed: 2
})

snd_play(snd_revovler_shot,8,false)
if(instance_number(obj_atk_bullet)<3){
	alarm[1] = 35;
	alarm[2] = 95;
}
