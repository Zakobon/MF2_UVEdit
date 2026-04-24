//function Primitive(_pad = 0, _t_disable = 0, _c_mode = 0, _t_mode = 0, _page_y = 256, _page_x = 0, _clut_y = 0, _clut_x = 0, _cmd = 0, _p_id = 0) constructor{
	//p_id = _p_id;
	//cmd = _cmd //u8
	////0bxx xx xx x1 = Texture Mode      (0=Blended 1=Raw)                (Textured-Polygon/Rectangle only)
	////0bxx xx xx 1x = Semi Transparency (0=Opaque 1=Semi-Transparent)    (All Render Types)
	////0bxx xx x1 xx = Texture Mapping   (0=Off 1=On)                     (Polygon/Rectangle only)
	
	////0bxx x1 1x xx = Rectangle Size    (0=Var 1=1x1 2=8x8 3=16x16)      (Rectangle only)
	////0bxx xx 1x xx = Num Vertices      (0=Triple 1=Quad)                (Polygon only)
	////0bxx xx 1x xx = Num Lines         (0=Single 1=Poly)                (Line only)
	
	////0bxx x1 xx xx = Shading           (0=Flat 1=Gouroud)               (Polygon/Line only)
	////0bx1 1x xx xx = Primitive Type    (1=Polygon 2=Line 3=Rectangle)
	//tex_x = [];
	//tex_y = [];
	//clut_x = _clut_x;
	//clut_y = _clut_y;
	
	//page_x = _page_x;       //0bxxxx xxxx xxxx 1111// page_x + (16 * page_y) = page number or page_x * 64 = page x
	//page_y = _page_y;       //0bxxxx xxxx xxx1 xxxx// page_y base = page_y * 256;
	//t_mode = _t_mode;       //0bxxxx xxxx x11x xxxx// transparency mode
	//c_mode = _c_mode;       //0bxxxx xxx1 1xxx xxxx// bit depth
	//t_disable = _t_disable; //0bxxxx 1xxx xxxx xxxx// Texture Disable
	
	////1 - 4 u8 -> [00 Bb Gg Rrh] same deal as GPU command + color (u32), except cmd bytes are 00
	//colors = []; //Vertex_Color(_blue,_green,_red)
	//norm = []; // 3 or 4 x u16
	//vert = []; //Vertex(_pad,_vz,_vy,_vz)
//}
function apply_edit(_MM0_buffer){
	buffer_seek(_MM0_buffer, buffer_seek_start, 8);
	tmd_off = buffer_read(_MM0_buffer, buffer_u8) + 12;

	primbase = tmd_off + tmd_edit.objects[0].prim_off;
	buffer_seek(_MM0_buffer, buffer_seek_start, primbase);
	
	for (var a = 0; a < array_length(tmd_edit.prim); a++) {
		var CMD = tmd_edit.prim[a].cmd;
		
		//==Decoding primitive's GPU command==
		gpu_cmd = 0;
		p_type = (CMD >> 5) & 0b11; //Primitive Type 3 is ignored for our purposes (1=Polygon, 2=Line, 3=Rectangle)
		p_shading = (CMD >> 4) & 0b1; //Polygon/Line only (0=Flat, 1=Gouroud) 
		p_line_num = (CMD >> 3) & 0b1; //Line only (0=Single, 1=Poly) 
		p_poly_vert = (CMD >> 3) & 0b1; //Polygon only (0=Triple, 1=Quad)
		p_rect_size = (CMD >> 3) & 0b11; //Rectangle only (0=Var, 1=1x1, 2=8x8, 3=16x16)
		p_tex_mapping = (CMD >> 2) & 0b1; //Polygon/Rectangle (0=Off, 1=On) 
		p_transparency = (CMD >> 1) & 0b1; //All Render Types (0=Off, 1=On)
		p_tex_mode = CMD & 0b1; //Textured-Polygon/Rectangle only (0=Blended, 1=Raw) 
		
		if (p_type == 1){ //Polygon//
			buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].colors[0].r);
			buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].colors[0].g);
			buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].colors[0].b);
			buffer_write(_MM0_buffer, buffer_u8, CMD);
			
			buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].tex_x[0]);
			buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].tex_y[0]);
			clut_xy = tmd_edit.prim[a].clut_x & 0b1_11111;
			clut_xy = clut_xy | ((tmd_edit.prim[a].clut_y & 0b1_1111_1111) << 6);
			buffer_write(_MM0_buffer, buffer_u16, clut_xy);
		
			buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].tex_x[1]);
			buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].tex_y[1]);
			page_xy = tmd_edit.prim[a].page_x & 0b1111;
			page_xy = page_xy | ((tmd_edit.prim[a].page_y & 0b1) << 4);
			page_xy = page_xy | ((tmd_edit.prim[a].t_mode & 0b11) << 5);
			page_xy = page_xy | ((tmd_edit.prim[a].c_mode & 0b11) << 7);
			page_xy = page_xy | ((tmd_edit.prim[a].t_disable & 0b1) << 11);
			buffer_write(_MM0_buffer, buffer_u16, page_xy);
		
			buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].tex_x[2]);
			buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].tex_y[2]);
			if (p_tex_mode == 1){ //raw// Phoenix's unique prims
				buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[a].n_off); //not normal offset
				
				for (var b = 0; b < 3; b++){
					buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].colors[b].r); //padding
					buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].colors[b].g); //blue
					buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].colors[b].b); //green
					buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].colors[b].pad); //red
				}
				for (var b = 0; b < 3; b++){
					buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[a].vert[b])
				}
				buffer_write(_MM0_buffer, buffer_u16, 0) //32-bit padding
			} 
			else{ //blended//
				buffer_write(_MM0_buffer, buffer_u16, 0); //32-bit padding after tex_y[2]
				
				if (p_poly_vert == 1){ //quad//
					buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].tex_x[3]);
					buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[a].tex_y[3]);
					buffer_write(_MM0_buffer, buffer_u16, 0); //32-bit padding

				}
				for (var b = 0; b < array_length(tmd_edit.prim[a].vert); b++){
					buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[a].norm[b]);
					buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[a].vert[b]);
				}
			}
		}
	}
	
	//vert and normal edits, when they're implemented
	//rest of animation file(tmd_edit.final)
	
	//==todo==
	//stop writing over _MM0_buffer and grow a new one to allow changing tmd size on export
}
	
	//==old tmd format==
	//for (var i = 0; i < array_length(tmd_edit.prim); i++) {
	//	var CMD = tmd_edit.prim[i].cmd;
		
	//	//buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[i].colors[0].r);
	//	//buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[i].colors[0].g);
	//	//buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[i].colors[0].b);
	//	//buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[i].cmd);
			
	//	buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[i].tex_x[0]);
	//	buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[i].tex_y[0]);
	//	buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[i].texclut);
		
	//	buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[i].tex_x[1]);
	//	buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[i].tex_y[1]);
	//	buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[i].page_x + 144); // ex: 144 + 14 = 158 or 0x9e 
			
	//	buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[i].tex_x[2]);
	//	buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[i].tex_y[2]);
	//	buffer_write(_MM0_buffer, buffer_u16, 0);
			
	//	if (CMD & 0b1000 == 8){
	//		buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[i].tex_x[3]);
	//		buffer_write(_MM0_buffer, buffer_u8, tmd_edit.prim[i].tex_y[3]);
	//		buffer_write(_MM0_buffer, buffer_u16, 0);
	//	}
			
	//	buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[i].norm[0]);
	//	buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[i].vert[0]);
			
	//	buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[i].norm[1]);
	//	buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[i].vert[1]);
			
	//	buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[i].norm[2]);
	//	buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[i].vert[2]);
			
	//	if (CMD & 0b1000 == 8){
	//		buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[i].norm[3]);
	//		buffer_write(_MM0_buffer, buffer_u16, tmd_edit.prim[i].vert[3]);
	//	}
	//}