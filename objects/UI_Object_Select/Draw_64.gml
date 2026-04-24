if(tmd_base == -1)
{
	draw_set_colour($FF7F7F7F);

}

else
{
	draw_set_colour($FFFFFFFF);

}

draw_text(x + 0, y + 0, "Object");

draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(x + 55, y + 30,  + string(ui_obj));

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_colour($FFFFFFFF);
