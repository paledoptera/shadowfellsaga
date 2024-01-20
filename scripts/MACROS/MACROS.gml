#macro FRAME_RATE 60
#macro GAME_VERSION ="ALPHA v0.7"

#macro RES_W 640
#macro RES_H 480
#macro RES_SCALE 1

// Shortcut macros, saves time when writing out code with these objects
#macro PLAYER obj_ow_player
#macro FOLLOWER obj_ow_p_follower
#macro WALL obj_wall
#macro BORDER handler_border
#macro GAME ctrl_global
#macro CAM ctrl_camera
#macro CS ctrl_cutscene

#macro BTUI    obj_battle_ui
#macro FIGHT obj_battle_fight_button
#macro RUN obj_battle_run_button
#macro PASS obj_battle_pass_button
#macro SPECIAL obj_battle_special_button // Referred to as "Bros" in-game, this is the button that allows players to access sans and paps bros attacks
#macro ITEM obj_battle_item_button

#macro PAPS obj_battle_paps
#macro SANS obj_battle_sans

#macro FLAVOR_PAPS obj_dialogue_battle_paps
#macro FLAVOR_SANS obj_dialogue_battle_sans
// Enemies
#macro SEMI obj_battle_enemy_semi_sheriff

// Macro used for UI depth, advisable not to use for non UI elements
#macro DEPTH_UI -100
#macro DEPTH_BORDER -400;
#macro DEPTH_ENEMY 300