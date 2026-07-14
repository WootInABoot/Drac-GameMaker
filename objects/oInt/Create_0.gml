// Vars with _ are temporary
global.devmode = false;

if (room == rmInt){
	
	// Window Stuff
	var _i = 4;
	window_set_size(160 * _i,144 * _i);
	window_center()

	// Next Room
	room_goto_next()
}