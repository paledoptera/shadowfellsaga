// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_z_collision(){

	#region SETTING ZFLOOR
	var _col_list = ds_list_create();
	var _col = instance_place_list(x,y,obj_wall_h1,_col_list,false);
	
	if _col > 0
	{
		var _highest_zfloor = 0;

		for (var i = 0; i < _col; i++;)
		{
			if place_meeting(x,y,_col_list[| i])
			{
				if _col_list[| i].height > _highest_zfloor {_highest_zfloor = _col_list[| i].height}
			}
		}
		zfloor = -_highest_zfloor-0.1
	}
	else {zfloor = 0;}
	
	#endregion
	
}