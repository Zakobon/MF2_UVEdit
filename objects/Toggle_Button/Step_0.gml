if (button_lock == 1){
	exit;
}
if (enable = 0){
	image_index = 5;
	exit;
}
switch (status){
	case 0:
	image_index = 4;
	break;
	
	case 1:
	image_index = 6;
	break;
}