var o_all_active = variable_instance_get(o_all, "active");
var p_old_active = variable_instance_get(p_old, "active");
var t_view_active = variable_instance_get(t_view, "active");
var tim_next_active = variable_instance_get(tim_next, "active");
var ui_top_active = variable_instance_get(ui_top, "active");

if (ds_list_size(tim_list) != 0){
	variable_instance_set(tim_next, "enable", 1);
	if (mm0_base_buffer != -1){
		variable_instance_set(ui_top, "enable", 1);
	}
}
else{
	variable_instance_set(tim_next, "enable", 0);
}
if (mm0_base_buffer != -1){
	variable_instance_set(o_all, "enable", 1);
	variable_instance_set(t_view, "enable", 1);
	if (array_length(tmd_edit.objects) > 0){
		variable_instance_set(p_old, "enable", 1);
	}
	else{
		variable_instance_set(o_all, "enable", 0);
	}
}
else{
	variable_instance_set(o_all, "enable", 0);
	variable_instance_set(p_old, "enable", 0);
	variable_instance_set(t_view, "enable", 0);
}

switch (ui_top_active){
	case 0:
	ui_tim_draw_layer = 0;
	variable_instance_set(ui_top, "display", "Top Layer: Prim");
	break;
	
	case 1:
	ui_tim_draw_layer = 1;
	variable_instance_set(ui_top, "display", "Top Layer: Tim");
	break;
}

switch (o_all_active){
	case 0:
	prim_all = 0;
	break;
	
	case 1:
	prim_all = 1;
	break;
}

switch (p_old_active){
	case 0:
	prim_old = 0;
	break;
	
	case 1:
	prim_old = 1;
	break;
}
switch (t_view_active){
	case 0:
	ui_view_template = 0;
	break;
	
	case 1:
	ui_view_template = 1;
	break;
}
switch (tim_next_active){
	case 0:
	ui_tim_view_next_page = 0;
	break;
	
	case 1:
	ui_tim_view_next_page = 1;
	break;
}
