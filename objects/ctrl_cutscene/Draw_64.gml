if (live_call()) return live_result;
draw_set_color(c_black);
draw_rectangle(0,0,200,60,false);
draw_set_color(c_white);
draw_set_font(fnt_main);
draw_text(20,20,"GLOBAL TIMER: " + string(globaltimer));
draw_text(20,40,"TIMER: " + string(timer));