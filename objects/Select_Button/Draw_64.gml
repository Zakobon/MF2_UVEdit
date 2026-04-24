if (display != ""){
	text_width = string_width(display);
	if (string_width(display) < 8){
		text_width = 10;
	}
	image_xscale = 1 + (text_width / 32);
	text_x = (sprite_width / 2);
}
else{
	image_xscale = 1;
	text_x = 28;
}
if (display == ""){
	exit;
}

draw_set_halign(fa_center);
draw_set_valign(fa_center);


if (active == 1 && toggle_set == 1){
	//draw_set_colour($FF8D5F50);
	draw_set_colour($FF99BBBB);
	draw_text(x + text_x, y + 16, string(display));
	draw_set_colour($FFDDCFA0);
	draw_text(x + text_x, y + 15, string(display));
}
else if (toggle_set == 1){
	draw_set_colour($FF222222);
	draw_text(x + text_x, y + 16, string(display));
	draw_set_colour($FF999999);
	draw_text(x + text_x, y + 15, string(display));
}
else {
	switch (enable){
		case 0:
		draw_set_colour($FF999999);
		draw_text(x + text_x, y + 15, string(display));
		break;
		
		case 1:
		draw_set_colour($FFCCCCCC);
		draw_text(x + text_x, y + 15, string(display));
		break;
	}
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour($FFCCCCCC);
if (enable == 0){
	image_index = image + 1;
	exit;
}
timer--;
if ((timer < 0) && !mouse_check_button(mb_left)){
	image_index = image;
	timer = 15;
}
