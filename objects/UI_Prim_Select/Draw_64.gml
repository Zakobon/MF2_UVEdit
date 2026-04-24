draw_set_colour($FF222222);
draw_text(x + 17, y + 9, string("Primitive Select"));
draw_set_colour($FF666666);
draw_text(x + 16, y + 7, string("Primitive Select"));
draw_set_colour($FFCCCCCC);
draw_text(x + 15, y + 5, string("Primitive Select"));

if(tmd_base == -1)
{
	draw_set_colour($FF7F7F7F);
}

else
{
	draw_set_colour($FFFFFFFF);
}

//draw_text(x + 16, y + 7, "Primitive");

draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(x + 55, y + 45, + string(ui_prim));
draw_text(x + 130, y + 45, + array_length(prim_select)); 
draw_text(x + 170, y + 45, + "Total");
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// draw_text(x + 0, y + 60, string("Primitive Edit") + "");

// draw_text(x + 45, y + 90,  + string(ui_prim));

draw_set_colour($FFFFFFFF);