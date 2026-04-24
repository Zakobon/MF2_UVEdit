draw_set_colour($FFCCCCCC);
current_page = ui_page;

//draw_text(x + 45, y + -25, "Edit TIM");

//if (ds_list_size(tim_list) == 0){
	
//	draw_set_colour($FF666666);
//}
//else{
//	if (ui_tim < 0){
//		timx = 0;
//		timy = 256;
//		timw = 0;
//		timh = 0;
//		clut_x = 0;
//		clut_y = 0;
//		tim_fname = "[Null]";
//	}
//	else{
//		timx = tim_list[|ui_tim].pixel_x - ((ui_page - 16) * 64);
//		timy = tim_list[|ui_tim].pixel_y;
//		timw = tim_list[|ui_tim].pixel_w;
//		timh = tim_list[|ui_tim].pixel_h;
//		clut_x = tim_list[|ui_tim].clut_x;
//		clut_y = tim_list[|ui_tim].clut_y;
//		tim_fname = tim_list[|ui_tim].filename;
//	}
//	draw_text(x + 32, y - 160- 150, string("--TIM--"));
//	//draw_text(x + 32, y - 160- 130, string("Name:"));
//	draw_text(x + 32, y - 160- 110, string("#: "));
//	draw_text(x + 75, y - 160- 110, string("/"));
	
//	//draw_text(x + 104, y - 160- 130, tim_fname);
//	draw_set_halign(fa_right);
//	draw_text(x + 74, y - 160- 110, string(ui_tim + 1));
//	draw_text(x + 104, y - 160- 110, string(ds_list_size(tim_list)));
//	draw_set_halign(fa_left);
	
//	draw_text(x + 32, y - 160- 90, string("X: ")); 
//	draw_text(x + 32, y - 160- 70, string("Y: "));
//	draw_text(x + 32, y - 160- 50, string("W: ")); 
//	draw_text(x + 32, y - 160- 30, string("H: "));
//	draw_text(x + 32, y - 160- 10, string("CX: ")); 
//	draw_text(x + 32, y - 160+ 10, string("CY: "));
//	draw_set_halign(fa_right);
	
//	draw_text(x + 104, y - 160- 90, string(timx));
//	draw_text(x + 104, y - 160- 70, string(timy - 256));
//	draw_text(x + 104, y - 160- 50, string(timw * 2));
//	draw_text(x + 104, y - 160- 30, string(timh));
//	draw_text(x + 104, y - 160- 10, string(clut_x));
//	draw_text(x + 104, y - 160+ 10, string(clut_y));
	
//	draw_set_halign(fa_left);
//	draw_set_colour($FFCCCCCC);
//}
//draw_text(x + 56, y + 5, "Index");
draw_text(x + 65, y + 5, "TIM");
draw_text(x + 75, y + 50, "X");
draw_text(x + 75, y + 95, "Y");
draw_text(x + 73, y + 140, "W");
draw_text(x + 75, y + 185, "H");
draw_text(x + 68, y + 230, "CX");
draw_text(x + 68, y + 275, "CY");
draw_text(x + 0, y + 320, "Transparency");
bit_size = 1;
if (ui_tim == -1){
	draw_set_colour($FF999999);
	draw_text(x + 170, y + 5, "?");
}
else{
	draw_set_colour($FFCCCCCC);
	draw_text(x + 170, y + 5, string(ui_tim));
	if (tim_list[|ui_tim].bit < 1 && bit_size < 2){
		bit_size++;
	}
}

draw_text(x + 170, y + 50, string((ui_timx * 2) * bit_size));
draw_text(x + 170, y + 95, string(ui_timy));
draw_text(x + 170, y + 140, string((ui_timw * 2) * bit_size));
draw_text(x + 170, y + 185, string(ui_timh));
draw_text(x + 170, y + 230, string(ui_timclutx));
draw_text(x + 170, y + 275, string(ui_timcluty));


if (ds_list_size(tim_list) == 0) {
	draw_set_colour($FF666666);
}
else{
	switch (ui_tim_transparency) {
		case -1:
		draw_set_colour($FF666666);
		break;
		
		case 0:
		draw_set_colour($FFCCCCCC);
		break;
		
		case 1:
		draw_set_colour($FFDDCFA0);
		break;
	}
}

//draw_text(x + 170, y + 275, transparency[ui_tim_transparency + 1]);

//draw_text(x + 170, y + 315, tim_bit_mode_string[ui_tim_transparency + 1]);
draw_set_alpha(1);
draw_set_colour($FFFFFFFF);
