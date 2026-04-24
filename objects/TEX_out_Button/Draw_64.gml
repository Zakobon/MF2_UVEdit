if (ds_list_size(tim_list) == 0){
	draw_set_colour($FF888888);
	image_index = 1;
}
else{
	draw_set_colour($FFCCCCCC);
	image_index = 0;
}

draw_text(x + 20, y + 5, "Export TEX");
draw_set_colour($FFFFFFFF);