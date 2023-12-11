depth = -y;
height = 40;

_inst = obj_wall;
_inst_fol = obj_wall_f

_inst_spawn = -1;
_inst_spawn_fol = -1;

//if you're wondering why these are functions, it's so that i can make changes to them if need be
//without going over and replacing multiple instances of code
spawn_walls = function()
{
	_inst_spawn = instance_create(x,y,_inst);
	_inst_spawn.depth = depth-1
	_inst_spawn.image_xscale = image_xscale;
}

spawn_fol_walls = function()
{
	_inst_spawn_fol = instance_create(x,y,_inst_fol);
	_inst_spawn_fol.depth = depth-1
	_inst_spawn_fol.image_xscale = image_xscale;
}


wallspawn = true;
fol_wallspawn = true;

in_range = false;

walkable = false;
fol_walkable = false;

direction = image_angle;
