var plus_active = variable_instance_get(Plus, "active");
var minus_active = variable_instance_get(Minus, "active");


if (tmd_edit != -1){
	if (plus_active == 1){
		ui_obj++;
		if (ui_obj >= tmd_edit.obj_num){
			ui_obj = 0;
		}
		ui_prim = tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num;
		ui_page = tmd_edit.prim[ui_prim].page_x + 16;
		variable_instance_set(Plus, "active", 0);
		prim_draw = tmd_page_search(tmd_edit);
		if (ds_list_size(tim_list) != 0){
			ui_tim = -1;
		}
	}
	
	
	if (minus_active == 1){
		ui_obj--;
		if (ui_obj < 0){
			ui_obj = tmd_edit.obj_num - 1;
		}
		ui_prim = tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num;
		ui_page = tmd_edit.prim[ui_prim].page_x + 16;
		variable_instance_set(Minus, "active", 0);
		prim_draw = tmd_page_search(tmd_edit);
		if (ds_list_size(tim_list) != 0){
			ui_tim = -1;
		}
	}
	
}