timer++;

if(timer>=timerMax){
	with(global.enc_slot[1]){
		event_perform(ev_other,ev_user1)	// Call the 'turn end' event from the enemy, trigger any necessary events there
	}	
}

if(!instance_exists(obj_atk_bullet)&&readyCutscene){
	PAPS.canDodge=false;	
}