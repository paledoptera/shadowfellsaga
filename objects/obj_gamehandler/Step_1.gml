if(garbageTimer++ >= 30)
{
	garbageTimer = 0
	gc_collect()
}