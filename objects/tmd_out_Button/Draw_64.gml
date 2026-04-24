if(mm0_base_buffer != -1){
	draw_set_colour($FFCCCCCC);
	image_index = 0;
}
else{
	draw_set_colour($FF666666);
	image_index = 1;
}

draw_text(x + 20, y + 5, "Export TMD");
draw_set_colour($FFFFFFFF);