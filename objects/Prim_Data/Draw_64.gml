if (tmd_edit != -1){
	draw_set_halign(fa_left);

	draw_set_colour($FFFFC3A8);
	draw_text(x + 0, y + 0, string("[Primitive]"));
	draw_set_colour($FFFFFFFF);
	draw_text(x + 0, y + 25, string("[Object Index]"));
	draw_set_halign(fa_right);
	draw_set_colour($FFCCCCCC);
	draw_text(x + 170, y + 0, string(ui_prim));
	draw_text(x + 170, y + 25, string(tmd_base.prim[ui_prim].p_id));
	draw_set_colour($FFFFFFFF);

	draw_set_halign(fa_left);


	new_prim = tmd_edit.prim[ui_prim];
	old_prim = tmd_base.prim[ui_prim];

	align = 120;

	draw_text(x, y + 65, string("RGB: "));
	draw_text(x, y + 85, string("Prim Bit Mode: "));
	draw_text(x + 150, y + 65, string("CMD: "));
	draw_text(x, y + 105, string("Tex0 X: "));
	draw_text(x, y + 125, string("Tex0 Y: "));
	draw_text(x + 150, y + 105, string("Tex1 X: "));
	draw_text(x + 150, y + 125, string("Tex1 Y: "));
	draw_text(x, y + 245, string("TexPage: "));
	draw_text(x, y + 155, string("Tex2 X: "));
	draw_text(x, y + 175, string("Tex2 Y: "));

	if(!(new_prim.cmd & 0b1000 == 8))
	{
		draw_set_colour($FF999999);
		draw_text(x + 150, y + 155, string("Tex3 X: "));
		draw_text(x + 150, y + 175, string("Tex3 Y: "));
		draw_set_halign(fa_right);
		draw_text(x + align + 150, y + 155, string(-1));
		draw_text(x + align + 150, y + 175, string(-1));
		draw_set_halign(fa_left);
	}

	else
	{
		draw_set_colour($FFFFFFFF);
		draw_text(x + 150, y + 155, string("Tex3 X: "));
		draw_text(x + 150, y + 175, string("Tex3 Y: "));
		draw_set_halign(fa_right);
	
		draw_text(x + align + 150, y + 155, string(new_prim.tex_x[3]));
		draw_text(x + align + 150, y + 175, string(new_prim.tex_y[3]));
		draw_set_halign(fa_left);
	}

	draw_set_colour($FFFFFFFF);
	draw_text(x, y + 225, string("Clut X: "));
	draw_text(x + 150, y + 225, string("Clut Y: "));

	draw_set_halign(fa_right);

	//if (new_prim.cmd != old_prim.cmd){
	//		draw_set_colour($FFFFFFCC);
	//}
	draw_text(x + align + 150, y + 65, string(new_prim.cmd));
	if (new_prim.c_mode == 0){
		draw_set_colour($FFa98080);
	}
	else{
		draw_set_colour($FFCCA0A0);
	}
	draw_text(x + align + 68, y + 85, string(tim_bit_mode_string[new_prim.c_mode]));
	draw_set_colour($FFFFFFFF);
	//draw_set_colour($FFFFFFFF);

	//if (new_prim.tex0tx != old_prim.tex0tx){
	//		draw_set_colour($FFFFFFCC);
	//}
	draw_text(x + align, y + 105, string(new_prim.tex_x[0]));
	//draw_set_colour($FFFFFFFF);

	//if (new_prim.tex0ty != old_prim.tex0ty){
	//		draw_set_colour($FFFFFFCC);
	//}
	draw_text(x + align, y + 125, string(new_prim.tex_y[0]));
	//draw_set_colour($FFFFFFFF);

	//if (new_prim.tex1tx != old_prim.tex1tx){
	//		draw_set_colour($FFFFFFCC);
	//}
	draw_text(x + align + 150, y + 105, string(new_prim.tex_x[1]));
	//draw_set_colour($FFFFFFFF);

	//if (new_prim.tex1ty != old_prim.tex1ty){
	//		draw_set_colour($FFFFFFCC);
	//}
	draw_text(x + align + 150, y + 125, string(new_prim.tex_y[1]));
	//draw_set_colour($FFFFFFFF);

	//if (new_prim.tex2tx != old_prim.tex2tx){
	//		draw_set_colour($FFFFFFCC);
	//}
	draw_text(x + align, y + 155, string(new_prim.tex_x[2]));
	//draw_set_colour($FFFFFFFF);

	//if (new_prim.tex2ty != old_prim.tex2ty){
	//		draw_set_colour($FFFFFFCC);
	//}
	draw_text(x + align, y + 175, string(new_prim.tex_y[2]));
	//draw_set_colour($FFFFFFFF);

	//if (((new_prim.texclut >> 6) & 0b0111111111) != ((new_prim.texclut >> 6) & 0b0111111111)){
	//		draw_set_colour($FFFFFFCC);
	//}
	draw_text(x + align + 150, y + 225, string(new_prim.clut_y));
	draw_set_colour($FFCCCCCC);

	draw_text(x + align, y + 225, string(new_prim.clut_x));
	draw_set_colour($FFFFFFFF);

	//if (new_prim.texpxy != old_prim.texpxy){
	//		draw_set_colour($FFFFFFCC);
	//}
	draw_text(x + align, y + 245, string(new_prim.page_x + 16));
	//draw_set_colour($FFFFFFFF);


	draw_set_halign(fa_right);
	draw_set_colour($FFCCCCCC);
	draw_text(x + align, y + 65, string("{0}-{1}-{2}", string(new_prim.colors[0].r), string(new_prim.colors[0].g), string(new_prim.colors[0].b)));
	draw_set_colour($FFFFFFFFF);

	draw_set_halign(fa_left);

	if (array_length(new_prim.norm) > 3){
		quad_string = [string(new_prim.norm[3]), string(new_prim.vert[3])];
	}
	else{
		quad_string = ["Null", "Null"];
	}
	draw_text(x + 0, y + 305, "Normal:");
	draw_text(x + 0, y + 325, "Vertex:");

	draw_set_colour($FFCCCCCC);
	draw_text(x + 80, y + 305, "[0]: ");
	draw_text(x + 150, y + 305, "[1]: ");
	draw_text(x + 220, y + 305, "[2]: ");
	draw_text(x + 290, y + 305, "[3]: ");

	draw_set_halign(fa_right);
	if(array_length(new_prim.norm) != 0){
		draw_text(x + 145, y + 305, string(new_prim.norm[0]));
		draw_text(x + 215, y + 305, string(new_prim.norm[1]));
		draw_text(x + 285, y + 305, string(new_prim.norm[2]));
		draw_text(x + 355, y + 305, quad_string[0]);
	}
	else{
		draw_text(x + 145, y + 305, quad_string[0]);
		draw_text(x + 215, y + 305, quad_string[0]);
		draw_text(x + 285, y + 305, quad_string[0]);
		draw_text(x + 355, y + 305, quad_string[0]);
	}
	draw_set_halign(fa_left);
	draw_text(x + 80, y + 325, "[0]: ");
	draw_text(x + 150, y + 325, "[1]: ");
	draw_text(x + 220, y + 325, "[2]: ");
	draw_text(x + 290, y + 325, "[3]: ");

	draw_set_halign(fa_right);
	draw_text(x + 145, y + 325, string(new_prim.vert[0]));
	draw_text(x + 215, y + 325, string(new_prim.vert[1]));
	draw_text(x + 285, y + 325, string(new_prim.vert[2]));
	draw_text(x + 355, y + 325, quad_string[1]);

	draw_set_halign(fa_left);
	draw_set_colour($FFFFFFFF);
}