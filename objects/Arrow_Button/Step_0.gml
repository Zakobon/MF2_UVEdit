
if (button_lock == 1){
	exit;
}
if (enable == 0){
	image_index = image + 1;
	exit;
}
else{
	image_index = image;
}
if (position_meeting(mouse_x, mouse_y, id)){
	if ((mouse_check_button(mb_left)) && hold == 0){
		image_index = image + 1;
		active = !active;
		hold = 1;
	}
}
if (mouse_check_button_released(mb_left)){
	hold = 0;
	image_index = image;
}
timer--;
if ((timer < 0) && !mouse_check_button(mb_left)){
	image_index = image;
	timer = 15;
}