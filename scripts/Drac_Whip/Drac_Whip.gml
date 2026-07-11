function Drac_Whip(){


// Start Whip

if highJump {
	highJump = false;
}

if (sprite_index != sDracWhip) {
	sprite_index = sDracWhip;
	if (onground) {
		hspd = 0;
		topSpdTimer = 0
	} 
	
	lockDir = true;
	image_index = 0;
	image_speed = 1.3;

	
	// Create hitbox
	
	var _hitbox = instance_create_layer(x, y, layer, oDracWhip_HB);
	with _hitbox {
		owner = other.id;
		fixate = other.id;
		kb_h = other.image_xscale * 1;
		kb_v = -4;
		kb_hx = 0;
		kb_vx = 0;
	}
	show_debug_message("erm");
}
	


if (image_index > 4) and (sprite_index == sDracWhip) {
	sprite_index = sDrac;
	state = DRACSTATE.IDLE;
	image_index = 0;
	lockDir = false;
}





} // End of script