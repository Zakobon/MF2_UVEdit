draw_set_colour($FFCCCCCC);
draw_text(x + 20, y + 5, string("Import MM0"));

if (mm0_base_buffer != -1){
	draw_set_colour($FFCCCCCC);
	if (string_length(ui_name_mm0) > 11){
		draw_text(x + 20, y + 34, string_delete(ui_name_mm0, 10, string_length(ui_name_mm0)) + "...");
	}
	else{
		draw_text(x + 20, y + 34, ui_name_mm0);
	}
	image_yscale = 2;
	image_index = 0;
}
else{
	image_yscale = 1;
	image_index = 0;
}
draw_set_colour($FFFFFFFF);