timer += 1;
if timer > 0 {fade = 1;}
if timer > 60 {fade = 0.8;}
if timer > 100 {fade = 0.5;}
if timer > 130 {fade = 0.3;}
if timer > 150 {fade = 0.1;}
if timer > 170 {instance_destroy();}

draw_set_color(c_black);
draw_set_alpha(fade);
draw_rectangle(0,0,640,480,false);

draw_set_alpha(1);
draw_set_color(c_white);