if (ds_list_size(tim_list) == 0){
	draw_set_colour($FF666666);
}
else{
	if (ui_tim < 0){
		timx = 0;
		timy = 256;
		timw = 0;
		timh = 0;
		clut_x = 0;
		clut_y = 0;
		tim_fname = "[Null]";
		source = -1;
	}
	else{
		timx = tim_list[|ui_tim].pixel_x - ((ui_page - 16) * 64);
		timy = tim_list[|ui_tim].pixel_y;
		timw = tim_list[|ui_tim].pixel_w;
		timh = tim_list[|ui_tim].pixel_h;
		clut_x = tim_list[|ui_tim].clut_x;
		clut_y = tim_list[|ui_tim].clut_y;
		tim_fname = tim_list[|ui_tim].filename;
		source = tim_list[|ui_tim].imported;
	}
	draw_text(x + 0, y + 0, string("--TIM--"));
	//draw_text(x + 0, y + 20, string("Name:"));
	draw_text(x + 0, y + 40, string("#: "));
	draw_text(x + 43, y + 40, string("/"));
	
	//draw_text(x + 72, y + 20, tim_fname);
	draw_text(x + 0, y + 20, string(source_string[source + 1]));
	draw_set_halign(fa_right);
	draw_text(x + 43, y + 40, string(ui_tim + 1));
	draw_text(x + 72, y + 40, string(ds_list_size(tim_list)));
	draw_set_halign(fa_left);
	
	draw_text(x + 0, y + 60, string("X: ")); 
	draw_text(x + 0, y + 80, string("Y: "));
	draw_text(x + 0, y + 100, string("W: ")); 
	draw_text(x + 0, y + 120, string("H: "));
	draw_text(x + 0, y + 140, string("CX: ")); 
	draw_text(x + 0, y + 160, string("CY: "));
	draw_set_halign(fa_right);
	if (ui_tim == -1){
		draw_set_colour($FF999999);
	}
	draw_text(x + 72, y + 60, string(timx));
	draw_text(x + 72, y + 80, string(timy - 256));
	draw_text(x + 72, y + 100, string(timw * 2));
	draw_text(x + 72, y + 120, string(timh));
	draw_text(x + 72, y + 140, string(clut_x));
	draw_text(x + 72, y + 160, string(clut_y));
	
	draw_set_halign(fa_left);
	draw_set_colour($FFCCCCCC);
}