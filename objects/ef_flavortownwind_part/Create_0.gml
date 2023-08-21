starty = y;
timer = 0;
parttimer = 0;

image_alpha = 0;
part_system = part_system_create_layer("Instances", 0);
part_trail = part_type_create();
part_type_sprite(part_trail,sprite_index,true,true,0);
part_type_alpha2(part_trail,image_alpha,0);
part_type_blend(part_trail,true);