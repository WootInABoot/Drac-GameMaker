// Inherit the parent event
event_inherited();

if hitstun > 0 or thrown {
	holdable = true;

} else {
	holdable = false;	
}


if boomerang_mode == true {
//put follow player code here
	boomerang_timer--
	mask_index = sBlankMask16x16;
	
	if x != oPlayer.x or y != oPlayer.y { // If not in contact with the player
		if boomerang_timer < 190 { // so the boomerang has a moment to travel
			grav = 0.02;
			var _maxspd = 10
			var _accel = 0.1
			if x < oPlayer.x hspd+=_accel
			else  hspd -= _accel
	
			if y < oPlayer.y vspd+=_accel
			else  vspd -= _accel
			hspd = clamp(hspd, -_maxspd, _maxspd)
			vspd = clamp(vspd, -_maxspd, _maxspd)
		}
	} else {
		mask_index = sBinoBlockB;
	}
	
	if boomerang_timer <=0 {
		boomerang_mode = false
		grav = 0.15;
		checkCol = true;
	}
}







