globalvar file_obj_in; // milkshape = file_text_open_read(filename)
file_obj_in = -1;
globalvar file_obj; // struct that will hold the sorted MilkShape 3D data
file_obj = -1;
globalvar file_obj_in_string; // array that holds each line of the milkshape file, excluding blank lines
file_obj_in_string = [];
globalvar ui_file_obj_in; // current milkshape_string[] line selected in the ui
ui_file_obj_in = 0;
globalvar file_obj_out;
file_obj_out = -1;

m100 = instance_create_layer(x + 240, y + 0, "Vertex_Draw", Arrow_Minus_100);
m10 = instance_create_layer(x + 280, y + 0, "Vertex_Draw", Arrow_Minus_10);
m1 = instance_create_layer(x + 320, y + 0, "Vertex_Draw", Arrow_Minus_1);
p1 = instance_create_layer(x + 360, y + 0, "Vertex_Draw", Arrow_Plus_1);
p10 = instance_create_layer(x + 400, y + 0, "Vertex_Draw", Arrow_Plus_10);
p100 = instance_create_layer(x + 440, y + 0, "Vertex_Draw", Arrow_Plus_100);