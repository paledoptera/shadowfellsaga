if flickered = 300 {saveflicker = 1}
if flickered > 0 {flickered -= 1}
if flickered < 60 and flickered > 0 {if flickered mod 10 = 0 {if saveflicker = 1 {saveflicker = 0} else {saveflicker = 1}}}
if flickered = 0 {saveflicker = 0;}

draw_sprite(sprite_index,saveflicker,x,y)