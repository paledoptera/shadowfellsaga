// Mostly just a placeholder at this point, as SnowState will likely be in use to process state data

function fsm_init(){
	enum STATE_BATTLE {
		MENU_BEGIN, 
		MENU_END,
		FIGHT_BEGIN, // Targeting
		FIGHT_END, // Attacked
		SPECIAL_BEGIN, // Choosing special
		SPECIAL_END, // Special used
		ACT_BEGIN, 
		ACT_END,
		ITEM_BEGIN, // Choosing item
		ITEM_END,
		TURN_BEGIN, // Start a turn as definied in STATE_TURN
		TURN_END, // End the current turn
		DIALOGUE // Show a speech bubble
	}
	enum STATE_TURN {
		IDLE,
		PAPYRUS,
		SANS,
		ENEMY_TURN	
	}
	enum STATE_ENEMY {
		ACTIVE,
		ATTACKING,
		DEFEATED
	}
	enum STATE_MENU_SAVE {
		INACTIVE,
		SELECTING_FILE,
		FILE_CHOSEN,
		FILE_SAVED,
		FILE_OVERWITTEN,
		COPYING_FILE,
		FILE_COPIED,
		DELETING_FILE,
		FILE_DELETED	
	}
}
