var p_clear_active = variable_instance_get(p_clear, "active");

var prim_count;

if (mm0_base_buffer == -1){
	exit;
}

if (group_prim == 0){
	prim_count = 1;
}
else {prim_count = array_length(prim_list)}


if (p_clear_active == 1){
	prim_select = [];	
	variable_instance_set(p_clear, "active", 0);
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
	ui_prim_transparency = -1;
}