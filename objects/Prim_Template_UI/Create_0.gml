apply = 0;
image_index = 13;
toggle = 0;

globalvar ui_prim_template;
ui_prim_template = 0;

globalvar prim_transparency_string;
prim_transparency_string = ["Unchanged", "Opaque","Semi"];

Minus = instance_create_layer(x + 265, y + 0, "UI_Draw", Arrow_Button);
variable_instance_set(Minus, "image_xscale", -1);
Plus = instance_create_layer(x + 295, y + 0, "UI_Draw", Arrow_Button);
variable_instance_set(Plus, "image_xscale", 1);

Template_Create = instance_create_layer(x + 0, y + 40, "UI_Draw", Select_Button);
variable_instance_set(Template_Create, "image_index", 0);
variable_instance_set(Template_Create, "image", 0);
variable_instance_set(Template_Create, "display", "Create");
variable_instance_set(Template_Create, "enable", 0);
variable_instance_set(Template_Create, "text_x", 33);

Template_Delete = instance_create_layer(x + 100, y + 40, "UI_Draw", Select_Button);
variable_instance_set(Template_Delete, "image_index", 0);
variable_instance_set(Template_Delete, "image", 0);
variable_instance_set(Template_Delete, "display", "Delete");
variable_instance_set(Template_Delete, "enable", 0);
variable_instance_set(Template_Delete, "text_x", 33);

Template_Apply = instance_create_layer(x + 200, y + 40, "UI_Draw", Select_Button);
variable_instance_set(Template_Apply, "image_index", 0);
variable_instance_set(Template_Apply, "image", 0);
variable_instance_set(Template_Apply, "display", "Use");
variable_instance_set(Template_Apply, "enable", 0);
variable_instance_set(Template_Apply, "text_x", 33);

function prim_edit(_ui_px, _ui_py, _xmin, _xmax, _ymin, _ymax, _edit_x, _edit_y, _edit_x_ui, _edit_y_ui, _xscale, _yscale, _rotate, _flip_x, _flip_y, _prim_transparency, _bit_mode) constructor{
	ui_px = _ui_px;
	ui_py = _ui_py;
	xmin = _xmin;
	xmax = _xmax;
	ymin = _ymin;
	ymax = _ymax;
	edit_x = _edit_x;
	edit_y = _edit_y;
	edit_x_ui = _edit_x_ui;
	edit_y_ui = _edit_y_ui
	xscale = _xscale;
	yscale = _yscale;
	group_rotate = _rotate;
	flip_x = _flip_x;
	flip_y = _flip_y;
	prim_transparency = _prim_transparency;
	bit_mode = _bit_mode;
};