if(mm0_base_buffer == -1){
	exit;
}
current_obj = ui_obj;

draw_text(x, y + 0, "--Object--");
draw_text(x, y + 20, string("#: ") + string(ui_obj));
draw_text(x + 45, y + 20, string("/ ") + string(tmd_edit.obj_num));
draw_text(x, y + 40, string("Vert Num: ") + string(tmd_edit.objects[current_obj].vert_num));
draw_text(x, y + 60, string("Norm Top: ") + string(tmd_edit.objects[current_obj].normal_off));
draw_text(x, y + 80, string("Norm Num: ") + string(tmd_edit.objects[current_obj].normal_num));
draw_text(x, y + 100, string("Prim Top: ") + string(tmd_edit.objects[current_obj].prim_off));
draw_text(x, y + 120, string("Prim Num: ") + string(tmd_edit.objects[current_obj].prim_num));
draw_text(x, y + 140, string("Size: ") + string(tmd_edit.objects[current_obj].scale));
draw_text(x, y + 160, string("obj_off: ") + string(tmd_edit.obj_off));
draw_text(x, y + 180, string("prim_index: ") + string(tmd_edit.objects[current_obj].prim_index));
draw_text(x, y + 200, string("Prim Index: ") + string(prim_base));