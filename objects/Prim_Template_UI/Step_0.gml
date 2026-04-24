var plus_active = variable_instance_get(Plus, "active");
var minus_active = variable_instance_get(Minus, "active");
var template_create_active = variable_instance_get(Template_Create, "active");
var template_delete_active = variable_instance_get(Template_Delete, "active");
var template_apply_active = variable_instance_get(Template_Apply, "active");

if (tmd_edit == -1){
	exit;
}
else{
	variable_instance_set(Template_Create, "enable", 1);
}

if (array_length(prim_edit_backup) != 0){
	variable_instance_set(Template_Apply, "enable", 1);
	variable_instance_set(Template_Delete, "enable", 1);
}
else {
	variable_instance_set(Template_Apply, "enable", 0);
	variable_instance_set(Template_Delete, "enable", 0);
}

if (plus_active == 1){
	if(array_length(prim_edit_backup) != 0){
		ui_prim_template++
		if (ui_prim_template > array_length(prim_edit_backup)){
			ui_prim_template = 1;
		}
	}
	variable_instance_set(Plus, "active", 0);
}
if (minus_active == 1){
	if(array_length(prim_edit_backup) != 0){
		ui_prim_template--;
		if (ui_prim_template < 1){
			ui_prim_template = array_length(prim_edit_backup);
		}
	}
	variable_instance_set(Minus, "active", 0);
}
if (template_create_active == 1){
	array_push(prim_edit_backup, 
		new prim_edit(
			ui_prim_x,
			ui_prim_y,
			group_xmin,
			group_xmax,
			group_ymin,
			group_ymax,
			x_edit,
			y_edit,
			x_edit_ui,
			y_edit_ui,
			x_scale_edit,
			y_scale_edit,
			rotate,
			x_flip,
			y_flip,
			ui_prim_transparency,
			prim_bit_mode
		)
	);
	ui_prim_template = array_length(prim_edit_backup);
	variable_instance_set(Template_Create, "active", 0);
}

if (template_delete_active == 1){
	if (array_length(prim_edit_backup) == 0){
		ui_prim_template = 0;
	}
	else{
		array_delete(prim_edit_backup, ui_prim_template - 1, 1);
		ui_prim_template = array_length(prim_edit_backup);
	}
	variable_instance_set(Template_Delete, "active", 0);
}

if (template_apply_active == 1){
	if(ui_prim_template == 0){
		ui_prim_x = 0;
		ui_prim_y = 0;
		group_xmin = 0;
		group_xmax = 0;
		group_ymin = 0;
		group_ymax = 0;
		x_edit = 0;
		y_edit = 0;
		x_edit_ui = 0;
		y_edit_ui = 0;
		x_scale_edit = 100;
		y_scale_edit = 100;
		rotate = 0;
		x_flip = 0;
		y_flip = 0;
		ui_prim_transparency = -1;
		prim_bit_mode = -1;
	}
	if (array_length(prim_edit_backup) != 0){
		edit_undo = prim_edit_backup[ui_prim_template - 1];
		ui_prim_x = edit_undo.ui_px;
		ui_prim_y = edit_undo.ui_py;
		group_xmin = edit_undo.xmin;
		group_xmax = edit_undo.xmax;
		group_ymin = edit_undo.ymin;
		group_ymax = edit_undo.ymax;
		x_edit = edit_undo.edit_x;
		y_edit = edit_undo.edit_y;
		x_edit_ui = edit_undo.edit_x_ui;
		y_edit_ui = edit_undo.edit_y_ui;
		x_scale_edit = edit_undo.xscale;
		y_scale_edit = edit_undo.yscale;
		rotate = edit_undo.group_rotate;
		x_flip = edit_undo.flip_x;
		y_flip = edit_undo.flip_y;
		ui_prim_transparency = edit_undo.prim_transparency;
		prim_bit_mode = edit_undo.bit_mode;
	}
	variable_instance_set(Template_Apply, "active", 0);
}