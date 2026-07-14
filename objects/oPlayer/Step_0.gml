event_inherited();
		
if (hitstop > 0) {
	exit;
}

if (state = DRACSTATE.IDLE) {
	var _item = collision_rectangle(x,y-8, x+image_xscale*10, y, oEntity, 0, 0);
	if instance_exists(_item) {
		if _item.holdable and helditem == noone and _item.holdCooldown <= 0 {
			helditem = _item;
			state = DRACSTATE.CARRY;
		}
	}
}


switch (state){ //

	case DRACSTATE.IDLE: Drac_Idle(); break;
	case DRACSTATE.TAIL_WHIP: Drac_Whip(); break;
	case DRACSTATE.STOMP: Drac_Stomp(); break;
	case DRACSTATE.CARRY: Drac_Carry(); break;

}