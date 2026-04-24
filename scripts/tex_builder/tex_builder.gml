function tex_builder(){
	tex_buffer = buffer_create(4, buffer_grow, 1);
	buffer_seek(tex_buffer, buffer_seek_start, 0);
	
	for (var a = 0; a < ds_list_size(tim_list); a++){
		import_flag = tim_list[|a].imported;
		image_w = tim_list[|a].pixel_w;
		image_h = tim_list[|a].pixel_h;
		clut_w = tim_list[|a].clut_w;
		clut_h = tim_list[|a].clut_h;
		bit_mode = tim_list[|a].bit & 0b111;
		clut_flag = (tim_list[|a].has_clut & 0b1) << 3;
		
		switch (bit_mode){
			case 0:
			clut_w = 16;
			multiplier = 2;
			clut_default = clut_4_default;
			break;
			
			case 1:
			clut_w = 256;
			multiplier = 1;
			clut_default = clut_8_default;
			break;
			
			case 2:
			clut_w = 0;
			break;
		}
		
		
		flag = (bit_mode) | (clut_flag);
		
		
		//TIM header
		buffer_write(tex_buffer, buffer_u32, 0x10);
		buffer_write(tex_buffer, buffer_u32, flag);
		
		//Exports imported TIMs without modifying their clut or pixel data sections. xy can still be changed
		if(import_flag == 1){
			buffer_write(tex_buffer, buffer_u32, 12 + ((clut_w * clut_h) * 2));//pointer to end of clut data
			buffer_write(tex_buffer, buffer_u16, tim_list[|a].clut_x);
			buffer_write(tex_buffer, buffer_u16, tim_list[|a].clut_y);
			buffer_write(tex_buffer, buffer_u16, clut_w);
			buffer_write(tex_buffer, buffer_u16, clut_h);
			
			for (var b = 0; b < clut_w; b++){
					clut_data = tim_list[|a].clut_data[b].red & 0b11111;
					clut_data = clut_data | ((tim_list[|a].clut_data[b].green & 0b11111) << 5);
					clut_data = clut_data | ((tim_list[|a].clut_data[b].blue & 0b11111) << 10);
					clut_data = clut_data | ((tim_list[|a].clut_data[b].stp & 0b1) << 15);
					buffer_write(tex_buffer, buffer_u16, clut_data);
			}
			
			buffer_write(tex_buffer, buffer_u32, 12 + ((image_w * image_h) * (2 * (2 - multiplier))));//pointer to end of Pixel data
			buffer_write(tex_buffer, buffer_u16, tim_list[|a].pixel_x);
			buffer_write(tex_buffer, buffer_u16, tim_list[|a].pixel_y);
			buffer_write(tex_buffer, buffer_u16, tim_list[|a].pixel_w);
			buffer_write(tex_buffer, buffer_u16, tim_list[|a].pixel_h);
			
			for (var b = 0; b < array_length(tim_list[|a].pixel_data); b++){
				pixel_data = tim_list[|a].pixel_data[b][0] & 0b11111111;
				pixel_data = pixel_data | ((tim_list[|a].pixel_data[b][1]& 0b11111111) << 8);
				buffer_write(tex_buffer, buffer_u16, pixel_data);
			}
		continue;
		}

			//Clut header
			buffer_write(tex_buffer, buffer_u32, 12 + ((clut_w * clut_h) * 2));
			buffer_write(tex_buffer, buffer_u16, tim_list[|a].clut_x);
			buffer_write(tex_buffer, buffer_u16, tim_list[|a].clut_y);
			buffer_write(tex_buffer, buffer_u16, clut_w);
			buffer_write(tex_buffer, buffer_u16, clut_h);
			
			//Clut data
			if (array_length(tim_list[|a].clut_data) == 1){
				for (var b = 0; b < clut_w; b++){
					switch(bit_mode){
						case 0:
						clut_data = clut_4_default;
						break;
					
						case 1:
						clut_data = clut_8_default;
						break;
					}
					clut_hold = variable_clone(clut_data[b]);
					clut_data[b] = clut_data[b] & ~0x8000;
					clut_data[b] = clut_data[b] | (tim_list[|a].bit & 0x8000);
					buffer_write(tex_buffer, buffer_u16, clut_data[b]);
				}
			}
			else if (array_length(tim_list[|a].clut_data) >= (clut_w - 1)){
				for (var b = 0; b < clut_w; b++){
					clut_data = tim_list[|a].clut_data[b].red & 0b11111;
					clut_data = clut_data | ((tim_list[|a].clut_data[b].green & 0b11111) << 5);
					clut_data = clut_data | ((tim_list[|a].clut_data[b].blue & 0b11111) << 10);
					clut_data = clut_data | ((tim_list[|a].clut_data[b].stp & 0b1) << 15);
					buffer_write(tex_buffer, buffer_u16, clut_data);
				}
			}
			else{//fill missing clut entries with default values
				for (var b = array_length(tim_list[|a].clut_data); b < clut_w; b++){
					buffer_write(tex_buffer, buffer_u16, clut_default[b]);
				}
			}
			
		
		//Pixel header
		buffer_write(tex_buffer, buffer_u32, 12 + ((image_w * image_h) * (2)));//pointer to end of Pixel data
		buffer_write(tex_buffer, buffer_u16, tim_list[|a].pixel_x);
		buffer_write(tex_buffer, buffer_u16, tim_list[|a].pixel_y);
		buffer_write(tex_buffer, buffer_u16, tim_list[|a].pixel_w);
		buffer_write(tex_buffer, buffer_u16, tim_list[|a].pixel_h);
		
		//Pixel data
		
		
		if (bit_mode == 1){
			for (var b = 0; b < array_length(tim_list[|a].pixel_data); b++){
				pixel_data = tim_list[|a].pixel_data[b][0];
				pixel_data = pixel_data | ((tim_list[|a].pixel_data[b][1]& 0b11111111) << 8) ;
				buffer_write(tex_buffer, buffer_u16, pixel_data);
			}
		}
		else{
			for (var b = 0; b < array_length(tim_list[|a].pixel_data); b++){
				pixel_data = tim_list[|a].pixel_data[b][0];
				pixel_data = pixel_data | ((tim_list[|a].pixel_data[b][1] << 4) & 0b1111);
				pixel_data = pixel_data | ((tim_list[|a].pixel_data[b][2] << 8) & 0b1111);
				pixel_data = pixel_data | ((tim_list[|a].pixel_data[b][3] << 12) & 0b1111);
				buffer_write(tex_buffer, buffer_u16, pixel_data);
			}
		}
		
		
		//Pixel data filler
		if (bit_mode == 1){
			for (var b = 0; b < image_h; b++){ 
				for (var c = 0; c < image_w; c++){
					if (b == 0){
						buffer_write(tex_buffer, buffer_u16, 0xffff);
					}
					else if(b == image_h -1 && c == 0){
						buffer_write(tex_buffer, buffer_u16, 0xffff);
					}
					else if(c == 0){
						buffer_write(tex_buffer, buffer_u16, 0x11ff);
					}
					else if(b == image_h - 1){
						buffer_write(tex_buffer, buffer_u16, 0xffff);
					}
					else if(c == image_w -1){
						buffer_write(tex_buffer, buffer_u16, 0xff11);
					}
					else{
						buffer_write(tex_buffer, buffer_u16, 0x1111);
					}
				}
			}	
		}
		else{
			for (var b = 0; b < image_h; b++){ 
				for (var c = 0; c < image_w; c++){
					if (b == 0){
						buffer_write(tex_buffer, buffer_u16, 0xffff);
					}
					else if(b == image_h -1 && c == 0){
						buffer_write(tex_buffer, buffer_u16, 0xffff);
					}
					else if(c == 0){
						buffer_write(tex_buffer, buffer_u16, 0x111f);
					}
					else if(b == image_h - 1){
						buffer_write(tex_buffer, buffer_u16, 0xffff);
					}
					else if(c == image_w -1){
						buffer_write(tex_buffer, buffer_u16, 0xf111);
					}
					else{
						buffer_write(tex_buffer, buffer_u16, 0x1111);
					}
				}
			}
		}
	}
}