if (enable == 0){
	image_index = image + 1;
	exit;
}
if (position_meeting(mouse_x, mouse_y, id)){
	if ((mouse_check_button(mb_left)) && (toggle != 1)){
		image_index = image + 1;
		active = !active;
		toggle = 1;
	}
}
if (mouse_check_button_released(mb_left)){
	toggle = 0;
	image_index = image;
}