function Drac_Stomp(){



lockDir = true;
lockJump = true;

if highJump {
	highJump = false;
}


//Start Stomp
if (not onground) {
	
	if (sprite_index != sDracFlop1) and (sprite_index != sDracFlop2) { // Set to stomp anim
		sprite_index = sDracFlop1;
		vspd = -2;
	}
	
	image_speed = 0;
	image_index = (vspd >= 0) + (vspd >= 1.5);

	
	if (vspd > 1) and (sprite_index == sDracFlop1) { // Set mask and  after images on way down
		//mask_index = sDracFlop_HB;
		
		flickerTimer++;
		if (flickerTimer >= 2) { // After Images
			flickerTimer = 0;
			var _afterID;
			_afterID = instance_create_layer(x,y,layer,oAfterImageFlop);
			_afterID.sprite_index = sAfterImageFlop;
			_afterID.image_index = 0;
			_afterID.image_speed = 6;
			_afterID.image_xscale = facing;
		}
	
	}

} else {
	
	lockMove = true;
	lockJump = false;
	

	
	if (sprite_index != sDracFlop2) { // Transition to second flop anim

		if (facing < 0) { // Stomp particles
			instance_create_layer(x-sign(image_xscale) + 8, y, layer, oStmpDust);
			instance_create_layer(x-sign(image_xscale) - 8, y, layer, oStmpDust2);
		} else {
			instance_create_layer(x-sign(image_xscale) - 8, y, layer, oStmpDust);
			instance_create_layer(x-sign(image_xscale) + 8, y, layer, oStmpDust2);
		}

		sprite_index = sDracFlop2;	
		image_index = 0;
		image_speed = 1.2;
		
	}
}

if (jkey) and (sprite_index = sDracFlop2) and (not highJump) { // High Jump Input
	onground = false;
	lockMove = false;
	lockJump = false;
	lockDir = false;
	highJump = true;
	state = DRACSTATE.IDLE; // Switch to Idle State + High Jump
}

if (image_index > 5) and (sprite_index = sDracFlop2) {
	lockMove = false;
	sprite_index = sDrac;
	state = DRACSTATE.IDLE;
	image_index = 0;
	lockDir = false;
	
} 
	
	

} // End of script