if(!global.loaded){
PLAYER.x = x;
PLAYER.y = y;
}

FOLLOWER.x = x;
FOLLOWER.y = y;

with PLAYER
{
	for(i = 50; i >=0; i--)
	{
		pos_x[i] = x;
		pos_y[i] = y;
		pos_run[i] = 0;
	}
}