var plus_active = variable_instance_get(Plus, "active");
var minus_active = variable_instance_get(Minus, "active");
var p_add_active = variable_instance_get(p_add, "active");
var p_remove_active = variable_instance_get(p_remove, "active");

if (tmd_edit != -1){
	if (array_length(prim_select) != 0){
		variable_instance_set(Plus, "enable", 1);
		variable_instance_set(Minus, "enable", 1);
		variable_instance_set(p_add, "enable", 1);
		variable_instance_set(p_remove, "enable", 1);
		if (plus_active == 1){
			//if (array_length(prim_select) == 0){
			//	ui_prim++;
			//	if (ui_prim > tmd_edit.objects[ui_obj].prim_index - 1){
			//		ui_prim = tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num;
			//	}
			//	do{
			//		ui_prim++;
			//		if (ui_prim > tmd_edit.objects[ui_obj].prim_index - 1){
			//			ui_prim = tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num;
			//		}
			//		if (tmd_edit.prim[ui_prim].page_x == ui_page - 16){
			//			break;
			//		}
			//		count++;
			//	}until (count >= tmd_edit.objects[ui_obj].prim_num);// && (ui_prim < tmd_edit.objects[ui_obj].prim_index)
			//	if (count >= tmd_edit.objects[ui_obj].prim_num){
			//		ui_prim = 0;
			//	}
			//	count = 0;
			//	if (ui_prim > tmd_edit.objects[ui_obj].prim_index - 1){
			//		ui_prim = tmd_edit.objects[ui_obj].prim_off;
			//	}
			//}
			//else{
				array_sort(prim_select, false);
				for (var a = 0; a < array_length(prim_select); a++){
				
					if (ui_prim < prim_select[a].p_id){
						ui_prim = prim_select[a].p_id;
						break;
					}
					if (ui_prim == prim_select[array_length(prim_select) - 1].p_id){
						ui_prim = prim_select[0].p_id;
						break;
					}
				
				}
			//}
			variable_instance_set(Plus, "active", 0);
			ui_prim_transparency = (tmd_edit.prim[ui_prim].cmd >> 1) & 0b1;
			ui_prim_highlight = 1;
		}
		if (minus_active == 1){
			//ui_prim--;
			//if (ui_prim < tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num){
			//	ui_prim--;
			//}
			//if (array_length(prim_select) == 0){
			//	do{
			//			ui_prim--;
			//			if (ui_prim < tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num){
			//				ui_prim = tmd_edit.objects[ui_obj].prim_index - 1;
			//				//break;
			//			}
			//			if (tmd_edit.prim[ui_prim].page_x == ui_page - 16){
			//				break;
			//			}
			//			count++;
			//		}until (count >= tmd_edit.objects[ui_obj].prim_num);
			//		if (count >= tmd_edit.objects[ui_obj].prim_num){
			//			ui_prim = 0;
			//		}
			//		count = 0;
			//		//if (ui_prim < tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num){
			//		//	ui_prim = tmd_edit.objects[ui_obj].prim_num - 1;
			//		//}
			//	}
			//else{
				array_sort(prim_select, true);
				for (var a = 0; a < array_length(prim_select); a++){
				
					if (ui_prim > prim_select[a].p_id){
						ui_prim = prim_select[a].p_id;
						break;
					}
					if (ui_prim == prim_select[array_length(prim_select) - 1].p_id){
						ui_prim = prim_select[0].p_id;
						break;
					}
				
				}
			//}
			variable_instance_set(Minus, "active", 0);
			ui_prim_transparency = (tmd_edit.prim[ui_prim].cmd >> 1) & 0b1;
			ui_prim_highlight = 1;
		}
		if(p_add_active == 1){
			if !(array_contains(prim_select, tmd_edit.prim[ui_prim])){
				array_push(prim_select, tmd_edit.prim[ui_prim]);
			}
			variable_instance_set(p_add, "active", 0);
		}
		if(p_remove_active == 1){
			if (array_contains(prim_select, tmd_edit.prim[ui_prim])){
				remove = array_get_index(prim_select, tmd_edit.prim[ui_prim]);
				array_delete(prim_select, remove, 1);
			}
			variable_instance_set(p_remove, "active", 0);
		}
	}
	else{
		variable_instance_set(Plus, "enable", 0);
		variable_instance_set(Minus, "enable", 0);
		variable_instance_set(p_add, "enable", 0);
		variable_instance_set(p_remove, "enable", 0);
	}
}