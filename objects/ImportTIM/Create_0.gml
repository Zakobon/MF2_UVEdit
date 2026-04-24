globalvar ui_name_tex;
ui_name_tex = "";

globalvar tim_buffer;
tim_buffer = -1;

filename_input = "";



tim_buffer_list = [];

filename_input = get_open_filename_ext("MRDX TIM Files|*.tim;*.tex", "", "","Open MRDX TEX/TIM File");
filename_array = string_split(filename_input, "\\");
ui_name_tex = filename_array[array_length(filename_array) - 1];

if (filename_input != "") {
    tim_buffer = buffer_load(filename_input);
    buffer_seek(tim_buffer, buffer_seek_start, 0);
	ds_list_clear(tim_list);
 }
else{
	instance_destroy();
	exit;
}
 
while (filename_input != "" && buffer_tell(tim_buffer) + 16 < buffer_get_size(tim_buffer)) {

	
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
	clut_entry = {
		red : 0,
		green : 0,
		blue : 0,
		stp : 0 //transparency control bit - 0/!0-!0-!0 for opaque, 1/X-X-X for semi-transparent 0/0-0-0 for full transparency
	}
	
	tim.file_id = buffer_read(tim_buffer, buffer_u32);
	tim.bit_flag = buffer_read(tim_buffer, buffer_u32);
	tim.bit = tim.bit_flag & 0b111;
	tim.has_clut = tim.bit_flag & (0b1 << 3); 
	tim.clut_size = buffer_read(tim_buffer, buffer_u32);
	tim.clut_x = buffer_read(tim_buffer, buffer_u16);
	tim.clut_y = buffer_read(tim_buffer, buffer_u16);
	tim.clut_w = buffer_read(tim_buffer, buffer_u16);
	tim.clut_h = buffer_read(tim_buffer, buffer_u16);
	
	tim.clut_data = [];

	for (var i = 0; i < tim.clut_w * tim.clut_h; i++) {
		var entry = buffer_read(tim_buffer, buffer_u16);
		clut_entry = {
			red : entry & 0b11111,
			green : (entry >> 5) & 0b11111,
			blue : (entry >> 10) & 0b11111,			
			stp : (entry >> 15) & 0b1
		}
		array_push(tim.clut_data, clut_entry);
	}
	
	tim.pixel_size = buffer_read(tim_buffer, buffer_u32);
	tim.pixel_x = buffer_read(tim_buffer, buffer_u16);
	tim.pixel_y = buffer_read(tim_buffer, buffer_u16);
	tim.pixel_w = buffer_read(tim_buffer, buffer_u16);
	tim.pixel_h = buffer_read(tim_buffer, buffer_u16);
	
	tim.pixel_data = [];
	
	//for (var i = 0; i < (tim.pixel_w * 2) * tim.pixel_h; i++) {
		for (var i = 0; i < (tim.pixel_w) * tim.pixel_h; i++) {
			var entry = buffer_read(tim_buffer, buffer_u16);
			first = entry & 0b11111111;
			second = (entry >> 8) & 0b11111111;
			pixel_data = [first, second];
			array_push(tim.pixel_data, pixel_data);
		}
		array_push(tim_buffer_list, tim);
}
for (var a = 0; a < array_length(tim_buffer_list); a++){
	ds_list_insert(tim_list, a, tim_buffer_list[a]);
}
ui_tim = -1;
ui_obj = 0;
ui_prim = 0;
ui_page = 28;