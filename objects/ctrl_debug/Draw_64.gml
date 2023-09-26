if(live_call()) return live_result;
draw_set_font(fnt_papyrus)
draw_set_color(c_black)
draw_set_alpha(0.7);
draw_text(x+11,y+28,"CURRENT ROOM = "+string(room_get_name(room)))
draw_text(x+11,y+42,"WINDOW WIDTH = "+string(global.resolution_current.w))
draw_text(x+11,y+56,"WINDOW HEIGHT = "+string(global.resolution_current.h))

draw_set_alpha(1);
draw_set_color(c_white)
draw_text(x+10,y+28,"CURRENT ROOM = "+string(room_get_name(room)))
draw_text(x+10,y+42,"WINDOW WIDTH = "+string(global.resolution_current.w))
draw_text(x+10,y+56,"WINDOW HEIGHT = "+string(global.resolution_current.h))

 draw_sprite_ext(spr_px, 0, 585, 315, 55, 45, 0, c_black, 0.2)
 draw_set_font(fnt_sans)
 draw_set_color(c_green)
  draw_text(591, 315, string(fps_real))
 draw_set_color(c_lime)
 draw_set_font(fnt_sans)
 draw_text(590, 315, string(fps_real))
 draw_set_font(fnt_sans)
  draw_set_color(c_green)
   draw_text(611, 335, string(fps))
    draw_set_color(c_lime)
  draw_text(610, 335, string(fps))
  draw_set_font(fnt_sans)
  draw_set_alpha(0.7);
  draw_set_color(c_black)
   draw_text(181, 325, ("Instance Count: " + string(instance_count)))	
   draw_set_alpha(1);
  draw_set_color(c_yellow)
  draw_text(180, 325, ("Instance Count: " + string(instance_count)))	