//get tmd offset
//get tmd end
//extract section from mm0_base_buffer
//create tmd_out_buffer from section then export buffer as .tmd

function export_tmd(){
	tmd_start = tmd_base.mm0header.pointer[1];
	tmd_end = tmd_base.mm0header.pointer[2];
	tmd_size = tmd_end - tmd_start;
	tmd_out_buffer = buffer_create(tmd_size, buffer_u8, 1);
	buffer_seek(mm0_base_buffer, buffer_seek_start, tmd_start);
	while (buffer_tell(mm0_base_buffer) < tmd_end){
		mm0_read = buffer_read(mm0_base_buffer, buffer_u8);
		buffer_write(tmd_out_buffer, buffer_u8, mm0_read);
	}
	export_path = get_save_filename_ext("PSX TMD|*.tmd", fname_mm0, "","Save PSX TMD File");
	buffer_save(tmd_out_buffer, export_path);
}