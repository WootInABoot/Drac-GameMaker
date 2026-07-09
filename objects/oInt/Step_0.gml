if keyboard_check_pressed(vk_tab){
	
// Check if or if not fullscreen

	if !window_get_fullscreen(){
		window_set_fullscreen(true)
	} else {
		window_set_fullscreen(false)
	}
}