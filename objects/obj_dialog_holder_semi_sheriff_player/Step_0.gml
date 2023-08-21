if(live_call()) return live_result;
#region TURN 0 BANTER
if(global.currentBattleTurn==0
&&global.currentActiveTurn=="paps"
&&obj_battle_ui.papyrusTurnReady==false&&BTUI.enemyTurnReady==false&&instance_exists(obj_battle_ui)){
			dialogue[0]=str_set_loc("\\2IT'S HIGH NOON!", "BATTLE_SEMI_SHERIFF_TUTORIAL_FIRSTPASS_slash_0_0");
			dialogue1[0]=str_set_loc("\\2i think it's&half past&crime.", "BATTLE_SEMI_SHERIFF_TUTORIAL_FIRSTPASS_slash_1_0");
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==0){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue,1,"top",c_black,60,100)				
			}
		
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 &&dialogCount==1){
				newSpeechBubble(120,240,1,1,"sans",dialogue1,1,"left",c_black,160,275)
			}
			
			if(dialogCount>1){
				global.currentBattleTurn=1
				BTUI.papyrusTurnReady= true;
				BTUI.blockingInput=false;
				BTUI.fsm.change("turn_papyrus");
				dialogCount=0;
			}
		
}
#endregion
#region TURN 1 BANTER
if(global.currentBattleTurn==1
&&global.currentActiveTurn=="paps"
&&BTUI.papyrusTurnReady==false&&BTUI.enemyTurnReady==false){
			dialogue[0]="\\2IT SHOOTS BONES?!";
			dialogue1[0]="\\2guess they're in&plentiful supply.";
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==0){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue,1,"top",c_black,160,140)				
			}
		
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 &&dialogCount==1){
				newSpeechBubble(120,240,1,1,"sans",dialogue1,1,"left",c_black,270,320)
			}
			
			if(dialogCount>1){
				global.currentBattleTurn=2
				BTUI.papyrusTurnReady=true;
				BTUI.blockingInput=false;
				BTUI.fsm.change("turn_papyrus");
				dialogCount=0;
			}		
}
#endregion
#region TURN 2 BANTER
if(global.currentBattleTurn==2
&&global.currentActiveTurn=="paps"
&&BTUI.papyrusTurnReady==false&&BTUI.enemyTurnReady==false){
			dialogue[0]="\\2SANS, WE SEEM TO BE&IN A HIGH STAKES&BATTLE FOR OUR LIVES";
			dialogue1[0]="\\2WHAT ARE YOU DOING?!";
			dialogue3[0]="\\2NO, NO! I MEAN...";
			dialogue3[1]="\\2HOW ARE YOU HELPING!?!";
			dialogue2[0]="\\2standing around.";
			dialogue4[0]="\\2emotional support?";
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==0){
				newSpeechBubble(-15,0,2.5,1.5,"paps",dialogue,1,"top",c_black,160,100)				
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==1){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue1,1,"top",c_black,160,140)				
			}
		
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 &&dialogCount==2){
				newSpeechBubble(120,240,1,1,"sans",dialogue2,1,"left",c_black,270,320)
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==3){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue3,1,"top",c_black,160,140)				
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 &&dialogCount==4){
				newSpeechBubble(120,240,1.3,1,"sans",dialogue4,1,"left",c_black,270,320)
			}
			
			if(dialogCount>4){
				global.currentBattleTurn=3;
				BTUI.papyrusTurnReady= true;
				BTUI.blockingInput=false;
				BTUI.fsm.change("turn_papyrus");
				dialogCount=0;
			}		
}
#endregion
#region TURN 3 BANTER
if(global.currentBattleTurn==3
&&global.currentActiveTurn=="paps"
&&BTUI.papyrusTurnReady==false&&SEMI.overrideBulletDestruction==true&&SEMI.readyCutscene==true){
			dialogue[0]="\\2are you really&just gonna sit there&and take it?";
			dialogue1[0]="\\2WHAT?";
			dialogue2[0]="\\2I MEAN, I WANT THIS&TO BE A FAIR FIGHT!";
			dialogue3_1[0]="\\2you think it's fair&that some power-tripping&knucklehead wants to arrest us&for no reason?";
			dialogue4[0]="\\2...";
			dialogue5[0]="\\2YEAH.. GOOD POINT.";
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 &&dialogCount==0){
				newSpeechBubble(120,240,1,1,"sans",dialogue,1,"left",c_black,270,320)
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==1){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue1,1,"top",c_black,160,140)				
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==2){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue2,1,"top",c_black,160,140)				
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 &&dialogCount==3){
				newSpeechBubble(160,200,2,1.5,"sans",dialogue3_1,1,"left",c_black,380,300)
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==4){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue4,1,"top",c_black,160,140)				
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==5){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue5,1,"top",c_black,160,140)				
			}
			
			
			
			if(dialogCount>5){  
				global.currentBattleTurn=4;
				BTUI.papyrusTurnReady=false;
				BTUI.blockingInput=false;
				PAPS.canDodge=true;
				var _fx_struct = layer_get_fx("DESATURATION");
				if _fx_struct != -1
				{
					var _params = fx_get_parameters(_fx_struct);
					_params.g_Intensity=0;
	
					fx_set_parameters(_fx_struct, _params);
				}
				BTUI.fsm.change("turn_enemy");
				SEMI.image_speed=1;
				obj_atk_bullet.moveSpeed=2;
				dialogCount=0;
			}		
}
#endregion
#region TURN 4 BANTER
if(global.currentBattleTurn==4
&&global.currentActiveTurn=="paps"
&&BTUI.papyrusTurnReady==false&&SEMI.overrideBulletDestruction==true&&SEMI.readyCutscene==true){
			PAPS.canDodge=false;
			dialogue[0]="\\2Yew got moves, bones.&I'll give ye that!!";
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 &&dialogCount==0){
				newSpeechBubble(120,240,1,1,"semi",dialogue,1,"right",c_black,270,320)
			}
							
			if(dialogCount>0){  
				global.currentBattleTurn=5;
				BTUI.papyrusTurnReady=true;
				BTUI.blockingInput=false;
				SEMI.readyCutscene = false;
				SEMI.overrideBulletDestruction = false;
				
				BTUI.fsm.change("turn_papyrus");
				dialogCount=0;
			}		
}
#endregion
#region TURN 5 BANTER
if(global.currentBattleTurn==5
&&global.currentActiveTurn=="paps"
&&BTUI.papyrusTurnReady==false&&BTUI.enemyTurnReady==false){
			dialogue[0]="\\2SANS!!! CAN YOU SERIOUSLY&NOT BE BOTHERED&TO DO ANYTHING?!";
			dialogue1[0]="\\2THIS BATTLE'S GOING TO TAKE&FOREVER AT THIS RATE!";			
			dialogue2[0]="\\2CAN YOU PLEASE TRY ATACKING?";
			dialogue3[0]="\\2ok.";
			dialogue3[1]="\\2stand back, bro.&this'll really be something.";
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==0){
				newSpeechBubble(-15,0,2.5,1.5,"paps",dialogue,1,"top",c_black,160,100)				
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==1){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue1,1,"top",c_black,160,140)				
			}
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==1){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue2,1,"top",c_black,160,140)				
			}
		
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 &&dialogCount==2){
				newSpeechBubble(120,240,1,1,"sans",dialogue3,1,"left",c_black,270,320)
			}
			
			if(dialogCount>2){
				global.currentBattleTurn=6;
				global.currentActiveTurn="sans";
				BTUI.papyrusTurnReady= false;
				BTUI.sansTurnReady = true;
				BTUI.blockingInput=false;
				BTUI.fsm.change("turn_sans");
				dialogCount=0;
			}		
}
#endregion
#region TURN 6 BANTER
if(global.currentBattleTurn==6
&&global.currentActiveTurn=="sans"
&&BTUI.sansTurnReady==false&&BTUI.enemyTurnReady==false){
			dialogue[0]="\\2HEY!!! ARE YEW MOCKING&ME, BONEHEAD???";
			dialogue1[0]="\\2URGH, SANS!!!";			

			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 &&dialogCount==0){
				newSpeechBubble(120,240,1,1,"semi",dialogue,1,"right",c_black,270,320)
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==1){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue1,1,"top",c_black,160,140)				
			}
			
			if(dialogCount>1){
			//	BTUI.papyrusTurnReady= true;
				global.currentBattleTurn = 7;
				BTUI.fsm.change("turn_enemy");
				dialogCount=0;
			}		
}
#endregion
#region TURN 8 BANTER
if(global.currentBattleTurn==8
&&global.currentActiveTurn=="papyrus"
&&BTUI.papyrusTurnReady==false&&BTUI.enemyTurnReady==false){
			dialogue[0]="\\2MAYBE YOU SHOULDN'T ATTACK AFTER ALL";
			dialogue2[0]="\\2SURELY I CAN DO BETTER&THAN THIS PITIFUL DAMAGE… ";
			dialogue3[0]="\\2...";
			dialogue4[0]="\\2AHA, I'VE GOT IT!";
			dialogue5[0]="\\2WITH OUR POWERS&COMBINED, WE'RE UNSTOPPABLE!";
			dialogue6[0]="\\2PREPARE FOR A SKELE-BROS ATTACK!";
			dialogue7[0]="\\2NYEH HEH HEH!!!";
			dialogue1[0]="\\2ok.";			

			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==0){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue,1,"top",c_black,160,140)				
			}
		
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 &&dialogCount==1){
				newSpeechBubble(120,240,1,1,"sans",dialogue1,1,"left",c_black,270,320)
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==0){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue2,1,"top",c_black,160,140)				
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==0){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue3,1,"top",c_black,160,140)				
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==0){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue4,1,"top",c_black,160,140)				
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==0){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue5,1,"top",c_black,160,140)				
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==0){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue6,1,"top",c_black,160,140)				
			}
			
			if(instance_number(obj_dialogue_bubble)<1&&instance_number(obj_speech_bubble) < 1 && dialogCount==0){
				newSpeechBubble(-15,50,2.5,0.9,"paps",dialogue7,1,"top",c_black,160,140)				
			}
			
			if(dialogCount>1){
			//	BTUI.papyrusTurnReady= true;
				global.currentBattleTurn=9
				BTUI.papyrusTurnReady=true;
				BTUI.blockingInput=false;
				BTUI.fsm.change("turn_papyrus");
				dialogCount=0;
			}		
}
#endregion