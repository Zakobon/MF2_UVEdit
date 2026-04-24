function edit_reset(){
	if (array_length(prim_select) != 0){
		primbase = tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num;
		for (var a = 0; a < array_length(prim_select); a++){
			prim_id = prim_select[a].p_id + primbase;
			tmd_edit.prim[prim_id] = variable_clone(tmd_base.prim[prim_id]);
			for (var b = 0; b < array_length(tmd_edit.prim[prim_id].tex_x); b++){
				tmd_edit.prim[prim_id].x_diff[b] = 0;
				tmd_edit.prim[prim_id].y_diff[b] = 0;
			}
			tmd_edit.prim[prim_id].r_steps = [];
			tmd_edit.prim[prim_id].r_cx = [];
			tmd_edit.prim[prim_id].r_cy = []
		}
	}
}