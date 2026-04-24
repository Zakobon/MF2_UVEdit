ui_flip = ["No","Yes"];
transparency = ["---", "Opaque", "Semi-Transparent"];

draw_set_colour($FF222222);
draw_text(x + 17, y + 9, string("Primitive Edit Template"));
draw_set_colour($FF666666);
draw_text(x + 16, y + 7, string("Primitive Edit Template"));
draw_set_colour($FFCCCCCC);
draw_text(x + 15, y + 5, string("Primitive Edit Template"));
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(x + 280, y + 5, string(ui_prim_template));

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (array_length(prim_edit_backup) != 0){
	edit_undo = prim_edit_backup[ui_prim_template - 1];
	
	draw_text(x + 0, y + 80, "X Position: ");
	draw_text(x + 0, y + 100, "Y Position: ");
	draw_text(x + 0, y + 120, "Scale X:    ");
	draw_text(x + 0, y + 140, "Scale Y:    ");
	draw_text(x + 0, y + 160, "Rotation:   ");
	draw_text(x + 0, y + 180, "Flip X:   ");
	draw_text(x + 0, y + 200, "Flip Y:   ");
	draw_text(x + 0, y + 220, "Transparency:   ");
	draw_text(x + 0, y + 240, "Bit Mode:   ");
	
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	
	draw_text(x + 160, y + 80, string(edit_undo.edit_x_ui));
	draw_text(x + 160, y + 100, string(edit_undo.edit_y_ui));
	draw_text(x + 177, y + 120, string(edit_undo.xscale) + "%");
	draw_text(x + 177, y + 140, string(edit_undo.yscale) + "%");
	draw_text(x + 160, y + 160, string(edit_undo.group_rotate * 90));
	draw_text(x + 160, y + 180, ui_flip[edit_undo.flip_x]);
	draw_text(x + 160, y + 200, ui_flip[edit_undo.flip_y]);
	draw_set_halign(fa_left);
	draw_text(x + 160, y + 220, prim_transparency_string[edit_undo.prim_transparency + 1]);
	draw_text(x + 160, y + 240, prim_bit_mode_string[edit_undo.bit_mode + 1]);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);