title = "Visibility";
draw_sprite_stretched(Button, 13, x + 20, y + 0, string_width(title) + 32, 32)
//draw_set_colour($FFCCCCCC)
//draw_text(x + 16, y + 7, title);

draw_set_colour($FF222222);
draw_text(x + 37, y + 9, title);
draw_set_colour($FF666666);
draw_text(x + 36, y + 7, title);
draw_set_colour($FFCCCCCC);
draw_text(x + 35, y + 5, title);

draw_set_colour($FFCCCCCC);