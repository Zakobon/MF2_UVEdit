Plus = 0;
Minus = 0;

Minus = instance_create_layer(x + 40, y + 25, "UI_Draw", Arrow_Button);
variable_instance_set(Minus, "image_xscale", -1);
Plus = instance_create_layer(x + 70, y + 25, "UI_Draw", Arrow_Button);
variable_instance_set(Plus, "image_xscale", 1);