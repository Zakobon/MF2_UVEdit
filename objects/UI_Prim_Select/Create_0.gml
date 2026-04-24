globalvar ui_prim;
ui_prim = 0;
globalvar ui_prim_x;
ui_prim_x= 0;
globalvar ui_prim_y;
ui_prim_y = 0;
globalvar prim_draw; //stores the returned array of tmd_page_search() for drawing
prim_draw = [];
globalvar ui_prim_highlight; //toggle on to highlight ui_prim when drawing
ui_prim_highlight = 0;
count = 0;

image_index = 13;
image_xscale = 5.1;
Minus = instance_create_layer(x + 40, y + 40, "UI_Draw", Arrow_Button);
variable_instance_set(Minus, "image_xscale", -1);
variable_instance_set(Minus, "enable", 0);
Plus = instance_create_layer(x + 70, y + 40, "UI_Draw", Arrow_Button);
variable_instance_set(Plus, "image_xscale", 1);
variable_instance_set(Plus, "enable", 0);

p_add = instance_create_layer(x + 0, y + 80, "UI_Draw", Select_Button);
variable_instance_set(p_add, "image_index", 0);
variable_instance_set(p_add, "image_xscale", 2.1);
variable_instance_set(p_add, "image", 0);
variable_instance_set(p_add, "display", "Add");
variable_instance_set(p_add, "enable", 0);
variable_instance_set(p_add, "text_x", 33);

p_remove = instance_create_layer(x + 80, y + 80, "UI_Draw", Select_Button);
variable_instance_set(p_remove, "image_index", 0);
variable_instance_set(p_remove, "image_xscale", 3.5);
variable_instance_set(p_remove, "image", 0);
variable_instance_set(p_remove, "display", "Remove");
variable_instance_set(p_remove, "enable", 0);
variable_instance_set(p_remove, "text_x", 55);
