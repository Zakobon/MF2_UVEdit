timer--;
if ((timer < 0) && !mouse_check_button(mb_left)){
	image_index = image;
	timer = 15;
}