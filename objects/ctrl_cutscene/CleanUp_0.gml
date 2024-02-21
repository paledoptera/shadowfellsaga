/// @description cleanup

CAM.following_target = true;

PLAYER.x = actor_papyrus.x;
PLAYER.y = actor_papyrus.y;
instance_destroy(actor_papyrus);

if instance_exists(FOLLOWER)
{
	FOLLOWER.x = actor_sans.x;
	FOLLOWER.y = actor_sans.y;
	instance_destroy(actor_sans);
}






