shader_set(sh_water);

shader_set_uniform_f(uniTime,current_time);
var tex = sprite_get_texture(sprite_index,image_index);
shader_set_uniform_f(uniTexel, texture_get_texel_width(tex), texture_get_texel_height(tex));

draw_self();

shader_reset();
