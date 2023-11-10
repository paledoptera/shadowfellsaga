#region JUMP/DODGE INPUT PROCESSING
var jump = input.interact_pressed;

if jump && zSpeed == 0 && canDodge {
	zSpeed = jumpHeight;	
}

if z != zFloor {
	zSpeed += grav;	
}

if z + zSpeed > zFloor {
	zSpeed = 0;
	z = zFloor;
}

x += xSpeed;
y += ySpeed;
z += zSpeed;
#endregion

#region ANIMATION DATA PROCESSING
index++;

#endregion