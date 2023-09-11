depth = -y;
height = 40;

wallspawn = true;
fol_wallspawn = true;
walkable = false;
fol_walkable = false;
sprite_index = spr_ts_carrionisles_platforms1

_img_top = 0;
_img_wall = 14;

___inst = instance_create(x,y,obj_walltemp);
___inst.depth = depth-1

___inst2 = instance_create(x,y,obj_walltemp_f);
___inst2.depth = depth-1

//-SETTING TOP FACE SPRITE-
//DEFAULT, top left corner
_img_top = 0; bottomcovered = true;
//bottom left corner
if place_meeting(x,y-40,obj_wall_h1) {_img_top = 2; _img_wall = 13; bottomcovered = false;} 
//top right corner
if place_meeting(x-40,y,obj_wall_h1) and place_meeting(x,y+40,obj_wall_h1) {_img_top = 6; bottomcovered = true;} 
//bottom right corner
if place_meeting(x-40,y,obj_wall_h1) and place_meeting(x,y-40,obj_wall_h1) {_img_top = 8; _img_wall = 15; bottomcovered = false;}
//middle left edge
if place_meeting(x,y-40,obj_wall_h1) and place_meeting(x,y+40,obj_wall_h1) {_img_top = 1; bottomcovered = true;} 
//top middle edge
if place_meeting(x-40,y,obj_wall_h1) and place_meeting(x+40,y,obj_wall_h1) {_img_top = 3; bottomcovered = true;} 
//bottom middle edge
if place_meeting(x-40,y,obj_wall_h1) and place_meeting(x+40,y,obj_wall_h1) and place_meeting(x,y-40,obj_wall_h1) {_img_top = 5; _img_wall = 14; bottomcovered = false;} 
//middle right edge
if place_meeting(x,y-40,obj_wall_h1) and place_meeting(x,y+40,obj_wall_h1) and place_meeting(x-40,y,obj_wall_h1) {_img_top = 7; bottomcovered = true;} 

//connecting top left corner to top left corner
if !place_meeting(x-40,y-40,obj_wall_h1) and place_meeting(x,y-40,obj_wall_h1) and place_meeting(x+40,y-40,obj_wall_h1) 
and place_meeting(x-40,y,obj_wall_h1)										 and place_meeting(x+40,y,obj_wall_h1) 
and place_meeting(x-40,y+40,obj_wall_h1) and place_meeting(x,y+40,obj_wall_h1) and place_meeting(x+40,y+40,obj_wall_h1) {_img_top = 9; bottomcovered = true;}

//connecting top right corner to top right corner
if place_meeting(x-40,y-40,obj_wall_h1) and place_meeting(x,y-40,obj_wall_h1) and !place_meeting(x+40,y-40,obj_wall_h1) 
and place_meeting(x-40,y,obj_wall_h1)										 and place_meeting(x+40,y,obj_wall_h1) 
and place_meeting(x-40,y+40,obj_wall_h1) and place_meeting(x,y+40,obj_wall_h1) and place_meeting(x+40,y+40,obj_wall_h1) {_img_top = 10; bottomcovered = true;}

//connecting bottom left corner to bottom left corner
if place_meeting(x-40,y-40,obj_wall_h1) and place_meeting(x,y-40,obj_wall_h1) and place_meeting(x+40,y-40,obj_wall_h1) 
and place_meeting(x-40,y,obj_wall_h1)										 and place_meeting(x+40,y,obj_wall_h1) 
and !place_meeting(x-40,y+40,obj_wall_h1) and place_meeting(x,y+40,obj_wall_h1) and place_meeting(x+40,y+40,obj_wall_h1) {_img_top = 11; _img_wall = 14; bottomcovered = false;}

//connecting bottom right corner to bottom right corner
if place_meeting(x-40,y-40,obj_wall_h1) and place_meeting(x,y-40,obj_wall_h1) and place_meeting(x+40,y-40,obj_wall_h1) 
and place_meeting(x-40,y,obj_wall_h1)										 and place_meeting(x+40,y,obj_wall_h1) 
and place_meeting(x-40,y+40,obj_wall_h1) and place_meeting(x,y+40,obj_wall_h1) and !place_meeting(x+40,y+40,obj_wall_h1) {_img_top = 12; _img_wall = 14; bottomcovered = false;}

//dead center
if place_meeting(x-40,y-40,obj_wall_h1) and place_meeting(x,y-40,obj_wall_h1) and place_meeting(x+40,y-40,obj_wall_h1) 
and place_meeting(x-40,y,obj_wall_h1)										 and place_meeting(x+40,y,obj_wall_h1) 
and place_meeting(x-40,y+40,obj_wall_h1) and place_meeting(x,y+40,obj_wall_h1) and place_meeting(x+40,y+40,obj_wall_h1) {_img_top = 4; bottomcovered = true;}