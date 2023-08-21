///@desc INITIALIZE
image_speed = 0.75;

canDodge=false; // Always disable this after a dodge sequence- this controls whether or not the player can use their jump inputs to dodge
isAttacking=false; // Are we attacking? If so, do the same as with jump, override sprite index, but with our attack pose 
isDown=false;
// If vertical speed is greater than 0, override our sprite_index for the relavant battle_char to the dodge pose
targeted=false; // Enable this to show who is being targeted (e.g with(SANS){targeted=true;};)

#region BATTLE POSE IMAGES
idlePose = undefined; // This determines what "pose" to use when idle
dodgePose = undefined; // This determines what "pose" to use when dodging, will be applied during the "step" event
attackPose = undefined; // This determines what "pose" to use when attacking, will be applied during the "step" event
downPose = undefined; // This determines what "pose" to use when down, will be applied when global.partyhp[index]._curr reaches 0
hurtPose = undefined; // This determines what "pose" to use when taking damge, will eb applied when global.partyhp[index]._curr is subtracted from, but not equal to 0
#endregion

#region MOVEMENT VARIABLES
xSpeed = 0;
ySpeed = 0;
zSpeed = 0;

jumpHeight = -7; // The height the player will jump along the y and z axis
grav = 0.25;

z = 0;
zHeight = -sprite_height/2;
zFloor = 0;
#endregion