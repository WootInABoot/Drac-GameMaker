if instance_exists(helditem) {
	with (helditem) {
		x = other.x;
		y = other.y - 15;
		hspd = 0;
		vspd = 0;
		hitstun = 200;
		holdCooldown = 20;
		
	}
} else {
	helditem = noone;
}