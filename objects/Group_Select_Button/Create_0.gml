globalvar group_prim;
group_prim = 0;
image_xscale = 4.5;
p_clear = instance_create_layer(x + 0, y + 40, "UI_Draw", Select_Button);
variable_instance_set(p_clear, "image_index", 0);
variable_instance_set(p_clear, "image_xscale", 4.5);