
if ((mouse_x >= grid_x - 24 && mouse_x < grid_x + 511 + 24) && (mouse_y >= grid_y - 24 && mouse_y < grid_y + 511 + 24)){
	grid_check = 1;
}
else{
	grid_check = 0;
}

if (grid_check == 1){
	if (mouse_check_button_pressed(mb_left)){
		border_check = 0;
		box_select = [];
		button_lock = 1;
		ui_prim = 0;
		ui_prim_highlight = 0;
		
		array_push(box_select, mouse_x);
		array_push(box_select, mouse_y);

		coord_minmax(prim_select);
		edit_write();
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
		coord_minmax(prim_select);
		if (group_xmin < 0){
			x_edit_ui = 0 - group_xmin;
			border_check = 1;
		}
		if (group_ymin < 0){
			y_edit_ui = 0 - group_ymin;
			border_check = 1;
		}
		if (group_xmax > 255){
			x_edit_ui = 255 - group_xmax;
			border_check = 1;
		}
		if (group_ymax > 255){
			y_edit_ui = 255 - group_ymax;
			border_check = 1;
		}
		if (border_check == 1){
			edit_write();
		}
	}	
}

if (mouse_check_button_released(mb_left)){
	if (array_length(box_select) != 0){
		
		array_push(box_select, mouse_x);
		array_push(box_select, mouse_y);
		
		if (prim_draw != 0){
			prim_select = coord_bounds(
					prim_draw, 
					((box_select[0])), 
					((box_select[1])), 
					((box_select[2])), 
					((box_select[3]))
			);
			coord_minmax(prim_select);
		};
		if (array_length(prim_select) != 0){
			primbase = tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num;
			ui_prim = prim_select[0].p_id + primbase;
			clut_y_ui = -1;
		}
		else if (array_length(prim_list) != 0){
			primbase = tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num;
			ui_prim = prim_list[0].p_id + primbase;
			clut_y_ui = -1;
		}
		box_select = [];
		button_lock = 0;
	}	
}