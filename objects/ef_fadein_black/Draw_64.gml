timer += 1;
if timer > 1 {fade = 1;}
if timer > 3 {fade = 0.8;}
if timer > 6 {fade = 0.5;}
if timer > 7 {fade = 0.3;}
if timer > 8 {fade = 0.1;}
if timer > 10 {instance_destroy();}

if(!ctrl_global.borderEnabled){
	display_set_gui_size(640,480)	
}

draw_set_color(c_black);
draw_set_alpha(fade);
draw_rectangle(0,0,640,480,false);

draw_set_alpha(1);
draw_set_color(c_white);