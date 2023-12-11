if (live_call()) return live_result;

instance_create(0,0,handler_parallax);
handler_parallax.finetune_y1 = 30;
handler_parallax.finetune_x1 = 200;
handler_parallax.finetune_y2 = -90;
handler_parallax.finetune_y3 = -110;