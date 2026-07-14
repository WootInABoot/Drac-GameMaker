function Drac_Idle(){
	
		#region // Animation Stuff 
		

if (sprite_index == sDracThrow) {
	if image_index < 3 {
		lockDir = true;
		exit;
	} else {
		lockDir = false;
		image_index = 0;
	}
}

if (onground){
	
	if highJump = true {
		highJump = false;
	}

	if (abs(hspd) > 0) { // Walk/Run Animation. if hspd = maxspd set animation to run, else walk

		if (topSpdTimer >= 20) {
			sprite_index = sDracRun;
			image_speed = 1.2;
			
			if not spdDust {
				instance_create_layer(x-sign(image_xscale), y, layer, oSpdDust);
				spdDust = true;
			}
			
		} else {
			sprite_index = sDracWalk;
			image_speed = 1.2;
		}
        
        if animIdle = true { // Reset idle back to frame 0 after switching from another anim
            image_index = 0;
        }
		
        animIdle = false;
		
        
    } else {
        sprite_index = sDrac;
        image_speed = 1;
        
        if not animIdle { // so anim doesnt get stuck on frame 1
            image_index = 0;
            animIdle = true;
        }
    }
	
} else { // Jump anim when on ground
	
	if (highJump = false) { // High Jump 
		sprite_index = sDracJump;
        image_speed = 0;
        image_index = (vspd >= 0) + (vspd >= 1.5);
        animIdle = false;
		
	} else if (highJump = true) {
		sprite_index = sDracHJ;
        image_speed = 1.8;
		animIdle = false;
		if (sprite_index == sDracHJ) and (image_index > 7){
			image_speed = 0;
		}
	}
}



// Timer for Run Anim
if (abs(hspd) >= maxSpd){
	topSpdTimer ++;//Do timer if at top speed
} else {
	topSpdTimer = 0;//Reset if not at top speed
	spdDust = false
}

#endregion

if (attackkey) {
	state = DRACSTATE.TAIL_WHIP; // Switch to tail whip state
}

if (not onground) and (downkey) {
	state = DRACSTATE.STOMP; // Switch to tail whip state
}




} // End of script