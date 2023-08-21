/// @desc Draw Battle Char
event_inherited();

if(currentPose==idlePose){
	draw_sprite_ext(currentPose,index/6,x,y+z,1,1,0,c_white,1);
} else if(currentPose==hurtPose){
	draw_sprite_ext(currentPose,index/6,x,y+z, image_xscale*2,image_yscale*2,0,c_white,1);
}