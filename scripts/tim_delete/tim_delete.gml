function tim_delete(){
	array_push(tim_backup,tim_list[|ui_tim]);
	ds_list_delete(tim_list, ui_tim);
	ui_tim = - 1;
}