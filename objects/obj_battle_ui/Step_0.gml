if(live_call()) return live_result;
fsm.step();
if(global.partyhp[0]._curr<0){
		global.partyhp[0]._curr=0;
}
if(global.partyhp[1]._curr<0){
		global.partyhp[1]._curr=0;
}
if(optionsAvailable==1){
	selectedAction=clamp(selectedAction,0,0);	
} else if(optionsAvailable==2){
	selectedAction=clamp(selectedAction,0,1);	
} else if(optionsAvailable==3){
	selectedAction=clamp(selectedAction,0,2);	
}

//if(input_key_pressed(global.key_cancel))&&actionType!=1&&actionType!=2&&enemyTurnReady==false {
//	actionType=-1;	
//	fsm.change("turn_papyrus");
//}
if(actionType<0){
	switch(selectedAction){
		#region Fight
		case 0:
			if(optionsAvailable==1){
				if(instance_exists(FIGHT)){
					FIGHT.image_index=1;
					FIGHT.alpha=1;
					FIGHT.depth=-200;
				}
			}
			if(optionsAvailable==2){
				if(instance_exists(SPECIAL)){
					SPECIAL.image_index=0;
					SPECIAL.alpha=0.5;
					SPECIAL.depth=-100;	
				}
				if(instance_exists(FIGHT)){
					FIGHT.image_index=1;
					FIGHT.alpha=1;
					FIGHT.depth=-200;
				}
			}
			if(optionsAvailable==3){
				if(instance_exists(RUN)){
					RUN.image_index=0;
					RUN.alpha=0.5;
					RUN.depth=-50;
				}
				if(instance_exists(SPECIAL)){
					SPECIAL.image_index=0;
					SPECIAL.alpha=0.5;
					SPECIAL.depth=-100;	
				}
			if(instance_exists(FIGHT)){
					FIGHT.image_index=1;
					FIGHT.alpha=1;
					FIGHT.depth=-200;
				}
			}
			if(papyrusTurnReady==true){
				if(input_key_pressed(global.key_action)){
					fsm.change("choice_solo");
				}
			}
			if(sansTurnReady==true){
				if(input_key_pressed(global.key_action)){
					fsm.change("choice_solo");
				}
			}
			break;
		#endregion
		#region Bros
		case 1:
			FIGHT.image_index=0;
			FIGHT.alpha=0.5;
			//ACT.image_index=0;
			//ACT.alpha=0.5
			if(optionsAvailable==2){
				SPECIAL.image_index=1;
				SPECIAL.alpha=1;
				SPECIAL.depth=-200;
			}
			if(optionsAvailable>3){
			ITEM.image_index=0;
			ITEM.alpha=0.5
			ITEM.depth=-100;
			} 
			if(optionsAvailable==3){
				if(instance_exists(RUN)){
					RUN.image_index=0;
					RUN.alpha=0.5;
					RUN.depth=-50;
				}
				if(instance_exists(SPECIAL)){
					SPECIAL.image_index=1;
					SPECIAL.alpha=1;
					SPECIAL.depth=-200;	
				}
			if(instance_exists(FIGHT)){
					FIGHT.image_index=0;
					FIGHT.alpha=0.5;
					FIGHT.depth=-100;
				}
			}
			if(pressed("action")){
				fsm.change("choice_bros");
			}
			break;
		#endregion
		#region Run
		case 2:
			if(optionsAvailable==2){
			SPECIAL.image_index=0;
			SPECIAL.alpha=0.5
			}
			if(optionsAvailable>3){
			ITEM.image_index=0;
			ITEM.alpha=0.5
			}
			if(optionsAvailable==3){
				if(instance_exists(RUN)){
					RUN.image_index=1;
					RUN.alpha=1;
					RUN.depth=-200;
				}
				if(instance_exists(SPECIAL)){
					SPECIAL.image_index=0;
					SPECIAL.alpha=0.5;
					SPECIAL.depth=-100;	
				}
			if(instance_exists(FIGHT)){
					FIGHT.image_index=0;
					FIGHT.alpha=0.5;
					FIGHT.depth=-100;
				}
			}
			break;
		#endregion
		#region Pass
		case 3:
			FIGHT.image_index=0;
			FIGHT.alpha=0.5
			//ACT.image_index=0;
			///ACT.alpha=0.5;
			if(optionsAvailable==2){
			SPECIAL.image_index=0;
			SPECIAL.alpha=0.5
			SPECIAL.depth=100;
			}
			if(optionsAvailable>3){
			ITEM.image_index=1;
			ITEM.alpha=1;
			ITEM.depth=-200;
			}
			break;
			#endregion
	}
}

targetIndex+=1/12;

show_debug_message("Current Battle Turn: " + string(global.currentBattleTurn))