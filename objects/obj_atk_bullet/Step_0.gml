switch(target){
	case PAPS:
		image_angle=-190;
	break;
	case SANS:
	
	break;
}
if(obj_battle_ui.specAlpha=0){
		move_towards_point(170,192,moveSpeed)
	}
if(place_meeting(x+25,y,target)){
		if(!instance_exists(obj_battle_dmgnum)){
			instance_create(PAPS.x,PAPS.y-25,obj_battle_dmgnum);
		}
		with(target){
			event_perform(ev_other,ev_user0);	
		}
		if(instance_exists(obj_battle_dmgnum)){with(obj_battle_dmgnum){color=color_weak; damage=10; global.partyhp[0]._curr-=damage;} with(id){instance_destroy()}};
}

create_cutscene(t_scene_info_follow_bullet_paps);