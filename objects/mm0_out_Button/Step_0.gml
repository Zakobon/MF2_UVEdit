if (mm0_base_buffer != -1){
	image_index = 0;
	apply = 1;
	variable_instance_set(Export_MM0, "enable", 1);
	
	if (variable_instance_get(A_MM0, "enable") == 0){
		variable_instance_set(A_MM0, "enable", 1);
		variable_instance_set(B_MM0, "enable", 1);
		variable_instance_set(D_MM0, "enable", 1);
		variable_instance_set(I_MM0, "enable", 1);
		variable_instance_set(P_MM0, "enable", 1);
		variable_instance_set(V_MM0, "enable", 1);	
	}
	var A_MM0_active = variable_instance_get(A_MM0, "active");
	var B_MM0_active = variable_instance_get(B_MM0, "active");
	var D_MM0_active = variable_instance_get(D_MM0, "active");
	var I_MM0_active = variable_instance_get(I_MM0, "active");
	var P_MM0_active = variable_instance_get(P_MM0, "active");
	var V_MM0_active = variable_instance_get(V_MM0, "active");
	var Export_active = variable_instance_get(Export_MM0, "active");
	targeted_export = A_MM0_active | B_MM0_active | D_MM0_active | I_MM0_active | P_MM0_active | V_MM0_active;
	if (targeted_export != 0){
		variable_instance_set(Export_MM0, "display", "Bulk Export");
	}
	else{ 
		variable_instance_set(Export_MM0, "display", "Export MM0");
	}

	if (Export_active == 1){
		//file_destination = get_open_filename_ext("MRDX MM_ Files|*.mmj;*.mmx", fname_mm0, "","Save MRDX MMJ/MMX Files");
		
		
		if (targeted_export == 0){
			apply_edit(mm0_base_buffer);
			export_path = get_save_filename_ext("MRDX MM_ Files|*.mmj;*.mmx", ui_name_mm0, "","Save MRDX MMJ/MMX File");
			buffer_save(mm0_base_buffer, export_path);
			variable_instance_set(Export_MM0, "active", 0);
			exit;
		}		
		if !(show_question("This will export your changes to each of the model's variants in the imported file's directory.\n\n\n Are you sure?")){
			variable_instance_set(Export_MM0, "active", 0);
			exit;
		}
		
		if (A_MM0_active == 1){
			if(file_exists(filename_array[0])){
				a_mm0_buffer = buffer_load(filename_array[0]);
				apply_edit(a_mm0_buffer);
				buffer_save(a_mm0_buffer, filename_array[0]);
				filename_found[0] = 2;
			}
		}	
		if (B_MM0_active == 1){
			if(file_exists(filename_array[1])){
				b_mm0_buffer = buffer_load(filename_array[1]);
				apply_edit(b_mm0_buffer);
				buffer_save(b_mm0_buffer, filename_array[1]);
				filename_found[1] = 2;
			}
			
		}	
		if (D_MM0_active == 1){
			if(file_exists(filename_array[2])){
				d_mm0_buffer = buffer_load(filename_array[2]);
				apply_edit(d_mm0_buffer);
				buffer_save(d_mm0_buffer, filename_array[2]);
				filename_found[2] = 2;
			}
		
		}	
		if (I_MM0_active == 1){
			if(file_exists(filename_array[3])){
				i_mm0_buffer = buffer_load(filename_array[3]);
				apply_edit(i_mm0_buffer);
				buffer_save(i_mm0_buffer, filename_array[3]);
				filename_found[3] = 2;
			}
		}
		if (P_MM0_active == 1){
			if(file_exists(filename_array[4])){
				p_mm0_buffer = buffer_load(filename_array[4]);
				apply_edit(p_mm0_buffer);
				buffer_save(p_mm0_buffer, filename_array[4]);
				filename_found[4] = 2;
			}
		}		
		if (V_MM0_active == 1){
			if(file_exists(filename_array[5])){
				v_mm0_buffer = buffer_load(filename_array[5]);
				apply_edit(v_mm0_buffer);
				buffer_save(v_mm0_buffer, filename_array[5]);
				filename_found[5] = 2;
			}
		}
		timer = 0;
		variable_instance_set(Export_MM0, "active", 0);
	}
	
		
	if (array_length(filename_array) == 0){
		exit;
	}
	timer++;
	if (timer % 30 == 0){
		for (var a = 0; a < 6; a++){
			if(file_exists(filename_array[a])){
				filename_found[a] = 1;
			}
			else{
				filename_found[a] = 0;
			}
		}
	}
	
}
else{
	image_index = 1;
	apply = 0;
	exit;
}
