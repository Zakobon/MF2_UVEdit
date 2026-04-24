function tim_import(_filename_input, _group_flag){
	filename_input = _filename_input;
	directory = "";
	file_list = [];
	//filename_input = get_open_filename_ext("MRDX TIM Files|*.tim", "", "","Open MRDX TIM File");
	if (filename_input == ""){
		exit;
	}
	filename_array = string_split(filename_input, "\\");
	
	//creates an array of strings that contain the directories of each tim file 
	if(_group_flag == 1){
		array_delete(filename_array, array_length(filename_array) - 1, 1)
		filename = "";
		for (var a = 0; a < array_length(filename_array); a++){
			new_directory = string_insert(filename_array[a] + "\\", directory, string_length(directory) + 1);
			directory = new_directory;
		}
		new_filename = string_insert("*.tim", directory, string_length(directory) + 1);
		filename = new_filename;
		
		files = file_find_first(filename, fa_none);
		while(files != ""){
			array_push(file_list, files);
			files = file_find_next();
		}
	}
	else{
		filename = "";
		for (var a = 0; a < array_length(filename_array) - 1; a++){
			new_directory = string_insert(filename_array[a] + "\\", directory, string_length(directory) + 1);
			directory = new_directory;
		}
		file_list = [filename_array[array_length(filename_array) - 1]];
	}
	
	for (var a = 0; a < array_length(file_list); a++){
		name_tim_array = string_split(file_list[a], "\\");
		name_tim = name_tim_array[0];
		
		filename_input = string_insert(file_list[a], directory, string_length(directory) + 1);
		timbuffer = buffer_load(filename_input);
	    buffer_seek(timbuffer, buffer_seek_start, 0);
	
		while (filename_input != "" && buffer_tell(timbuffer) + 16 < buffer_get_size(timbuffer)) {
			tim = {
			imported : 1,
			filename : "[Null]", //for importing/exporting TIMs, not TEX
			file_id : 0x10,
			version : 0x00, //always 0x00
			bit_flag : 0x09, //(bit0-2=Type; bit3=HasCLUT bit4-31=Reserved/zero)
		
			bit : 0, //0bx111
			has_clut : 0, //1xxx

			clut_size : 0,
			clut_x : 0,
			clut_y : 0,
			clut_w : 0,
			clut_h : 0,
			clut_data : [],

		

			pixel_size : 0,
			pixel_x : 0,
			pixel_y : 0,
			pixel_w : 0,
			pixel_h : 0,
			pixel_data : [],
		}

			tim.filename = name_tim;
			tim.tim_id = buffer_read(timbuffer, buffer_u32);
			tim.bit_flag = buffer_read(timbuffer, buffer_u32);
	
			tim.clut_size = buffer_read(timbuffer, buffer_u32);
			tim.clut_x = buffer_read(timbuffer, buffer_u16);
			tim.clut_y = buffer_read(timbuffer, buffer_u16);
			tim.clut_w = buffer_read(timbuffer, buffer_u16);
			tim.clut_h = buffer_read(timbuffer, buffer_u16);
	
			tim.clut_data = [];

			for (var i = 0; i < tim.clut_w * tim.clut_h; i++) {
				var clut_entry = buffer_read(timbuffer, buffer_u16);
				entry = {
					red : clut_entry & 0b11111,
					green : clut_entry >> 5 & 0b11111,
					blue : clut_entry >> 10 & 0b11111,			
					stp : clut_entry >> 15 & 0b1
				}
				array_push(tim.clut_data, entry);
			}
	
			tim.pixel_size = buffer_read(timbuffer, buffer_u32);
			tim.pixel_x = buffer_read(timbuffer, buffer_u16);
			tim.pixel_y = buffer_read(timbuffer, buffer_u16);
			tim.pixel_w = buffer_read(timbuffer, buffer_u16);
			tim.pixel_h = buffer_read(timbuffer, buffer_u16);
	
			tim.pixel_data = [];
	
			for (var i = 0; i < (tim.pixel_w * 2) * tim.pixel_h; i++) {
				Pixel_entry = buffer_read(timbuffer, buffer_u8);
				first = Pixel_entry & 0b1111;
				second = Pixel_entry >> 4 & 0b1111;
				pixel_data = [first, second];
				array_push(tim.pixel_data, pixel_data);
			}
			ds_list_insert(tim_list, ds_list_size(tim_list), tim);
		}
	}
}