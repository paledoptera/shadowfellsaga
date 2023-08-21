y = starty + wave(wave_hi,wave_lo,wave_length,0);
x += hsp;
timer += 1
if timer > lifetime {instance_destroy();}


if timer < (lifetime/2) {if image_alpha < alpha image_alpha += 0.005;}
if timer > ((lifetime/2) + (lifetime/4)) {image_alpha -= 0.005;}


var alph = image_alpha
var scal = scale

scal*= -hsp/3

part_type_alpha2(part_trail,alph/4,0);
part_type_size(part_trail,scal,scal,-(scal/trail),0);
part_type_life(part_trail,trail,trail);
part_particles_create(part_system,x,y,part_trail,1);

