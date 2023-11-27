if(garbageTimer++ >= 30)
{
	garbageTimer = 0
	gc_collect()
}

if(!instance_exists(input)) {instance_create(0,0,input)}


//if global.camasp == 1 { obj_borderhandler._enabled = false; } else {obj_borderhandler._enabled = true; } 