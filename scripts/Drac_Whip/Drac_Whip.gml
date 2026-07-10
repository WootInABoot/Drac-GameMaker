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
	ds_list_clear(attackHit);

}

// oh nah bruh drac got the janky hitbox
mask_index = sDracWhip_HB;
var _hitByAttackNow = ds_list_create();
var _hits = instance_place_list(x,y,oEnemy,_hitByAttackNow,false);

if (_hits > 0){
	for (var i = 0; i < _hits; i++){
		
		// if not yet hit, then...
		var _hitID = _hitByAttackNow[| i];
		if (ds_list_find_index(attackHit,_hitID) == -1){
			ds_list_add(attackHit,_hitID);
			
			with (_hitID){
				// Whatever happens to the enemy / object goes here
				onHit(); // TODO: Spawn instance for hitbox
				
				

			}
		}
	}
}
ds_list_destroy(_hitByAttackNow)
mask_index = sDracMask;

if image_index > 5 {
	sprite_index = sDrac;
	state = DRACSTATE.IDLE;
	image_index = 0;
	lockDir = false;
}





} // End of script