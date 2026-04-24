//if (tmd_edit != -1){ 
//		var A_MM0_active = variable_instance_get(A_MM0, "active");
//		var B_MM0_active = variable_instance_get(B_MM0, "active");
//		var D_MM0_active = variable_instance_get(D_MM0, "active");
//		var I_MM0_active = variable_instance_get(I_MM0, "active");
//		var P_MM0_active = variable_instance_get(P_MM0, "active");
//		var V_MM0_active = variable_instance_get(V_MM0, "active");
//		target_export_active = A_MM0_active | B_MM0_active | D_MM0_active | I_MM0_active | P_MM0_active | V_MM0_active;
//		//file_destination = get_open_filename_ext("MRDX MM_ Files|*.mmj;*.mmx", fname_mm0, "","Save MRDX MMJ/MMX Files");
//		if (target_export_active < 1){
//			apply_edit(mm0_base_buffer);
//			export_path = get_save_filename_ext("MRDX MM_ Files|*.mmj;*.mmx", ui_name_mm0, "","Save MRDX MMJ/MMX File");
//			buffer_save(mm0_base_buffer, export_path);
//			exit;
//		}		
//		if !(show_question("Would you like to export changes to each selected file type?")){
//			exit;
//		}
//		file_destination = filename_input;
//		base_tag = string_copy(file_destination, string_length(file_destination) - 4, 5);
//		new_tag = string_delete(base_tag, 0, 1);
		
//		if (A_MM0_active == 1){
//			new_filename = string_replace(filename_input, base_tag,"a" + new_tag);
//			if(file_exists(new_filename)){
//				a_mm0_buffer = buffer_load(new_filename);
//				apply_edit(a_mm0_buffer);
//				buffer_save(a_mm0_buffer, new_filename);
//				a_found = 2;
//			}
//			else{
//				a_found = 1;
//			}
//		}
		
//		if (B_MM0_active == 1){
//			new_filename = string_replace(filename_input, base_tag,"b" + new_tag);
//			if(file_exists(new_filename)){
//				b_mm0_buffer = buffer_load(new_filename);
//				apply_edit(b_mm0_buffer);
//				buffer_save(b_mm0_buffer, new_filename);
//				b_found = 2;
//			}
//			else{
//				b_found = 1;
//			}
//		}
		
//		if (D_MM0_active == 1){
//			new_filename = string_replace(filename_input, base_tag,"d" + new_tag);
//			if(file_exists(new_filename)){
//				d_mm0_buffer = buffer_load(new_filename);
//				apply_edit(d_mm0_buffer);
//				buffer_save(d_mm0_buffer, new_filename);
//				d_found = 2;
//			}
//			else{
//				d_found = 1;
//			}
//		}
		
//		if (I_MM0_active == 1){
//			new_filename = string_replace(filename_input, base_tag,"i" + new_tag);
//			if(file_exists(new_filename)){
//				i_mm0_buffer = buffer_load(new_filename);
//				apply_edit(i_mm0_buffer);
//				buffer_save(i_mm0_buffer, new_filename);
//				i_found = 2;
//			}
//			else{
//				i_found = 1;
//			}
//		}
		
//		if (P_MM0_active == 1){
//			new_filename = string_replace(filename_input, base_tag,"p" + new_tag);
//			if(file_exists(new_filename)){
//				p_mm0_buffer = buffer_load(new_filename);
//				apply_edit(p_mm0_buffer);
//				buffer_save(p_mm0_buffer, new_filename);
//				p_found = 2;
//			}
//			else{
//				p_found = 1;
//			}
//		}
		
//		if (V_MM0_active == 1){
//			new_filename = string_replace(filename_input, base_tag,"v" + new_tag);
//			if(file_exists(new_filename)){
//				v_mm0_buffer = buffer_load(new_filename);
//				apply_edit(v_mm0_buffer);
//				buffer_save(v_mm0_buffer, new_filename);
//				v_found = 2;
//			}
//			else{
//				v_found = 1;
//			}
//		}
//	//wasn't sure what the best way to check for targeted edits, this is definitely not it
//	//should probably just make obvious split between targeted edits like above and a simple export from import button
//	//if ((((a_found | b_found) | (d_found | i_found)) | (p_found | v_found)) <= 1){ 
//	//	apply_edit(mm0_base_buffer);
//	//	export_path = get_save_filename_ext("MRDX MM_ Files|*.mmj;*.mmx", ui_name_mm0, "","Save MRDX MMJ/MMX File");
//	//	buffer_save(mm0_base_buffer, export_path);
//	//}
//}