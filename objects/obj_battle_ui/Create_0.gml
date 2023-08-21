depth=DEPTH_UI;
selectedBattleChar=0;	// Currently active bro
selectedAction=0;			// Currently selected battle button
actionType=-1;			// Determines the currently active action
bonesToShoot=0;		// Amount of bones the player is currently allowed to shoot
blockingInput=false; // Whether or not to block input, recommended to temporarily toggle this on after speech bubbles are finished
optionsAvailable=1;		// Determines which battle options will be available for progression purposes.
											// 0 - none
											// 1 - Solo ONLY
											// 2 - Solo and Bros
											// 3 - Solo, Bros and Flee
											// 4 - Solo, Bros, Flee and Pass
											// 5 - Solo, Bross, Flee, Pass and Item
											
global.currentBattleTurn=0; // The reason we're defining this as a global is so 
										// that we can easily access it within our enemy objects 
										// for the sake of triggering specific events on specific turns
global.currentActiveTurn = "none"; // Used to 'key' a character, easily store data for text
enemyTarget = 0;			// Determines what enemy is currently being targeted
storedEnemyTarget=-1;  // Stored value of enemyTarget on menu end
partyMemberTarget = 0; // Determines which party member is being targeted
									// NOTE: Will always be Papyrus until he's downed, then enemies will focus on sans
patternType = 0;
camZoom=1.2;
global.enemyTurn = "none";	// secondary variable for active turn, used ONLY by enemies
cutsceneCreated=false;
papyrusTurnReady=false; // If it's either of the bros turn, and a speech bubble is active, keep this at false
					// else, set it to true. and create the battle buttons
sansTurnReady=false; // This will ONLY be set to active when paps is down, with minimal to no exception
enemyTurnReady=false; // Determines whether or not to set the enemy turn state
specAlpha=0;
lineX=0;
lineX2=0;
attackReady=true;
attackFinished=false;
specSceneStarted=false;  

targetIndex=0;
targetXOffset=0;
targetYOffset = 0;

#region CAMERA MOVEMENT TURN DATA
t_scene_info_paps = [
		[cutscene_cam_zoom,1.3,false,20],
		[cutscene_move_camera,300,200,false,3]
		// add more cutscene actions here as needed
]

t_scene_info_sans = [
		[cutscene_cam_zoom,1.3,false,20],
		[cutscene_move_camera,300,318,false,3]
		// add more cutscene actions here as needed
]

t_scene_info_enemy_1 = [
		[cutscene_wait,0.5],
		[cutscene_cam_zoom,camZoom,false,20],
		[cutscene_move_camera,450,250,false,3],
		[cutscene_end]
		// add more cutscene actions here as needed
]


t_scene_info_paps_solo = [
		[cutscene_cam_zoom,1.2,false,20],
		[cutscene_move_camera,300,200,false,3]
		// add more cutscene actions here as needed
]

t_scene_info_sans_solo = [
		[cutscene_cam_zoom,1.2,false,20],
		[cutscene_move_camera,300,300,false,3]
		// add more cutscene actions here as needed
]

#endregion

fsm = new SnowState("turn_papyrus");

#region PAPYRUS TURN STATE
fsm
			.add("turn_papyrus", {
				enter: function() {
					global.currentActiveTurn="paps";
										selectedBattleChar = 0;
					PAPS.canDodge = false;
					#region INITIALIZE BATTLE BLOCKS
					if(papyrusTurnReady==true){
						blockingInput=false;
						if(optionsAvailable==2){
							if(!instance_exists(SPECIAL)){
								instance_create(PAPS.x-15,PAPS.y-180,SPECIAL);
							}
							with(SPECIAL){scale=0.9};
							if(!instance_exists(FIGHT)){
								instance_create(PAPS.x-25,PAPS.y-150,FIGHT);
							}
							if(instance_exists(FIGHT)){
								with(FIGHT){
									scale=1.5;
									image_index=1;
								}
							}
						} else if(optionsAvailable==1){
							if(!instance_exists(FIGHT)){
								instance_create(PAPS.x-25,PAPS.y-110,FIGHT);
							}
							if(instance_exists(FIGHT)){
								with(FIGHT){
									scale=1.5;
									image_index=1;
								}
							}
						}
						if(optionsAvailable>3){
							instance_create(PAPS.x-25,PAPS.y-150,FIGHT);
							if(instance_exists(FIGHT)){
								with(FIGHT){
									scale=1.5;
									image_index=1;
								}
							}
						//	instance_create(PAPS.x-20,PAPS.y-170,ITEM);
					//		with(ITEM){scale=0.8};
					//		instance_create(PAPS.x-70,PAPS.y-160,SPECIAL);
					//		with(SPECIAL){scale=0.9};
							
						} else if(optionsAvailable==3){
							if(!instance_exists(RUN)){
								instance_create(PAPS.x-15,PAPS.y-110,RUN);
							}
							if(!instance_exists(SPECIAL)){
								instance_create(PAPS.x-15,PAPS.y-110,SPECIAL);
							}
							with(SPECIAL){scale=0.9};
							instance_create(PAPS.x-25,PAPS.y-110,FIGHT);
							if(instance_exists(FIGHT)){
								with(FIGHT){
									scale=1.5;
									image_index=1;
								}
							}
						}
					}
					#endregion
				},
				step: function(){
					if(papyrusTurnReady==true&&attackReady){
							fsm.change("menu_begin");
					}
				}
			});
#endregion

#region SANS TURN STATE 
fsm
			.add("turn_sans", {
				enter: function() {
					global.currentActiveTurn="sans";
					selectedBattleChar = 1;
					create_cutscene(t_scene_info_sans)
					SANS.canDodge = false;
					#region INITIALIZE BATTLE BLOCKS
					if(sansTurnReady==true){
						blockingInput=false;
						if(optionsAvailable==2){
							if(!instance_exists(SPECIAL)){
								instance_create(SANS.x-15,SANS.y-180,SPECIAL);
							}
							with(SPECIAL){scale=0.9};
							if(!instance_exists(FIGHT)){
								instance_create(SANS.x-25,SANS.y-150,FIGHT);
							}
							if(instance_exists(FIGHT)){
								with(FIGHT){
									scale=1.5;
									image_index=1;
								}
							}
						} else if(optionsAvailable==1){
							if(!instance_exists(FIGHT)){
								instance_create(SANS.x-25,SANS.y-110,FIGHT);
							}
							if(instance_exists(FIGHT)){
								with(FIGHT){
									scale=1.5;
									image_index=1;
								}
							}
						}
						if(optionsAvailable>3){
							instance_create(SANS.x-25,SANS.y-150,FIGHT);
							if(instance_exists(FIGHT)){
								with(FIGHT){
									scale=1.5;
									image_index=1;
								}
							}
							instance_create(SANS.x-20,SANS.y-170,ITEM);
							with(ITEM){scale=0.8};
							instance_create(SANS.x-70,SANS.y-160,SPECIAL);
							with(SPECIAL){scale=0.9};
						} else if(optionsAvailable==3){
							instance_create(SANS.x-25,SANS.y-150,FIGHT);
							if(instance_exists(FIGHT)){
								with(FIGHT){
									scale=1.5;
									image_index=1;
								}
							}
						}
					}
					#endregion
				},
				step: function(){
					if(sansTurnReady==true&&attackReady){
							fsm.change("menu_begin");
					}
				}
			});
#endregion

#region ENEMY TURN STATES
fsm 
	.add("turn_enemy",{
		enter: function() {
			
		},
		step: function() {
			switch(storedEnemyTarget){
				case 0:
				
				break;
				case 1:
					create_cutscene(t_scene_info_enemy_1)
					fsm.change("enemy_attacking");
				break;
				case 2:
				
				break;
			}
		},
		leave: function() {
		}
	})
#endregion
	
#region ENEMY ATTACKING STATE
fsm
	.add("enemy_attacking", {
		enter: function() {
			if(global.enc_slot[1]!=noone){
						with(global.enc_slot[1]){
							event_perform(ev_other,ev_user0);
						}
					}
		},
		step: function() {
			
		},
		leave: function(){
			lineX=0;
		}
	})
	
#endregion
		
#region MENU PROCESSING STATE
fsm
			.add("menu_begin", {
				enter: function() {
					selectedAction=0;
				},
				step: function(){
					if(attackReady==true){
						event_user(0);
					}
					
					#region CHECK INPUTS AND UPDATE SELECTION
					switch(optionsAvailable){
						case 1:
							if(input_key_pressed(global.key_right)){
								selectedAction=number_add(selectedAction,1,1);
							}
							if(input_key_pressed(global.key_left)){
								selectedAction=number_sub(selectedAction,0,1)
							}
						break;
						case 2:
							if(input_key_pressed(global.key_right)){
								selectedAction=number_add(selectedAction,2,1);
							}
							if(input_key_pressed(global.key_left)){
								selectedAction=number_sub(selectedAction,0,1)
							}
						case 3:
							if(input_key_pressed(global.key_right)){
								selectedAction=number_add(selectedAction,3,1);
							}
							if(input_key_pressed(global.key_left)){
								selectedAction=number_sub(selectedAction,0,1)
							}
						break;
					}
				
					switch(global.currentActiveTurn){
						case "paps":
							create_cutscene(t_scene_info_paps)
						break;
						case "sans":
							create_cutscene(t_scene_info_sans)
						break;
					}
					#endregion
				}
			});
#endregion

#region SOLO ATK STATE
fsm 
			.add("choice_solo",{
				enter: function() {
					actionType=1;
					enemyTarget=1;
					attackReady=true;
					storedEnemyTarget=enemyTarget;
					patternType=choose(0,1);
					
						#region Clear Battle Buttons
						if(instance_exists(ITEM)){
							instance_destroy(ITEM);
						}
						if(instance_exists(FIGHT)){
							instance_destroy(FIGHT);	
						}
						if(instance_exists(SPECIAL)){
							instance_destroy(SPECIAL);	
						}
						#endregion
					
					TweenFire(id,EaseLinear,0,0,0,120,"lineX",lineX,250);
					TweenFire(id,EaseLinear,0,0,0,15,"specAlpha",specAlpha,1);
					
				},
				step: function() {													
						switch(global.currentActiveTurn){
						case "paps":
							if(enemyTarget==1){
								create_cutscene(t_scene_info_paps_solo)
							}
						break;
						case "sans":
							if(enemyTarget==1){
								create_cutscene(t_scene_info_sans_solo)
							}
						break;
						}				
										
						#region PROCESS INPUT, CHECK RHYTHM TIMING AND UPDATE BONE ALLOWED VALUE					
						switch(patternType){
							case 0:
								// "Z" "Z"    "Z"    "Z"
								// "X" "X"    "X"    "X"
								var boneShotIncrementable=false;
								if lineX >= 24 && lineX < 26 {
									if input_key_pressed(global.key_action) {
										boneShotIncrementable=true;	// Almost can shoot one bone
									}
								}
								if lineX >= 27 && lineX < 33 {
									if input_key_pressed(global.key_action) {
										if(boneShotIncrementable==true)
											bonesToShoot+=1;	// Can now shoot one bones
									}
								}
								if lineX >= 94 && lineX < 120 {
									if input_key_pressed(global.key_action) {
										bonesToShoot+=1;	// Can now shoot two bones
														// * gettin' awfully close to that sweet bonus damage
									}
								}
								if lineX >= 160 && lineX < 180 {
									if input_key_pressed(global.key_action) {
										bonesToShoot+=1;	// Can now shoot two bones
														// * gettin' awfully close to that sweet bonus damage
									}
								}
							break;
							
							case 1:
								// "Z"       "Z"   "Z"
								// "X"		"X"   "X"
								if lineX>=18 && lineX < 30 {
									if input_key_pressed(global.key_action) {
										bonesToShoot+=1;	// Can now shoot one bone
									}
								}
								if lineX>=107 && lineX < 160 {
									if input_key_pressed(global.key_action) {
										bonesToShoot+=1;	// Can now shoot two bones
														// * gettin' awfully close to that sweet bonus damage
									}
								}
								if lineX>=170 && lineX < 200 {
									if input_key_pressed(global.key_action) {
										bonesToShoot+=1;	// Sweet, sweet bonus damage, at long last, we have you
									}
								}
							break;
						} 
						
						if lineX>=230 {
							TweenFire(id,EaseLinear,0,0,0,15,"specAlpha",specAlpha,0);
							actionType=-1;
							fsm.change("menu_end");
						}	
						#endregion
				},
				leave: function() {
					enemyTurnReady = true;
					alarm[0] = 1;
				}
			});
#endregion

#region BROS ATK STATE
fsm
			.add("choice_bros",{
			enter: function() {
					actionType=2;
					
					#region Clear Battle Buttons
					if(instance_exists(ITEM)){
						instance_destroy(ITEM);
					}
					if(instance_exists(FIGHT)){
						instance_destroy(FIGHT);	
					}
					if(instance_exists(SPECIAL)){
						instance_destroy(SPECIAL);	
					}
					#endregion
				}
			});			
#endregion

#region INVENTORY STATE
fsm
			.add("choice_item",{
				
			});
#endregion
			
#region PASS TURN STATE
fsm
			.add("choice_special",{
				
			});
#endregion

#region END MENU PROCESSING
fsm
			.add("menu_end",{
					enter: function(){
						#region REGISTER AND CREATE BONE INSTANCES
						if(!attackFinished){
							if(bonesToShoot==0){
									instance_create(obj_battle_enemy.x,obj_battle_enemy.y-25,obj_battle_dmgnum);
									if(instance_exists(obj_battle_dmgnum)){with(obj_battle_dmgnum){color=c_gray; damage=-1}};
								} else {
									switch(bonesToShoot){
											case 1:
												if(global.currentActiveTurn=="paps"){
													create_bone(PAPS.x-80,PAPS.y-100,1,1,12,-10);
												} else if(global.currentActiveTurn=="sans"){
													create_bone(SANS.x-80,SANS.y-100,1,1,12,-10);
												}
											break;
										
											case 2:
												if(global.currentActiveTurn=="paps"){
													create_bone(PAPS.x-80,PAPS.y-100,1,1,12,-10);
													create_bone(PAPS.x-80,PAPS.y-40,1,1,12,-10);
												} else if(global.currentActiveTurn=="sans"){
													create_bone(SANS.x-80,SANS.y-100,1,1,12,-10);
													create_bone(SANS.x-80,SANS.y-40,1,1,12,-10);
												}
	
												global.elementBonusDamage=global.elementBonusDamage+5;
											break;
											case 3:
												if(global.currentActiveTurn=="paps"){
													create_bone(PAPS.x-80,PAPS.y-70,1,1,12,-10);
													create_bone(PAPS.x-80,PAPS.y-100,1,1,12,-10);
													create_bone(PAPS.x-80,PAPS.y-40,1,1,12,-10);
												} else if(global.currentActiveTurn=="sans"){
													create_bone(SANS.x-80,SANS.y-70,1,1,12,-10);
													create_bone(SANS.x-80,SANS.y-100,1,1,12,-10);
													create_bone(SANS.x-80,SANS.y-40,1,1,12,-10);
												}
												global.elementBonusDamage=global.elementBonusDamage+8;
											break;
									}
								}
						}
						#endregion
						#region Clear Battle Buttons
							if(instance_exists(ITEM)){
								instance_destroy(ITEM);
							}
							if(instance_exists(FIGHT)){
								instance_destroy(FIGHT);	
							}
							if(instance_exists(SPECIAL)){
								instance_destroy(SPECIAL);	
							}
						#endregion	
						
						enemyTarget=-1;
						
						enemyTurnReady=true;
					//	alarm[0]=1;
							
					//		global.currentActiveTurn=global.enemyTurn;	
					},
					step: function() {					
					//	switch(global.currentActiveTurn){
					//		case "paps":
					//			create_cutscene(t_scene_info_paps_solo)
					//		break;
					//		case "sans":
				//		
				//			break;
			//			}		
						if lineX > 0 { lineX=0; }; // Reset lineX for next use
						bonesToShoot=0; // Reset shootable bones for next use
						if enemyTurnReady == true {
							fsm.change("turn_enemy");
						}
					}
			});
#endregion
