//draw primitives from here
globalvar prim_base;
prim_base = tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num;
prim_draw = tmd_page_search(tmd_edit);
box_highlight = [];

if(mm0_base_buffer == -1){
	exit;
}

// draw ghost primitives of original file to use as reference.
if (prim_old != 0){
	tmd_vertex_draw(tmd_base.prim, prim_base, tmd_base.objects[ui_obj].prim_num, c_black, c_white, 0, 0, 0, .25, 0);
}
//draw base primitives
if (prim_all == 1){
	tmd_vertex_draw(tmd_edit.prim, 0, array_length(tmd_edit.prim), $A8000000, $FF333333, 0, 0, 0, 1, 0);
}
//draw page primitives
tmd_vertex_draw(tmd_edit.prim, prim_base, tmd_edit.objects[ui_obj].prim_num, c_black, c_white, 0, 0, 0, 1, 0);





//draw ui primitives(user selection highlight + grouping)
//if (ui_page - 16 == tmd_edit.prim[ui_prim].page_x){
	
//	prim_base = tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num;
//	//if (prim_list[0] != tmd_edit.prim[ui_prim]){
//	//	prim_list = [tmd_edit.prim[ui_prim]];
//	//}
	
//	for (var i = 0; i < array_length(prim_list); i++){
//		vert_list = [
//		prim_list[i].tex_x[0] + (prim_list[i].tex_y[0]* 1000),
//		prim_list[i].tex_x[1] + (prim_list[i].tex_y[1]* 1000),
//		prim_list[i].tex_x[2] + (prim_list[i].tex_y[2]* 1000)
//		]
		
//		if (prim_list[i].cmd & 0b1000 == 8){
//			array_push(vert_list, prim_list[i].tex_x[3] + (prim_list[i].tex_y[3]* 1000));
//		}
//	}
	
//	for (var i = 0; i < tmd_edit.objects[ui_obj].prim_num; i++){
//		if (vert_search(prim_list, vert_list, tmd_edit.prim[prim_base + i])){
//			if (!array_contains(prim_list, tmd_edit.prim[prim_base + i])){
//				array_push(prim_list, tmd_edit.prim[prim_base + i]);
//			}
//		}
//	}
//	for (var i = 0; i < tmd_edit.objects[ui_obj].prim_num; i++){
//		if (vert_search(prim_list, vert_list, tmd_edit.prim[prim_base + i])){
//			if (!array_contains(prim_list, tmd_edit.prim[prim_base + i])){
//				array_push(prim_list, tmd_edit.prim[prim_base + i]);
//			}
//		}
//	}


//	//var draw_count = array_length(prim_list);
//	//if (group_prim == 0){
//	//	draw_count = 1;
//	//}
	
	
//	//tmd_vertex_draw(prim_list, 0, draw_count, $FF707038, $FFFFC7D4, 1);
//}


if (array_length(box_select) != 0){
	box_highlight = coord_bounds(
		prim_draw, 
		((box_select[0])), 
		((box_select[1])), 
		(mouse_x), 
		(mouse_y)
	);
	if (array_length(box_highlight) != 0){ 
		tmd_vertex_draw(box_highlight, 0, array_length(box_highlight), $FF66B759, $FFFFC7D4, 0, c_red, 0, 1, 0);
	}
}

//highlight edit selection primitives
//draw_set_alpha(.5);
tmd_vertex_draw(prim_select, 0, array_length(prim_select), $FFC9B759, $FFFFC7D4, 1, c_red, 0, 1, 1);
draw_set_alpha(1);

//highlight ui_prim selection
//reduce draw alpha if ui_prim is already inside prim_select

if (ui_prim_highlight != 0){
	if (array_contains(prim_select, tmd_edit.prim[ui_prim])){
		duplicate_transparency = .5;
	}
	else{
		duplicate_transparency = 1;
	}
	tmd_vertex_draw(tmd_edit.prim[ui_prim], 0, 1, $FF6DFCED, $FFFFC7D4, 1, c_red, 0, duplicate_transparency, 0);
}
if(ui_view_template == 1){
	if (array_length(prim_edit_backup) != 0){
		tmd_vertex_draw(prim_select, 0, array_length(prim_select), 0, $FFFFC7D4, 1, 0, 1, .25, 0);
	}
}
draw_set_alpha(1);
//clut_xy = 505;
//clut_xy = 32320;
clut_x = 0 & 0b111111;
clut_y = 506 << 6;
clut_xy = clut_x + clut_y;
//test1 = ["clut_x = ", string(clut_x)];
//test2 = ["clut_y = ", string(clut_y)];
//test3 = ["clut_xy & 0b111111 = ", string(clut_xy & 0b111111)];
//test4 = ["clut_xy >> 6) & 0b0111111111 = ", string((clut_xy >> 6) & 0b0111111111)];
//string(prim.texclut & 0b111111);
//string((prim.texclut >> 6) & 0b0111111111);
gpu_cmd = tmd_edit.prim[ui_prim].cmd;

cmd4 = ["3-sided","4-sided"];
cmd1 = ["Opaque","Semi-Transparent"];
cmd0 = ["False","True"];

cmd4_flag = 0;
cmd1_flag = 0;
cmd0_flag = 0;
if ((gpu_cmd & 0b1000) > 0){
	cmd4_flag = 1;
}
if ((gpu_cmd & 0b0010) > 0){
	cmd1_flag = 1;
}
if ((gpu_cmd & 0b0001) > 0){
	cmd0_flag = 1;
}

//test1 = ["CMD & 0b1000: ", gpu_cmd & 0b1000];
//test2 = ["CMD & 0b0010", gpu_cmd & 0b0010];
//test3 = ["Polygon: ", cmd3[cmd4_flag]];
//test4 = ["transparency: ", cmd2[cmd1_flag]];