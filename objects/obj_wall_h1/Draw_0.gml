//Top Sprite
draw_sprite(sprite_index,_img_top,x,y-40);

//Wall 1 Sprite
if bottomcovered = false {draw_sprite(sprite_index,_img_wall+9,x,y)};


//if instance_exists(ctrl_debug) 
//{
//	if walkable = false {draw_sprite(spr_wall_h1,0,x,y)}
//	else {draw_sprite(spr_wall_h1_walkable,0,x,y);}
//}
