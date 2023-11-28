if stage_last != stage {stage_last = stage; start = false;}


if start = false {start = true; image_index = image_index_start}

if image_index > image_index_end and image_index_end != -1 {if animation_loops = false {image_speed = 0; image_index = image_number -1;} else image_index = image_index_start;}

