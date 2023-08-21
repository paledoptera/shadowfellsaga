if(live_call()) return live_result;
/// @desc Tween Button Position
switch(selectedAction){
		case 0:		
			if(optionsAvailable==2){
				execute_tween(FIGHT,"x",PAPS.x-25,"linear",0.125);
				execute_tween(FIGHT,"y",PAPS.y-150,"linear",0.125);
				execute_tween(FIGHT,"scale",1.5,"linear",0.125);
			
				execute_tween(SPECIAL,"x",PAPS.x-15,"linear",0.125);
				execute_tween(SPECIAL,"y",PAPS.y-180,"linear",0.125);			
				execute_tween(SPECIAL,"scale",0.9,"linear",0.125);
			
			//execute_tween(ITEM,"x",PAPS.x-60,"linear",0.125);
			//execute_tween(ITEM,"y",PAPS.y-160,"linear",0.125);
			//execute_tween(ITEM,"scale",0.9,"linear",0.125);
			}
			if(optionsAvailable==3){
				execute_tween(FIGHT,"x",PAPS.x-25,"linear",0.125);
				execute_tween(FIGHT,"y",PAPS.y-110,"linear",0.125);
				execute_tween(FIGHT,"scale",1.5,"linear",0.125);
			
				execute_tween(SPECIAL,"x",PAPS.x-50,"linear",0.125);
				execute_tween(SPECIAL,"y",PAPS.y-120,"linear",0.125);			
				execute_tween(SPECIAL,"scale",0.9,"linear",0.125);
				
				execute_tween(RUN,"x",PAPS.x+10,"linear",0.125);
				execute_tween(RUN,"y",PAPS.y-120,"linear",0.125);			
				execute_tween(RUN,"scale",0.9,"linear",0.125);
			}
			
			//execute_tween(ACT,"x",PAPS.x-(-30),"linear",0.125);
			//execute_tween(ACT,"y",PAPS.y-160,"linear",0.125);
			//execute_tween(ACT,"scale",0.9,"linear",0.125);
			break;
		case 1:
			if(optionsAvailable==2){
			execute_tween(FIGHT,"x",PAPS.x-15,"linear",0.125);
			execute_tween(FIGHT,"y",PAPS.y-180,"linear",0.125);
			execute_tween(FIGHT,"scale",0.9,"linear",0.125);
			
			execute_tween(SPECIAL,"x",PAPS.x-25,"linear",0.125);
			execute_tween(SPECIAL,"y",PAPS.y-150,"linear",0.125);			
			execute_tween(SPECIAL,"scale",1.5,"linear",0.125);
			} 
			if(optionsAvailable==3){
				execute_tween(FIGHT,"x",PAPS.x+10,"linear",0.125);
				execute_tween(FIGHT,"y",PAPS.y-120,"linear",0.125);
				execute_tween(FIGHT,"scale",0.9,"linear",0.125);
			
				execute_tween(SPECIAL,"x",PAPS.x-25,"linear",0.125);
				execute_tween(SPECIAL,"y",PAPS.y-110,"linear",0.125);			
				execute_tween(SPECIAL,"scale",1.5,"linear",0.125);
				
				execute_tween(RUN,"x",PAPS.x-50,"linear",0.125);
				execute_tween(RUN,"y",PAPS.y-120,"linear",0.125);			
				execute_tween(RUN,"scale",0.9,"linear",0.125);
			}
			// else if(optionsAvailable<4){
			//	execute_tween(ITEM,"x",PAPS.x-(-30),"linear",0.125);
			//	execute_tween(ITEM,"y",PAPS.y-160,"linear",0.125);
			//	execute_tween(ITEM,"scale",0.8,"linear",0.125);
			//}
			break;
		case 2:
			execute_tween(FIGHT,"x",PAPS.x-20,"linear",0.125);
			execute_tween(FIGHT,"y",PAPS.y-170,"linear",0.125);
			execute_tween(FIGHT,"scale",0.8,"linear",0.125);
			
			//execute_tween(ITEM,"x",PAPS.x-(-30),"linear",0.125);
			//execute_tween(ITEM,"y",PAPS.y-160,"linear",0.125);
			//execute_tween(ITEM,"scale",0.9,"linear",0.125);
			
			if(optionsAvailable>3){
			execute_tween(SPECIAL,"x",PAPS.x-70,"linear",0.125);
			execute_tween(SPECIAL,"y",PAPS.y-160,"linear",0.125);
			execute_tween(SPECIAL,"scale",0.9,"linear",0.125);
			}
			if(optionsAvailable==3){
				execute_tween(FIGHT,"x",PAPS.x-50,"linear",0.125);
				execute_tween(FIGHT,"y",PAPS.y-120,"linear",0.125);
				execute_tween(FIGHT,"scale",0.9,"linear",0.125);
			
				execute_tween(SPECIAL,"x",PAPS.x+10,"linear",0.125);
				execute_tween(SPECIAL,"y",PAPS.y-120,"linear",0.125);			
				execute_tween(SPECIAL,"scale",0.9,"linear",0.125);
				
				execute_tween(RUN,"x",PAPS.x-25,"linear",0.125);
				execute_tween(RUN,"y",PAPS.y-110,"linear",0.125);			
				execute_tween(RUN,"scale",1.5,"linear",0.125);
			}
			
			//execute_tween(ACT,"x",PAPS.x-25,"linear",0.125);
			//execute_tween(ACT,"y",PAPS.y-150,"linear",0.125);
			//execute_tween(ACT,"scale",1.5,"linear",0.125);
			break;
		case 3:
			execute_tween(FIGHT,"x",PAPS.x-(-30),"linear",0.125);
			execute_tween(FIGHT,"y",PAPS.y-160,"linear",0.125);
			execute_tween(FIGHT,"scale",0.9,"linear",0.125);
			
			if(optionsAvailable>3){
			execute_tween(SPECIAL,"x",PAPS.x-20,"linear",0.125);
			execute_tween(SPECIAL,"y",PAPS.y-170,"linear",0.125);
			execute_tween(SPECIAL,"scale",0.8,"linear",0.125);
			
			//execute_tween(ITEM,"x",PAPS.x-25,"linear",0.125);
			//execute_tween(ITEM,"y",PAPS.y-150,"linear",0.125);
			//execute_tween(ITEM,"scale",1.5,"linear",0.125);
			}
			
			//execute_tween(ACT,"x",PAPS.x-70,"linear",0.125);
			//execute_tween(ACT,"y",PAPS.y-160,"linear",0.125);
			//execute_tween(ACT,"scale",0.9,"linear",0.125);
			break;
}