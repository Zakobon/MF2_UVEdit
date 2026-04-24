var plus_active = variable_instance_get(Plus, "active");
var minus_active = variable_instance_get(Minus, "active");

if (plus_active == 1){
	ui_tim = -1;
	ui_prim_highlight = 0;
	if (ui_page == 31) {
		ui_page = 28;
	}
	else {
		ui_page++;
		
	}
	if (ds_list_size(tim_list) == 0){
		
		variable_instance_set(Plus, "active", 0)
		return;
	}
	variable_instance_set(Plus, "active", 0)
	if(tmd_edit != -1){
		prim_draw = tmd_page_search(tmd_edit);
	}
	ui_prim_transparency = -1;
}
if (minus_active == 1){
	ui_tim = -1;
	ui_prim_highlight = 0;
	if (ui_page == 28) {
		ui_page = 31;
	}
	else {
		ui_page--;
	}
	if (ds_list_size(tim_list) == 0){
		variable_instance_set(Minus, "active", 0)
		return;
	}
	variable_instance_set(Minus, "active", 0)
	if(tmd_edit != -1){
		prim_draw = tmd_page_search(tmd_edit);
	}
	ui_prim_transparency = -1;
}