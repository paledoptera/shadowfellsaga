event_inherited()

timer += 1;

internalframe += 0.15;
if internalframe > 4.5 {interframe = 0}


if timer > 10
{
	timer = 0
	instance_create_layer(x-120,y+135,"Instances_2",ef_watertrail);
}
y = starty + round(wave(0,5,4,0))