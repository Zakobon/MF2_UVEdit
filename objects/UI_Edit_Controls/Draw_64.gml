title = "Selection Edit";
draw_sprite_stretched(Button, 13, x + 7, y - 85, string_width(title) + 32, 32)
draw_set_colour($FFCCCCCC)
draw_text(x + 23, y - 80, title);

if (array_length(prim_list) == 0){
	draw_set_colour($FF666666);
}
else{
	draw_set_colour($FFCCCCCC);
}


draw_text(x + 75, y + 5, string("X"));
draw_text(x + 210, y + 5, string(x_edit_ui));
draw_text(x + -70, y + 5, string(group_xmin + x_edit_ui));

draw_text(x + 75, y + 50, string("Y"));
draw_text(x + 210, y + 50, string(y_edit_ui));
draw_text(x + -70, y + 50, string(group_ymin + y_edit_ui));

if (rotate < 0){
	rotate_ui = 360 + rotate;
}
else{
	rotate_ui = rotate;
}
draw_text(x + 40, y + 95, string("Rotation"));
draw_text(x + 170, y + 95, string("{0} | {1}", rotate_ui, rotate));

draw_text(x + 50, y + 140, string("Clut X"));
if (clut_x_ui != -1){
	draw_text(x + 170, y + 140, string(clut_x_ui));
}
else{
	draw_text(x + 170, y + 140, "Unchanged");
}
draw_text(x + 50, y + 185, string("Clut Y"));
if (clut_y_ui != -1){
	draw_text(x + 170, y + 185, string(clut_y_ui));
}
else{
	draw_text(x + 170, y + 185, "Unchanged");
}
draw_text(x + 35, y + 270, "Transform");

draw_text(x + 67, y + 320, "X%");
draw_text(x + 67, y + 365, "Y%");

draw_text(x + 67, y + 410, "Flip X");
draw_text(x + 67, y + 455, "Flip Y");

draw_text(x - 5, y + 500, "Transparency");
draw_text(x - 5, y + 545, "Bit Mode");

draw_set_halign(fa_right);
draw_set_valign(fa_top);

draw_text(x + 252, y + 320, string(x_scale_edit) + "%");
draw_text(x + 252, y + 365, string(y_scale_edit) + "%");
draw_text(x + 250, y + 410, ui_flip[x_flip]);
draw_text(x + 250, y + 455, ui_flip[y_flip]);
switch (ui_prim_transparency) {
	case -1:
	draw_set_alpha(.5);
	break;
	case 0:
	draw_set_alpha(1);
	break;
	case 1:
	draw_set_alpha(.7);
	break;

}
//draw_text(x + 275, y + 410, tim_transparency_string[ui_prim_transparency + 1]);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);