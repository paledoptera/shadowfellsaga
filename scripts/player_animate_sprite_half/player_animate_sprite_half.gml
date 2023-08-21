function player_animate_sprite_half()
{

//Update Sprite
var _cardinal_direction = round(direction/90);
var _total_frames = sprite_get_number(sprite_index) / 4;
image_index = local_frame + (_cardinal_direction * _total_frames);
local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;

//If animation would loop on next game step
if (local_frame >= _total_frames)
{
	animation_end = true;
	local_frame -= _total_frames;
}
else animation_end = false;

}