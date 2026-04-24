// Draw primitives
event_user(0);

DX = 10;
DY = 300;
PX = 920;
PY = 60;

draw_set_colour($FFCCCCCC);

//draw_text(10, 260, string("File: ") + string("\"" + ui_name_mm0 + "\""));

draw_set_colour($FFFFFFFF);

//draw_text(DX, DY, string("--TMD-- ") + "");

draw_text(DX, DY + 20, "--mm0header-- ");
draw_text(DX, DY + 40, string("Size:  ") + string(tmd_base.mm0header.tsize));
draw_text(DX, DY + 60, string("Pointer[0]:  ") + string(tmd_base.mm0header.pointer[0]));
draw_text(DX, DY + 80, string("Pointer[1]:  ") + string(tmd_base.mm0header.pointer[1]));
draw_text(DX, DY + 100, string("Pointer[2]:  ") + string(tmd_base.mm0header.pointer[2]));

if (tmd_base.mm0header.tsize == 3){
	pointer3 =  string(tmd_base.mm0header.pointer[3]);
}
else{
	pointer3 = "Null";
}
draw_text(DX, DY + 120, string("Pointer[3]:  ") + pointer3);


draw_set_colour($FFFFFFFF);


//////draw_set_halign(fa_left);

//////draw_set_colour($FFFFC3A8);
//////draw_text(PX + 0, PY + 135, string("[Primitive]"));
//////draw_set_colour($FFFFFFFF);
//////draw_text(PX + 0, PY + 160, string("[Object Index]"));
//////draw_set_halign(fa_right);
//////draw_set_colour($FFCCCCCC);
//////draw_text(PX + 170, PY + 135, string(ui_prim));
//////draw_text(PX + 170, PY + 160, string(tmd_base.prim[ui_prim].p_id));
//////draw_set_colour($FFFFFFFF);

//////draw_set_halign(fa_left);


//////new_prim = tmd_edit.prim[ui_prim];
//////old_prim = tmd_base.prim[ui_prim];

//////align = 120;

//////draw_text(PX, PY + 200, string("RGB: "));
//////draw_text(PX + 150, PY + 200, string("CMD: "));
//////draw_text(PX, PY + 240, string("Tex0 X: "));
//////draw_text(PX, PY + 260, string("Tex0 Y: "));
//////draw_text(PX + 150, PY + 240, string("Tex1 X: "));
//////draw_text(PX + 150, PY + 260, string("Tex1 Y: "));
//////draw_text(PX, PY + 380, string("TexPage: "));
//////draw_text(PX, PY + 290, string("Tex2 X: "));
//////draw_text(PX, PY + 310, string("Tex2 Y: "));

//////if(!(new_prim.cmd & 0b1000 == 8))
//////{
//////	draw_set_colour($FF999999);
//////	draw_text(PX + 150, PY + 290, string("Tex3 X: "));
//////	draw_text(PX + 150, PY + 310, string("Tex3 Y: "));
//////	draw_set_halign(fa_right);
//////	draw_text(PX + align + 150, PY + 290, string(-1));
//////	draw_text(PX + align + 150, PY + 310, string(-1));
//////	draw_set_halign(fa_left);
//////}

//////else
//////{
//////	draw_set_colour($FFFFFFFF);
//////	draw_text(PX + 150, PY + 290, string("Tex3 X: "));
//////	draw_text(PX + 150, PY + 310, string("Tex3 Y: "));
//////	draw_set_halign(fa_right);
	
//////	draw_text(PX + align + 150, PY + 290, string(new_prim.tex3tx));
//////	draw_text(PX + align + 150, PY + 310, string(new_prim.tex3ty));
//////	draw_set_halign(fa_left);
//////}

//////draw_set_colour($FFFFFFFF);
//////draw_text(PX, PY + 360, string("Clut X: "));
//////draw_text(PX + 150, PY + 360, string("Clut Y: "));

//////draw_set_halign(fa_right);

////////if (new_prim.cmd != old_prim.cmd){
////////		draw_set_colour($FFFFFFCC);
////////}
//////draw_text(PX + align + 150, PY + 200, string(new_prim.cmd));
////////draw_set_colour($FFFFFFFF);

////////if (new_prim.tex0tx != old_prim.tex0tx){
////////		draw_set_colour($FFFFFFCC);
////////}
//////draw_text(PX + align, PY + 240, string(new_prim.tex0tx));
////////draw_set_colour($FFFFFFFF);

////////if (new_prim.tex0ty != old_prim.tex0ty){
////////		draw_set_colour($FFFFFFCC);
////////}
//////draw_text(PX + align, PY + 260, string(new_prim.tex0ty));
////////draw_set_colour($FFFFFFFF);

////////if (new_prim.tex1tx != old_prim.tex1tx){
////////		draw_set_colour($FFFFFFCC);
////////}
//////draw_text(PX + align + 150, PY + 240, string(new_prim.tex1tx));
////////draw_set_colour($FFFFFFFF);

////////if (new_prim.tex1ty != old_prim.tex1ty){
////////		draw_set_colour($FFFFFFCC);
////////}
//////draw_text(PX + align + 150, PY + 260, string(new_prim.tex1ty));
////////draw_set_colour($FFFFFFFF);

////////if (new_prim.tex2tx != old_prim.tex2tx){
////////		draw_set_colour($FFFFFFCC);
////////}
//////draw_text(PX + align, PY + 290, string(new_prim.tex2tx));
////////draw_set_colour($FFFFFFFF);

////////if (new_prim.tex2ty != old_prim.tex2ty){
////////		draw_set_colour($FFFFFFCC);
////////}
//////draw_text(PX + align, PY + 310, string(new_prim.tex2ty));
////////draw_set_colour($FFFFFFFF);

////////if (((new_prim.texclut >> 6) & 0b0111111111) != ((new_prim.texclut >> 6) & 0b0111111111)){
////////		draw_set_colour($FFFFFFCC);
////////}
//////draw_text(PX + align + 150, PY + 360, string((new_prim.texclut >> 6) & 0b0111111111));
//////draw_set_colour($FFCCCCCC);

//////draw_text(PX + align, PY + 360, string(new_prim.texclut & 0b111111));
//////draw_set_colour($FFFFFFFF);

////////if (new_prim.texpxy != old_prim.texpxy){
////////		draw_set_colour($FFFFFFCC);
////////}
//////draw_text(PX + align, PY + 380, string(new_prim.texpxy + 16));
////////draw_set_colour($FFFFFFFF);


//////draw_set_halign(fa_right);
//////draw_set_colour($FFCCCCCC);
//////draw_text(PX + align, PY + 200, string("{0}-{1}-{2}", string(new_prim.red), string(new_prim.green), string(new_prim.blue)));
//////draw_set_colour($FFFFFFFFF);

//////draw_set_halign(fa_left);

//////if (array_length(new_prim.norm) > 3){
//////	quad_string = [string(new_prim.norm[3]), string(new_prim.vert[3])];
//////}
//////else{
//////	quad_string = ["Null", "Null"];
//////}
//////draw_text(PX + 0, PY + 440, "Normal:");
//////draw_text(PX + 0, PY + 460, "Vertex:");

//////draw_set_colour($FFCCCCCC);
//////draw_text(PX + 80, PY + 440, "[0]: ");
//////draw_text(PX + 150, PY + 440, "[1]: ");
//////draw_text(PX + 220, PY + 440, "[2]: ");
//////draw_text(PX + 290, PY + 440, "[3]: ");

//////draw_set_halign(fa_right);
//////draw_text(PX + 145, PY + 440, string(new_prim.norm[0]));
//////draw_text(PX + 215, PY + 440, string(new_prim.norm[1]));
//////draw_text(PX + 285, PY + 440, string(new_prim.norm[2]));
//////draw_text(PX + 355, PY + 440, quad_string[0]);

//////draw_set_halign(fa_left);
//////draw_text(PX + 80, PY + 460, "[0]: ");
//////draw_text(PX + 150, PY + 460, "[1]: ");
//////draw_text(PX + 220, PY + 460, "[2]: ");
//////draw_text(PX + 290, PY + 460, "[3]: ");

//////draw_set_halign(fa_right);
//////draw_text(PX + 145, PY + 460, string(new_prim.vert[0]));
//////draw_text(PX + 215, PY + 460, string(new_prim.vert[1]));
//////draw_text(PX + 285, PY + 460, string(new_prim.vert[2]));
//////draw_text(PX + 355, PY + 460, quad_string[1]);

//////draw_set_halign(fa_left);
//////draw_set_colour($FFFFFFFF);