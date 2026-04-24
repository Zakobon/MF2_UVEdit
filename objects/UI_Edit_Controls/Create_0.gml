globalvar x_edit;
x_edit = 0;
globalvar y_edit;
y_edit = 0;
globalvar x_edit_ui;
x_edit_ui = 0;
globalvar y_edit_ui;
y_edit_ui = 0;

globalvar prim_bit_mode;
prim_bit_mode = -1;
globalvar clut_x_ui;
clut_x_ui = -1;
globalvar clut_y_ui;
clut_y_ui = -1;

globalvar x_scale_edit;
x_scale_edit = 100;
globalvar y_scale_edit;
y_scale_edit = 100;

globalvar group_xmin;
group_xmin = 0;
globalvar group_xmax;
group_xmax = 0;
globalvar group_ymin;
group_ymin = 0;
globalvar group_ymax;
group_ymax = 0;

globalvar ui_page;
ui_page = 28;

globalvar rotate;
rotate = 0;

globalvar x_flip;
x_flip = 0;
globalvar y_flip;
y_flip = 0;

globalvar ui_prim_transparency;
ui_prim_transparency = -1;

globalvar prim_bit_mode_string;

rotate_ui = 0;
timer = 0;
ui_flip = ["No","Yes"];
transparency = ["Unchanged", "Opaque", "Semi"]
tim_bit_mode_string = [" 4-bit"," 8-bit","16-bit","24-bit","Mixed"];
prim_bit_mode_string = ["Unchanged"," 4-bit"," 8-bit","16-bit","24-bit","Mixed"];

x_m100 = instance_create_layer(x + 0, y + 0, "UI_Draw", Arrow_Button);
variable_instance_set(x_m100, "image_xscale", -1);
variable_instance_set(x_m100, "image", 4);
x_m10 = instance_create_layer(x + 32, y + 0, "UI_Draw", Arrow_Button);
variable_instance_set(x_m10, "image_xscale", -1);
variable_instance_set(x_m10, "image", 2);
x_m1 = instance_create_layer(x + 64, y + 0, "UI_Draw", Arrow_Button);
variable_instance_set(x_m1, "image_xscale", -1);
x_p1 = instance_create_layer(x + 96, y + 0, "UI_Draw", Arrow_Button);
variable_instance_set(x_p1, "image_xscale", 1);
x_p10 = instance_create_layer(x + 128, y + 0, "UI_Draw", Arrow_Button);
variable_instance_set(x_p10, "image_xscale", 1);
variable_instance_set(x_p10, "image", 2);
x_p100 = instance_create_layer(x + 160, y + 0, "UI_Draw", Arrow_Button);
variable_instance_set(x_p100, "image_xscale", 1);
variable_instance_set(x_p100, "image", 4);

y_m100 = instance_create_layer(x + 0, y + 45, "UI_Draw", Arrow_Button);
variable_instance_set(y_m100, "image_xscale", -1);
variable_instance_set(y_m100, "image", 4);
y_m10 = instance_create_layer(x + 32, y + 45, "UI_Draw", Arrow_Button);
variable_instance_set(y_m10, "image_xscale", -1);
variable_instance_set(y_m10, "image", 2);
y_m1 = instance_create_layer(x + 64, y + 45, "UI_Draw", Arrow_Button);
variable_instance_set(y_m1, "image_xscale", -1);
y_p1 = instance_create_layer(x + 96, y + 45, "UI_Draw", Arrow_Button);
variable_instance_set(y_p1, "image_xscale", 1);
y_p10 = instance_create_layer(x + 128, y + 45, "UI_Draw", Arrow_Button);
variable_instance_set(y_p10, "image_xscale", 1);
variable_instance_set(y_p10, "image", 2);
y_p100 = instance_create_layer(x + 160, y + 45, "UI_Draw", Arrow_Button);
variable_instance_set(y_p100, "image_xscale", 1);
variable_instance_set(y_p100, "image", 4);

rotate_left = instance_create_layer(x + 32, y + 90, "UI_Draw", Arrow_Button);
variable_instance_set(rotate_left, "image_xscale", -1);
rotate_right = instance_create_layer(x + 128, y + 90, "UI_Draw", Arrow_Button);
variable_instance_set(rotate_right, "image_xscale", 1);

clut_x_m1 = instance_create_layer(x + 32, y + 135, "UI_Draw", Arrow_Button);
variable_instance_set(clut_x_m1, "image_xscale", -1);
variable_instance_set(clut_x_m1, "enable", 0);	
clut_x_p1 = instance_create_layer(x + 128, y + 135, "UI_Draw", Arrow_Button);
variable_instance_set(clut_x_p1, "image_xscale", 1);
variable_instance_set(clut_x_p1, "enable", 0);

clut_y_m1 = instance_create_layer(x + 32, y + 180, "UI_Draw", Arrow_Button);
variable_instance_set(clut_y_m1, "image_xscale", -1);
variable_instance_set(clut_y_m1, "enable", 0);	
clut_y_p1 = instance_create_layer(x + 128, y + 180, "UI_Draw", Arrow_Button);
variable_instance_set(clut_y_p1, "image_xscale", 1);
variable_instance_set(clut_y_p1, "enable", 0);

xs_m100 = instance_create_layer(x + 0, y + 315, "UI_Draw", Arrow_Button);
variable_instance_set(xs_m100, "image_xscale", -1);
variable_instance_set(xs_m100, "image", 4);
xs_m10 = instance_create_layer(x + 32, y + 315, "UI_Draw", Arrow_Button);
variable_instance_set(xs_m10, "image_xscale", -1);
variable_instance_set(xs_m10, "image", 2);
xs_m1 = instance_create_layer(x + 64, y + 315, "UI_Draw", Arrow_Button);
variable_instance_set(xs_m1, "image_xscale", -1);
xs_p1 = instance_create_layer(x + 96, y + 315, "UI_Draw", Arrow_Button);
variable_instance_set(xs_p1, "image_xscale", 1);
xs_p10 = instance_create_layer(x + 128, y + 315, "UI_Draw", Arrow_Button);
variable_instance_set(xs_p10, "image_xscale", 1);
variable_instance_set(xs_p10, "image", 2);
xs_p100 = instance_create_layer(x + 160, y + 315, "UI_Draw", Arrow_Button);
variable_instance_set(xs_p100, "image_xscale", 1);
variable_instance_set(xs_p100, "image", 4);

ys_m100 = instance_create_layer(x + 0, y + 360, "UI_Draw", Arrow_Button);
variable_instance_set(ys_m100, "image_xscale", -1);
variable_instance_set(ys_m100, "image", 4);
ys_m10 = instance_create_layer(x + 32, y + 360, "UI_Draw", Arrow_Button);
variable_instance_set(ys_m10, "image_xscale", -1);
variable_instance_set(ys_m10, "image", 2);
ys_m1 = instance_create_layer(x + 64, y + 360, "UI_Draw", Arrow_Button);
variable_instance_set(ys_m1, "image_xscale", -1);
ys_p1 = instance_create_layer(x + 96, y + 360, "UI_Draw", Arrow_Button);
variable_instance_set(ys_p1, "image_xscale", 1);
ys_p10 = instance_create_layer(x + 128, y + 360, "UI_Draw", Arrow_Button);
variable_instance_set(ys_p10, "image_xscale", 1);
variable_instance_set(ys_p10, "image", 2);
ys_p100 = instance_create_layer(x + 160, y + 360, "UI_Draw", Arrow_Button);
variable_instance_set(ys_p100, "image_xscale", 1);
variable_instance_set(ys_p100, "image", 4);

xf_toggle = instance_create_layer(x + 128, y + 405, "UI_Draw", Toggle_Button);
variable_instance_set(xf_toggle, "enable", 0);
yf_toggle = instance_create_layer(x + 128, y + 450, "UI_Draw", Toggle_Button);
variable_instance_set(yf_toggle, "enable", 0);

//transparency_toggle = instance_create_layer(x + 128, y + 405, "UI_Draw", Toggle_Button);
//variable_instance_set(transparency_toggle, "enable", 0);
transparency_toggle = instance_create_layer(x + 128, y + 495, "UI_Draw", Select_Button);
variable_instance_set(transparency_toggle, "image_index", 4);
variable_instance_set(transparency_toggle, "display", transparency[ui_prim_transparency + 1]);
variable_instance_set(transparency_toggle, "image", 4);
variable_instance_set(transparency_toggle, "enable", 0);

prim_bit = instance_create_layer(x + 128, y + 540, "UI_Draw", Select_Button);
variable_instance_set(prim_bit, "image_index", 4);
variable_instance_set(prim_bit, "display", string(prim_bit_mode_string[prim_bit_mode + 1]));
variable_instance_set(prim_bit, "image", 4);
variable_instance_set(prim_bit, "enable", 0);