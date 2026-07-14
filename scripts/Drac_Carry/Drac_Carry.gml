function Drac_Carry(){
	
		#region // Animation Stuff 

if (onground){
	
	if highJump = true {
		highJump = false;
	}

	if (abs(hspd) > 0) { // Walk/Run Animation. if hspd = maxspd set animation to run, else walk

		if (topSpdTimer >= 20) {
			sprite_index = sDracWalkCarry;
			image_speed = 2.2;
			
			if not spdDust {
				instance_create_layer(x-sign(image_xscale), y, layer, oSpdDust);
				spdDust = true;
			}
			
		} else {
			sprite_index = sDracWalkCarry;
			image_speed = 1.2;
		}
        
        if animIdle = true { // Reset idle back to frame 0 after switching from another anim
            image_index = 0;
        }
		
        animIdle = false;
		
        
    } else {
        sprite_index = sDracCarry;
        image_speed = 1;
        
        if not animIdle { // so anim doesnt get stuck on frame 1
            image_index = 0;
            animIdle = true;
        }
    }
	
} else { // Jump anim when on ground
	
	if (highJump = false) { // High Jump 
		sprite_index = sDracJumpCarry;
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
	if instance_exists(helditem) {
		with helditem {
			hspd = other.image_xscale * 2 + other.hspd;
			vspd = -1;
		}
		helditem = noone;
		sprite_index = sDracThrow;
		image_index = 0;
		image_speed = 1.2;
		state = DRACSTATE.IDLE;
		
	}
}





} // End of script