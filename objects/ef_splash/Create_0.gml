splash_sys = part_system_create();
part_system_depth (splash_sys, -500);

splash = part_type_create();
part_type_sprite(splash,spr_splashpart,0,0,0);
part_type_size(splash,0.5,3,-0.05,0.01);
part_type_speed(splash,4,7,-0.13,0);
part_type_color_rgb(splash,83, 255, 161, 255, 224,255);
part_type_direction(splash,0,360,0,3);
part_type_life(splash,50,160);
part_type_alpha2(splash,0.4,0);


splash_emitter = part_emitter_create(splash_sys);
part_emitter_region(splash_sys,splash_emitter,x,x,y,y,ps_shape_ellipse,ps_distr_linear);


smokestack = part_system_create();
part_system_depth (smokestack, -500);

smoke = part_type_create();
part_type_shape(smoke,pt_shape_cloud);
part_type_orientation(smoke,0,360,0,1,1);
part_type_size(smoke,2,2.3,0.1,0.01);
part_type_speed(smoke,2,2.4,0.15,0);
part_type_color_rgb(smoke,184,184,208,208,240,240);
part_type_direction(smoke,90,90,0,6);
part_type_life(smoke,70,100);
part_type_alpha3(smoke,0.02,0.06,0);


smoke_emitter = part_emitter_create(smokestack);
part_emitter_region(smokestack,smoke_emitter,x,x,y+60,y+60,ps_shape_ellipse,ps_distr_linear);

timer = 0;



burst = true;