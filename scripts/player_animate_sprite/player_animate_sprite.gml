function player_animate_sprite()
{

//Update Sprite
var _cardinal_direction = round(direction/45);
var _total_frames = sprite_get_number(sprite_index) / 8;
var _is_airborne = -1;

if z = zfloor {_is_airborne = -1;}
if z < zfloor
{
	if zsp < 0 {_is_airborne = 0;}
	if zsp > 0 or zsp = 0 {_is_airborne = 1;}
}

if _is_airborne = -1
{
	image_index = local_frame + (_cardinal_direction * _total_frames);
	local_frame += sprite_get_speed(sprite_index) / FRAME_RATE * image_speed;
}
else
{
	image_index = (_cardinal_direction * _total_frames) + _is_airborne;
}

//If animation would loop on next game step
if (local_frame >= _total_frames)
{
	animation_end = true;
	local_frame -= _total_frames;
}
else animation_end = false;



}