randomize();

timer += 1
if timer > 0
{
part = instance_create_layer(random_range(0,room_width),random_range(40,440),"Instances",ef_flavortownwind_part);
part.depth = -999;
part.hsp = random_range(-30,-4);
part.wave_hi = random_range(1,70);
part.wave_lo = random_range(-1,-70);
part.wave_length = random_range(1.5,3);
part.lifetime = random_range(300,500);
part.alpha = random_range(0.001,0.4);
part.scale = random_range(0.01,1);
part.trail = random_range(40,110);
timer = 0;
}