get_inputs();


		#region // General Movement //

// Apply traction when player isn't moving
var _doTraction = (hkey == 0);

//Change the traction and accel speeds based on the current ground state
if (onground){
	traction = tractionGround;
	accel = accelGround;
} else {
	traction = tractionAir;
	accel = accelAir;
}

//replace 30 with whatever your top speed timer value was...
//maybe it could be a separate variable like runFrames? incase you change your mind or want to experiment with values
if (topSpdTimer >= 15){
	maxSpd = maxRunSpd;
}else{
	maxSpd = maxWalkSpd;
}


// Apply speed if under speed limit
if (hkey == 1){ // Right
	if (not lockDir) { // If direction isn't locked, change sprite direction
		facing = 1;
	}
	
	if (hspd < maxSpd) {
		hspd += accel;
		if (hspd >= maxSpd){
			hspd = maxSpd;
		}
		
		if (hspd < 0){ //Check if holding opposite speed / Apply traction
			_doTraction = true
		}
	}
}

if (hkey == -1){ // Left
	if (not lockDir) { // If direction isn't locked, change sprite direction
		facing = -1;
	}
	
	if (hspd > -maxSpd) {
		hspd -= accel;
		if (hspd <= -maxSpd){
			hspd = -maxSpd;
		}
		
		if (hspd > 0){ //Check if holding opposite speed / Apply traction
			_doTraction = true
		}
	}
}

if (_doTraction){
	if abs(hspd) >= traction{
		hspd -= sign(hspd) * traction;
	} else { 
		hspd = 0;
	}
}


// If not on ground, apply gravity, else set jumping to false //
if (not onground) {
	vspd += grav;
} else {
	jumped = false
	coyoteTime = coyoteTimeFrames;
}

if (jumpBuffer > 0) and (coyoteTime > 0) {
	jumpBuffer = 0;
	coyoteTime = 0;
	
	if (sprite_index != sDracFlop2) { // check for stomp
		vspd = -jumpSpd;
	} else {
		vspd = -highJumpSpd;	
	}	
	jumped = true;
	highJump = false;
	
}

if (not jkeyhold) and (jumped) and (vspd <= -jumpCut){
	jumped = false
	vspd = -jumpCut;
}


#endregion


		#region // Collision Stuff //
		
hspd_pixel += hspd;
vspd_pixel += vspd;

// Sign is a number that is always -1 or 0 (Returns any value, 1, 0, or -1)
var _face = sign(hspd_pixel)

// Check if absolute value is more than 1
while (abs(hspd_pixel) >= 1){
	hspd_pixel -= _face;
	
	// x Collision (If not touching wall, move, else not move)
	if not place_meeting(x + _face, y, oWall){
		x += _face
	} else {
		hspd = 0;
		hspd_pixel = 0;
	}	
}

_face = sign(vspd_pixel)

// Check if absolute value is more than 1
while (abs(vspd_pixel) >= 1){
	vspd_pixel -= _face;
	
	// y Collision (If not touching wall, move, else not move)
	if not place_meeting(x, y + _face, oWall){
		y += _face
	} else {
		vspd = 0;
		vspd_pixel = 0;
	}	
}

// Check if there is ground below you
onground = (place_meeting(x,y + 1, oWall) and (vspd >= 0));

// Jump Buffering / Coyote Time

coyoteTime = clamp(coyoteTime - 1, 0, coyoteTimeFrames)
jumpBuffer = clamp(jumpBuffer - 1, 0, jumpBufferFrames)



#endregion