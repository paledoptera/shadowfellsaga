/// @desc Turn End
event_inherited();
if(instance_exists(obj_atk_bullet_single)&&!overrideBulletDestruction){
	with(obj_atk_bullet_single){
		instance_destroy();	
	}
}
sprite_index=enemy.idle;