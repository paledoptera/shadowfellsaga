point_direction(x,y,target.x,target.y){
	if(obj_battle_ui.specAlpha=0){
		move_towards_point(target.x,target.y,moveSpeed)
	}
}
if(place_meeting(x,y,target)){
		instance_create(obj_battle_enemy.x,obj_battle_enemy.y-25,obj_battle_dmgnum);
		if(global.currentActiveTurn=="paps"){
			if(instance_exists(obj_battle_dmgnum)){with(obj_battle_dmgnum){color=color_weak; damage=player_calculate_damage(0,16,10,200)} with(obj_atk_bone_solo){instance_destroy()}};
		} else if(global.currentActiveTurn=="sans"){
				if(instance_exists(obj_battle_dmgnum)){with(obj_battle_dmgnum){color=color_weak; damage=1} with(obj_atk_bone_solo){instance_destroy()}};
		}
}