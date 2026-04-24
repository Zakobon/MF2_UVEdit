apply = 0;
image_index = 0;
timer = 0;
globalvar filename_array;
filename_array = [];
//export_status = ["Edit Target", "File not found", "File Found", "Exported"];
export_status = ["File not found", "File Found", "Exported!"];

Export_MM0 = instance_create_layer(x + 0, y + 0, "UI_Draw", Select_Button);
variable_instance_set(Export_MM0, "image_index", 0);
variable_instance_set(Export_MM0, "image", 0);
variable_instance_set(Export_MM0, "display", "Export MM0");
variable_instance_set(Export_MM0, "enable", 0);

A_MM0 = instance_create_layer(x + 0, y + 45, "UI_Draw", Select_Button);
variable_instance_set(A_MM0, "image_index", 4);
variable_instance_set(A_MM0, "image_xscale", 1.7);
variable_instance_set(A_MM0, "image", 4);
variable_instance_set(A_MM0, "display", "a");
variable_instance_set(A_MM0, "enable", 0);
variable_instance_set(A_MM0, "toggle_set", 1);

B_MM0 = instance_create_layer(x + 0, y + 85, "UI_Draw", Select_Button);
variable_instance_set(B_MM0, "image_index", 4);
variable_instance_set(B_MM0, "image_xscale", 1.7);
variable_instance_set(B_MM0, "image", 4);
variable_instance_set(B_MM0, "display", "b");
variable_instance_set(B_MM0, "enable", 0);
variable_instance_set(B_MM0, "toggle_set", 1);

D_MM0 = instance_create_layer(x + 0, y + 125, "TIM_Draw", Select_Button);
variable_instance_set(D_MM0, "image_index", 4);
variable_instance_set(D_MM0, "image_xscale", 1.7);
variable_instance_set(D_MM0, "image", 4);
variable_instance_set(D_MM0, "display", "d");
variable_instance_set(D_MM0, "enable", 0);
variable_instance_set(D_MM0, "toggle_set", 1);

I_MM0 = instance_create_layer(x + 0, y + 165, "UI_Draw", Select_Button);
variable_instance_set(I_MM0, "image_index", 4);
variable_instance_set(I_MM0, "image_xscale", 1.7);
variable_instance_set(I_MM0, "image", 4);
variable_instance_set(I_MM0, "display", "i");
variable_instance_set(I_MM0, "enable", 0);
variable_instance_set(I_MM0, "toggle_set", 1);

P_MM0 = instance_create_layer(x + 0, y + 205, "UI_Draw", Select_Button);
variable_instance_set(P_MM0, "image_index", 4);
variable_instance_set(P_MM0, "image_xscale", 1.7);
variable_instance_set(P_MM0, "image", 4);
variable_instance_set(P_MM0, "display", "p");
variable_instance_set(P_MM0, "enable", 0);
variable_instance_set(P_MM0, "toggle_set", 1);


V_MM0 = instance_create_layer(x + 0, y + 245, "UI_Draw", Select_Button);
variable_instance_set(V_MM0, "image_index", 4);
variable_instance_set(V_MM0, "image_xscale", 1.7);
variable_instance_set(V_MM0, "image", 4);
variable_instance_set(V_MM0, "display", "v");
variable_instance_set(V_MM0, "enable", 0);
variable_instance_set(V_MM0, "toggle_set", 1);

filename_found[0] = 0;
filename_found[1] = 0;
filename_found[2] = 0;
filename_found[3] = 0;
filename_found[4] = 0;
filename_found[5] = 0;
