var m100_active = variable_instance_get(m100, "active");
var m10_active = variable_instance_get(m10, "active");
var m1_active = variable_instance_get(m1, "active");
var p1_active = variable_instance_get(p1, "active");
var p10_active = variable_instance_get(p10, "active");
var p100_active = variable_instance_get(p100, "active");

if (m100_active == 1){
	if (ui_file_obj_in - 100 > 3){
		ui_file_obj_in -= 100;
	}
	else{
		ui_file_obj_in = 3;
	}
	variable_instance_set(m100, "active", 0);
}
if (m10_active == 1){
	if (ui_file_obj_in - 10 > 3){
		ui_file_obj_in -= 10;
	}
	else{
		ui_file_obj_in = 3;
	}
	variable_instance_set(m10, "active", 0);
}
if (m1_active == 1){
	if (ui_file_obj_in > 3){
		ui_file_obj_in--;
	}
	variable_instance_set(m1, "active", 0);
}

if (p1_active == 1){
	if (ui_file_obj_in + 1 < array_length(file_obj_in_string)){
		ui_file_obj_in++;
	}
	
	variable_instance_set(p1, "active", 0);
}
if (p10_active == 1){
	if (ui_file_obj_in + 10 < array_length(file_obj_in_string)){
		ui_file_obj_in += 10;
	}
	else{
		ui_file_obj_in = array_length(file_obj_in_string) -1;
	}
	variable_instance_set(p10, "active", 0);
}
if (p100_active == 1){
	if (ui_file_obj_in + 100 < array_length(file_obj_in_string)){
		ui_file_obj_in += 100;
	}
	else{
		ui_file_obj_in = array_length(file_obj_in_string) -1;
	}
	variable_instance_set(p100, "active", 0);
}

if (ui_file_obj_in < 3){
	ui_file_obj_in = 3;
}
//if (array_length(milkshape_string) != 0){
//	test1 = ["",milkshape_string[ui_milkshape - 3]];
//	//test2 = ["",milkshape_string[ui_milkshape - 2]];
//	//test3 = ["",milkshape_string[ui_milkshape - 1]];
//	//test4 = ["",milkshape_string[ui_milkshape - 0]];
//}