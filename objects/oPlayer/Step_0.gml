event_inherited();
		

switch (state){ //

	case DRACSTATE.IDLE: Drac_Idle(); break;
	case DRACSTATE.TAIL_WHIP: Drac_Whip(); break;
	case DRACSTATE.STOMP: Drac_Stomp(); break;
	case DRACSTATE.CARRY: Drac_Carry(); break;

}