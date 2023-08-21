///@desc Freeze Time
SEMI.image_speed=0;
SEMI.overrideBulletDestruction=true;
obj_atk_bullet.moveSpeed=0;
var _fx_struct = layer_get_fx("DESATURATION");
if _fx_struct != -1
{
	var _params = fx_get_parameters(_fx_struct);
	_params.g_Intensity=0.7;
	
	fx_set_parameters(_fx_struct, _params);
}
SEMI.readyCutscene=true;
BTUI.enemyTurnReady=false;