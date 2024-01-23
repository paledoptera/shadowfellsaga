timer += 1;
if timer > 0 {fade = 1;}
if timer > 6 {fade = 0.8;}
if timer > 10 {fade = 0.5;}
if timer > 13 {fade = 0.3;}
if timer > 15 {fade = 0.1;}
if timer > 17 {instance_destroy();}

draw_set_color(c_black);
draw_set_alpha(fade);
draw_rectangle(0,0,640,480,false);

draw_set_alpha(1);
draw_set_color(c_white);