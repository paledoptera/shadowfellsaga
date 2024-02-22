if (live_call()) return live_result;

if debug_mode
{
draw_set_color(c_black);
draw_rectangle(0,0,200,80,false);
draw_set_color(c_white);
draw_set_font(fnt_main);
draw_text(20,20,"GLOBAL TIMER: " + string(globaltimer));
draw_text(20,40,"TIMER: " + string(timer));
draw_text(20,60,"FRAME TIMER: " + string(frame));
}