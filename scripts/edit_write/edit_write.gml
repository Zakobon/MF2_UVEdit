function edit_write(){
	centerX = ((group_xmax - group_xmin) / 2) + group_xmin;
	centerY = ((group_ymax - group_ymin) / 2) + group_ymin;
	
	if (array_length(prim_select) != 0){
		primbase = tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num;
		for (var a = 0; a < array_length(prim_select); a++){
			prim_id = prim_select[a].p_id + primbase;
			tmd_edit.prim[prim_id].page_x = ui_page - 16;
			
			xsedit = x_scale_edit / 100;
			ysedit = y_scale_edit / 100;

			for (var b = 0; b < array_length(tmd_edit.prim[prim_id].tex_x); b++){
				x_base = (tmd_edit.prim[prim_id].tex_x[b] - centerX);
				y_base = (tmd_edit.prim[prim_id].tex_y[b] - centerY);
				
				//flip commands//
				if (x_flip = 1){
					x_base = -x_base;
				}
				if (y_flip = 1){
					y_base = -y_base;
				}
				
				
				//translation commands//
				x_base = x_base + x_edit_ui;
				y_base = y_base + y_edit_ui;
				
				
				//rotate commands//
				x_new = ((x_base) * cos(degtorad(rotate))) - ((y_base) * sin(degtorad(rotate)));
				y_new = ((x_base) * sin(degtorad(rotate))) + ((y_base) * cos(degtorad(rotate)));
					
				x_base = x_new;
				y_base = y_new;
				
				//scale commands//
				x_base = x_base * xsedit;
				y_base = y_base * ysedit;
				
				//move from rotation coords back to grid coords//
				x_base = x_base + centerX;
				y_base = y_base + centerY;
				
				//apply edits//
				tmd_edit.prim[prim_id].tex_x[b] = round(x_base);
				tmd_edit.prim[prim_id].tex_y[b] = round(y_base);

				
				if (prim_bit_mode != -1){
					tmd_edit.prim[prim_id].c_mode = prim_bit_mode;
				}
			}

			//clut coord edits//
			if (clut_x_ui != -1){
				tmd_edit.prim[prim_id].clut_x = clut_x_ui; //x is in x16 increments// =0 when 8 bit
			}
			//else{ //disabled due to accidently undoing changes when reselecting prims
			//	tmd_edit.prim[prim_id].clut_x = tmd_base.prim[prim_id].clut_x
			//}
			if (clut_y_ui != -1){
				tmd_edit.prim[prim_id].clut_y = clut_y_ui; //between 505-511 always
			}
			//else{
			//	tmd_edit.prim[prim_id].clut_y = tmd_base.prim[prim_id].clut_y
			//}
			
			//GPU command edits//
			switch (ui_prim_transparency){
				case 0:
				tmd_edit.prim[prim_id].cmd = tmd_edit.prim[prim_id].cmd & ~(0b1 << 1);
				break;
				case 1:
				tmd_edit.prim[prim_id].cmd = tmd_edit.prim[prim_id].cmd | (0b1 << 1);
				break;
				default:
				break;
			}
		}
		
		
	}
}
