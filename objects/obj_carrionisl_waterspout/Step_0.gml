if echo = true 
{
	echo = false;
	instance_create(x,y-30,ef_splash);
	stat = true;
}

if stat = true
{
	image_yscale += wave(0.02,-0.02,0.6,0);
	image_xscale += wave(-0.01,0.01,0.3,0);
}

timer += 1;

{
	if timer = 1 {image_xscale = 0.1; image_yscale = 0.2;}
	if timer = 5 {image_xscale = 0.3; image_yscale = 0.4;}
	if timer = 10 {image_xscale = 0.6; image_yscale = 0.9;}
	if timer = 15 {image_xscale = 0.8; image_yscale = 2;}
	if timer = 25 {image_xscale = 1.6; image_yscale = 1.4;}
	if timer = 35 {image_xscale = 1.5; image_yscale = 2; stat = true;}
}