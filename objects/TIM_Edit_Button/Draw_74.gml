if (current_page != ui_page){
	ui_tim_bit_mode = 1;
	variable_instance_set(bit_toggle, "display", tim_bit_mode_string[0]);
	ui_tim_transparency = 0;
	variable_instance_set(transparency_toggle, "display", tim_transparency_string[ui_tim_transparency]);
}