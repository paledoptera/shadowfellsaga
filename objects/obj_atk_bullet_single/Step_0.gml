timer++;

if(timer>=timerMax){
	with(global.enc_slot[1]){
		event_perform(ev_other,ev_user1)	// Call the 'turn end' event from the enemy, trigger any necessary events there
	}	
}