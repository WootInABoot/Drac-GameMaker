event_inherited()

tractionAir = 0;
grav = 0.15;
holdable = false;
boomerang_mode = false;



on_throw = function() {
	boomerang_mode = true;
	boomerang_timer = 200;
}