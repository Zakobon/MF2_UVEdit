if (ds_list_size(tim_list) != 0){
	tex_builder();
	if (fname_mm0 != ""){
		export_path = get_save_filename_ext("PSX TEX|*.tex", fname_mm0, "","Save PSX TEX File TEST1");
	}
	else{
		export_path = get_save_filename_ext("PSX TEX|*.tex", "xx_xx", "","Save PSX TEX File TEST2");
	}
	buffer_save(tex_buffer, export_path);
	check++;
}