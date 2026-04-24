// error when witing objects with multiple pages
// looks like it's writing the different pages onto the same primitives
// then jumps to the prim[pbase] of the next object, leaving behind chunks of undefined prims 

function write_obj(){
	file_obj_out = variable_clone(tmd_base);
	o_index = -1;
	p_offset = -1;
	for (var a = 0; a < array_length(tmd_base.objects); a++){
		pbase = tmd_base.objects[a].prim_index - tmd_base.objects[a].prim_num;
		//if (o_index == milk.objects[a].obj_index){
		//	pbase += p_offset;
		//}
		
		for (var b = 0; b < tmd_base.objects[a].prim_num; b++){
			cmd = tmd_base.prim[b + pbase].cmd;
			
			switch (tmd_base.prim[b + pbase].page_x){
				case 13:
						file_obj_out.prim[b + pbase] = array_shift(file_obj.objects[a].p29)
						if (CMD & 0b1000 == 8){
							file_obj_out.prim[b + pbase].tex_x[3] = file_obj.objects[a].p29[0].tex_x[2];
							file_obj_out.prim[b + pbase].tex_y[3] = file_obj.objects[a].p29[0].tex_y[2];
							array_delete(file_obj.objects[a].p29, 0, 1);
						}
				break;
				
				case 14:
					//while (0 < array_length(milk.objects[a].p30)){
						file_obj_out.prim[b + pbase] = array_shift(file_obj.objects[a].p30)
						if (CMD & 0b1000 == 8){
							file_obj_out.prim[b + pbase].tex_x[3] = file_obj.objects[a].p30[0].tex_x[2];
							file_obj_out.prim[b + pbase].tex_y[3] = file_obj.objects[a].p30[0].tex_y[2];
							array_delete(file_obj.objects[a].p30, 0, 1);
						}
					//}
				break;
				
				case 15:
					//while (0 < array_length(milk.objects[a].p31)){
						file_obj_out.prim[b + pbase] = array_shift(file_obj.objects[a].p31)
						if (CMD & 0b1000 == 8){
							file_obj_out.prim[b + pbase].tex_x[3] = file_obj.objects[a].p31[0].tex_x[2];
							file_obj_out.prim[b + pbase].tex_y[3] = file_obj.objects[a].p31[0].tex_y[2];
							array_delete(file_obj.objects[a].p31, 0, 1);
						}
					//}
				break;
				default:
					show_message(string(""));
				break;
			} 
			//p_offset = b;
		}
		//o_index = milk.objects[a].obj_index;
	}
	//show_message(string("prim:{0} length:{1}\n{2}",array_length(milk_tmd.prim), 0, milk_tmd.prim[0]));
	
	for(var a = 0; a < array_length(file_obj_out.prim); a++){
		//show_message(string("tmd_base.prim:{0} milk_tmd.prim:{1}\n{2}", array_length(tmd_base.prim), array_length(milk_tmd.prim), milk_tmd.prim[a]));
		file_obj_out.prim[a].p_id = tmd_base.prim[a].p_id;
		
		file_obj_out.prim[a].red = tmd_base.prim[a].red;
		file_obj_out.prim[a].blue = tmd_base.prim[a].blue;
		file_obj_out.prim[a].green = tmd_base.prim[a].green;
		file_obj_out.prim[a].cmd = tmd_base.prim[a].cmd;
		
		file_obj_out.prim[a].texclut = tmd_base.prim[a].texclut;
		
		file_obj_out.prim[a].page_x = tmd_base.prim[a].page_x;
		
		file_obj_out.prim[a].pad = tmd_base.prim[a].pad;
		file_obj_out.prim[a].pad2 = tmd_base.prim[a].pad2;
		
		file_obj_out.prim[a].norm = tmd_base.prim[a].norm;
		file_obj_out.prim[a].vert = tmd_base.prim[a].vert;
	}
	exit;
}
	
	//red = _R; //u8
	//green = _G; //u8
	//blue = _B; //u8
	//cmd = _cmd //u8 0x3c(60) for 4prim
	//tex0tx = _0tx; //u8
	//tex0ty = _0ty; //u8
	//texclut = _clut; //u16 clut_x(u6) + clut_y(u9) +Null(u1)
	//tex1tx = _1tx; //u8
	//tex1ty = _1ty; //u8
	//texpxy = _pxy; //u16 * 64 = texpagex or u4 + 16 = texpage#
	//texpy = _py; //u1 0 = texpagey + 0 or  1 = texpagey + 256
	//tex2tx = _2tx; //u8
	//tex2ty = _2ty; //u8
	//pad = _pad//u16
	//tex3tx = _3tx; //u8
	//tex3ty = _3ty; //u8
	//pad2 = _pad2; //u16
	//norm = [_norm1, _norm2, _norm3]; // 4 x u16
	//vert = [_vert1, _vert2, _vert3]; // 4 x u16
	
	//if (array_length(tmd_edit.objects) != 0){
	//	for (var a = 0; a < array_length(file_obj.objects); a++){
	//		pbase = tmd_base.objects[a].prim_index - tmd_base.objects[a].prim_num;
	//		pcmd = 0;

	//		if(array_length(file_obj.objects[a].p29) != 0){
	//			for (var b = 0; b < array_length(file_obj.objects[a].p30); b++){
	//				prim_index = tmd_edit.objects[a].prim_p29_list[b] + pbase;
	//				prim = tmd_edit.prim[prim_index];
					
	//				switch (pcmd){
	//					case 0:
	//						prim.tex0tx = file_obj.objects[a].p29[b].tex0tx;
	//						prim.tex0ty = file_obj.objects[a].p29[b].tex0ty;
	//						prim.tex1tx = file_obj.objects[a].p29[b].tex1tx;
	//						prim.tex1ty = file_obj.objects[a].p29[b].tex1ty;
	//						prim.tex2tx = file_obj.objects[a].p29[b].tex2tx;
	//						prim.tex2ty = file_obj.objects[a].p29[b].tex2ty;
	//						if (prim.cmd & 0b1000 == 8){
	//							pcmd = 1;
	//						}
	//						break;
	//					case 1:
	//						pcmd = 0;
	//						tmd_edit.prim[prim_index - 1].tex3tx = file_obj.objects[a].p29[b].tex2tx;
	//						tmd_edit.prim[prim_index - 1].tex3ty = file_obj.objects[a].p29[b].tex2ty;
	//						break;
	//				} 
	//				//show_error(string(milk.objects[0].p29[0]), 0);
	//			}
	//		}
	//		if(array_length(file_obj.objects[a].p30) != 0){
	//			for (var b = 0; b < array_length(tmd_edit.objects[a].prim_p30_list) - 1; b++){
	//				prim_index = tmd_edit.objects[a].prim_p30_list[b] + pbase;
	//				prim = tmd_edit.prim[prim_index];
					
					
	//				switch (pcmd){
	//					case 0:
	//						prim.tex0tx = file_obj.objects[a].p30[b].tex0tx;
	//						prim.tex0ty = file_obj.objects[a].p30[b].tex0ty;
	//						prim.tex1tx = file_obj.objects[a].p30[b].tex1tx;
	//						prim.tex1ty = file_obj.objects[a].p30[b].tex1ty;
	//						prim.tex2tx = file_obj.objects[a].p30[b].tex2tx;
	//						prim.tex2ty = file_obj.objects[a].p30[b].tex2ty;
	//						if (prim.cmd & 0b1000 == 8){
	//							pcmd = 1;
	//						}
	//						break;
	//					case 1:
	//						pcmd = 0;
							
							
	//						tmd_edit.prim[prim_index - 1].tex3tx = file_obj.objects[a].p30[b].tex2tx;
	//						tmd_edit.prim[prim_index - 1].tex3ty = file_obj.objects[a].p30[b].tex2ty;
	//						break;
	//				} 
	//			}
	//		}
			
	//		show_message(string(
	//			"prim[prim_index - 1]: {0} len(file_obj.objects.p30): {1}\n{2}",prim_index, 
	//			array_length(file_obj.objects[a].p30), tmd_edit.prim[prim_index - 1])
	//		)
			
	//		if(array_length(file_obj.objects[a].p31) != 0){
	//			for (var b = 0; b < array_length(file_obj.objects[a].p31); b++){
	//				prim_index = tmd_edit.objects[a].prim_p31_list[b] + pbase;
	//				prim = tmd_edit.prim[prim_index];
					
	//				//show_error(string(milk.objects[0].p31[0]), 0);
					
	//				switch (pcmd){
	//					case 0:
	//						prim.tex0tx = file_obj.objects[a].p31[b].tex0tx;
	//						prim.tex0ty = file_obj.objects[a].p31[b].tex0ty;
	//						prim.tex1tx = file_obj.objects[a].p31[b].tex1tx;
	//						prim.tex1ty = file_obj.objects[a].p31[b].tex1ty;
	//						prim.tex2tx = file_obj.objects[a].p31[b].tex2tx;
	//						prim.tex2ty = file_obj.objects[a].p31[b].tex2ty;
	//						if (prim.cmd & 0b1000 == 8){
	//							pcmd = 1;
	//						}
	//						break;
	//					case 1:
	//						pcmd = 0;
	//						tmd_edit.prim[prim_index - 1].tex3tx = file_obj.objects[a].p31[b].tex2tx;
	//						tmd_edit.prim[prim_index - 1].tex3ty = file_obj.objects[a].p31[b].tex2ty;
	//						break;
	//				} 
	//			}
	//		}
	//	}
	//}
//}