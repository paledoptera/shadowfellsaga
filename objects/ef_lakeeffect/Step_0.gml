if init = false
{
	init = true;
	lake_sys = part_system_create();
	part_system_depth (lake_sys, depth-1);

	lakering = part_type_create();
	part_type_sprite(lakering,spr_waterring,0,0,1);

	part_type_size(lakering,0.01,0.01,size_incr,0);
	part_type_speed(lakering,0,0,0,0);
	part_type_direction(lakering,0,0,0,3);
	part_type_life(lakering,life,life+50);
	part_type_alpha3(lakering,0.6,0.4,0);


	lake_emitter = part_emitter_create(lake_sys);
	part_emitter_region(lake_sys,lake_emitter,x,x,y,y,ps_shape_ellipse,ps_distr_linear);

	timer = 0;
}





timer ++
if timer > timerhit {part_emitter_burst(lake_sys,lake_emitter,lakering,1); timer = 0;}