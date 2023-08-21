_enemy_slot=-1;
_list_attacks=ds_map_create();

// 
// in your enemy object run ds_list add(_list_attacks,) and after the first comma, add in any attacks you want this enemy to make use of

// -1 = Skips enemy transition, sets directly to idle phase
// 0 = Introduction/Default
// 1 - Cutscene
// 2 = Defeated
_transition_type=-1;   

enemy_transition=-1;

// Do not modify this directly
// Uses the current image_index as the sprite to display during the idle phase of the enemy
enemy_idle=sprite_index;

// -1 = Undefined
// Set value to the desired sprite

// -1 = Undefined
// Set value to the desired sprite
enemy_attack=-1;

// -1 = Undefined
// Set value to the desired sprite
enemy_hurt=-1;  

//enemy_posx=490;  
//enemy_posy=220;

enemy_fsm = new SnowState("cutscene")

enemy_fsm
			.add("idle", {
				enter: function() {
					sprite_index=enemy_idle;
				},
			});
		
enemy_fsm 
			.add("cutscene", {
				enter: function() {
					if(_transition_type>-1){
						enemy_cpose=sprite_index;
					} else {
						enemy_fsm.change("idle");	
					}
				},
			});	

//slot 1 enemy xy
//554 
//230