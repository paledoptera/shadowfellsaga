// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function actor_custom_sprite(actor_instance,sprite,imag_speed = 1, loops = true, image_index_start = 0,image_index_end = -1)
{
///@description actor_custom_sprite
///@arg actor_instance
///@arg sprite
///@arg img_speed
///@arg loops?
///@arg img_index_start
///@arg img_index_end

	with actor_instance
	{
		if sprite = -1
		{
			sprite_custom = -1
		}
		else
		{
			if sprite_custom = -1
			{
				image_index = image_index_start;
				img_speed = imag_speed;
			}
			sprite_custom = sprite;
			sprite_custom_img_start = image_index_start;
			looping_sprite = loops;
		
			if image_index_end = -1 {sprite_custom_img_end = sprite_get_number(sprite_index)-1;}
			else {sprite_custom_img_end = image_index_end;}
		}
	}
}