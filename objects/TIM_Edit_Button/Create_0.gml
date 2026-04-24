globalvar ui_tim;
ui_tim = -1;
globalvar ui_timx;
ui_timx = 0;
globalvar ui_timy;
ui_timy = 0;
globalvar ui_timw;
ui_timw = 0;
globalvar ui_timh;
ui_timh = 0;
globalvar ui_timclutx;
ui_timclutx = 0; //0-15// 16 total if 4-bit
globalvar ui_timcluty;
ui_timcluty = 505; //505-511// 6 total
globalvar ui_tim_transparency;
ui_tim_transparency = 0;
globalvar ui_tim_bit_mode;
ui_tim_bit_mode = 1;
globalvar tim_bit_mode_string;
tim_bit_mode_string = [" 4-bit"," 8-bit","16-bit","24-bit","Mixed"];
globalvar tim_transparency_string;
tim_transparency_string = ["--Null--","Opaque","  Semi  "];

timx = 0;
timy = 0;
timw = 0;
timh = 0;
current_page = ui_page;

timer = 0;
//maximum grid x value for a TIM's x and width
x_cap = 128;
//------------------------Temp------------------------
//Minus = instance_create_layer(x + 64, y + 0, "UI_Draw", Arrow_Button);
//Plus = instance_create_layer(x + 96, y + 0, "UI_Draw", Arrow_Button);
Minus = instance_create_layer(x + 64, y + 0, "UI_Draw", Arrow_Button);
variable_instance_set(Minus, "image_xscale", -1);
Plus = instance_create_layer(x + 96, y + 0, "UI_Draw", Arrow_Button);
variable_instance_set(Plus, "image_xscale", 1);
//-----------------------^Temp^-----------------------

//x coord
x_m10 = instance_create_layer(x + 32, y + 45, "UI_Draw", Arrow_Button);
variable_instance_set(x_m10, "image_xscale", -1);
variable_instance_set(x_m10, "image", 2);
x_m1 = instance_create_layer(x + 64, y + 45, "UI_Draw", Arrow_Button);
variable_instance_set(x_m1, "image_xscale", -1);
x_p1 = instance_create_layer(x + 96, y + 45, "UI_Draw", Arrow_Button);
variable_instance_set(x_p1, "image_xscale", 1);
x_p10 = instance_create_layer(x + 128, y + 45, "UI_Draw", Arrow_Button);
variable_instance_set(x_p10, "image_xscale", 1);
variable_instance_set(x_p10, "image", 2);
//y coord
y_m10 = instance_create_layer(x + 32, y + 90, "UI_Draw", Arrow_Button);
variable_instance_set(y_m10, "image_xscale", -1);
variable_instance_set(y_m10, "image", 2);
y_m1 = instance_create_layer(x + 64, y + 90, "UI_Draw", Arrow_Button);
variable_instance_set(y_m1, "image_xscale", -1);
y_p1 = instance_create_layer(x + 96, y + 90, "UI_Draw", Arrow_Button);
variable_instance_set(y_p1, "image_xscale", 1);
y_p10 = instance_create_layer(x + 128, y + 90, "UI_Draw", Arrow_Button);
variable_instance_set(y_p10, "image_xscale", 1);
variable_instance_set(y_p10, "image", 2);
//width
w_m10 = instance_create_layer(x + 32, y + 135, "UI_Draw", Arrow_Button);
variable_instance_set(w_m10, "image_xscale", -1);
variable_instance_set(w_m10, "image", 2);
w_m1 = instance_create_layer(x + 64, y + 135, "UI_Draw", Arrow_Button);
variable_instance_set(w_m1, "image_xscale", -1);
w_p1 = instance_create_layer(x + 96, y + 135, "UI_Draw", Arrow_Button);
variable_instance_set(w_p1, "image_xscale", 1);
w_p10 = instance_create_layer(x + 128, y + 135, "UI_Draw", Arrow_Button);
variable_instance_set(w_p10, "image_xscale", 1);
variable_instance_set(w_p10, "image", 2);
//height
h_m10 = instance_create_layer(x + 32, y + 180, "UI_Draw", Arrow_Button);
variable_instance_set(h_m10, "image_xscale", -1);
variable_instance_set(h_m10, "image", 2);
h_m1 = instance_create_layer(x + 64, y + 180, "UI_Draw", Arrow_Button);
variable_instance_set(h_m1, "image_xscale", -1);
h_p1 = instance_create_layer(x + 96, y + 180, "UI_Draw", Arrow_Button);
variable_instance_set(h_p1, "image_xscale", 1);
h_p10 = instance_create_layer(x + 128, y + 180, "UI_Draw", Arrow_Button);
variable_instance_set(h_p10, "image_xscale", 1);
variable_instance_set(h_p10, "image", 2);
//adjusts the y coord for clut within the 505 - 511 area that Monster Rancher 2 uses for it's monsters
//cluts x coords shouldn't need to be changed from 0 unless there's a use for 4bit mode? 
clut_x_m1 = instance_create_layer(x + 64, y + 225, "UI_Draw", Arrow_Button);
variable_instance_set(clut_x_m1, "image_xscale", -1);
clut_x_p1 = instance_create_layer(x + 96, y + 225, "UI_Draw", Arrow_Button);
variable_instance_set(clut_x_p1, "image_xscale", 1);
clut_y_m1 = instance_create_layer(x + 64, y + 270, "UI_Draw", Arrow_Button);
variable_instance_set(clut_y_m1, "image_xscale", -1);
clut_y_p1 = instance_create_layer(x + 96, y + 270, "UI_Draw", Arrow_Button);
variable_instance_set(clut_y_p1, "image_xscale", 1);

//--transparency export doesn't work right
//--correctly changes the stp bit, but the tex file ingame stays opaque??
transparency_toggle = instance_create_layer(x + 128, y + 315, "UI_Draw", Select_Button);
variable_instance_set(transparency_toggle, "image_index", 4);
//variable_instance_set(transparency_toggle, "image_xscale", 1.1);
variable_instance_set(transparency_toggle, "display", tim_transparency_string[ui_tim_transparency]);
variable_instance_set(transparency_toggle, "image", 4);
variable_instance_set(transparency_toggle, "enable", 0);
bit_toggle = instance_create_layer(x + 45, y - 40, "UI_Draw", Select_Button);
variable_instance_set(bit_toggle, "image_index", 4);
variable_instance_set(bit_toggle, "display", tim_bit_mode_string[ui_tim_bit_mode]);
variable_instance_set(bit_toggle, "image", 4);
variable_instance_set(bit_toggle, "enable", 0);

