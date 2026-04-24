draw_mouse_x = "--";
draw_mouse_y = "--";
if ((mouse_x >= grid_x && mouse_x < grid_x + 511) && (mouse_y >= grid_y && mouse_y < grid_y + 511)){
	//test1 = ["Mouse x", round((mouse_x - grid_x) / 2)];
	//test2 = ["Mouse y", round((mouse_y - grid_y) / 2)];
	draw_mouse_x = string(round((mouse_x - grid_x) / 2));
	draw_mouse_y = string(round((mouse_y - grid_y) / 2));
}
draw_text(x + 0, y - 25, "x:" + draw_mouse_x);
draw_text(x + 55, y - 25, "y:" + draw_mouse_y);