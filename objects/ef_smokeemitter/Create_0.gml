smokestack = part_system_create();
part_system_depth (smokestack, -500);

smoke = part_type_create();
part_type_shape(smoke,pt_shape_cloud);
part_type_orientation(smoke,0,360,0,1,1);
part_type_size(smoke,0.1,0.2,0.05,0.01);
part_type_speed(smoke,0.2,0.25,0.03,0);
part_type_color_rgb(smoke,137,137,127,127,201,201);
part_type_direction(smoke,90,90,0,3);
part_type_life(smoke,70,100);
part_type_alpha2(smoke,0.5,0);


smoke_emitter = part_emitter_create(smokestack);
part_emitter_region(smokestack,smoke_emitter,x,x,y,y,ps_shape_ellipse,ps_distr_linear);

timer = 0;