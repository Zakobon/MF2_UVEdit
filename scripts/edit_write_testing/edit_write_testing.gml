function edit_write_testing(){
	centerX = ((group_xmax - group_xmin) / 2) + group_xmin;
	centerY = ((group_ymax - group_ymin) / 2) + group_ymin;
	
	if (array_length(prim_select) != 0){
		primbase = tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num;
		for (var a = 0; a < array_length(prim_select); a++){
			prim_id = prim_select[a].p_id + primbase;
			tmd_edit.prim[prim_id].page_x = ui_page - 16;
			
			xsedit = x_scale_edit / 100;
			ysedit = y_scale_edit / 100;
			if (rotate != 0){
				array_push(tmd_edit.prim[prim_id].r_steps, rotate);
				array_push(tmd_edit.prim[prim_id].r_cx, centerX);
				array_push(tmd_edit.prim[prim_id].r_cy, centerY);
			}
			//xs_total = prim_diff[prim_id].x_scale_total / 100;
			//ys_total = prim_diff[prim_id].y_scale_total / 100;
			//xf_last = prim_diff[prim_id].x_flip_new;
			//yf_last = prim_diff[prim_id].y_flip_new;
			//transparency_last = prim_diff[prim_id].transparency_new;
			//bit_last = prim_diff[prim_id].bit_mode_new;
			
			//r_total = tmd_edit.prim[prim_id].r_total;

			for (var b = 0; b < array_length(tmd_edit.prim[prim_id].tex_x); b++){
				x_diff = tmd_edit.prim[prim_id].x_diff[b];
				y_diff = tmd_edit.prim[prim_id].y_diff[b];
				x_base = (tmd_base.prim[prim_id].tex_x[b] - centerX);
				y_base = (tmd_base.prim[prim_id].tex_y[b] - centerY);
				//x_base = (tmd_edit.prim[prim_id].tex_x[b] - centerX);
				//y_base = (tmd_edit.prim[prim_id].tex_y[b] - centerY);
				
				//flip commands//
				if (x_flip = 1){
					x_base = -x_base;
				}
				if (y_flip = 1){
					y_base = -y_base;
				}
				
				
				
				//translation commands//
				x_base = x_base + (x_edit_ui + x_diff);
				y_base = y_base + (y_edit_ui + y_diff);
				
				
				//rotate commands//
				//x_new = ((x_base) * cos(degtorad(rotate))) - ((y_base) * sin(degtorad(rotate)));
				//y_new = ((x_base) * sin(degtorad(rotate))) + ((y_base) * cos(degtorad(rotate)));
					
				//x_base = x_new;
				//y_base = y_new;
				
				//scale commands//
				x_base = x_base * (xsedit);
				y_base = y_base * (ysedit);
				
				//move from rotation coords back to grid coords//
				x_base = x_base + centerX;
				y_base = y_base + centerY;
				
				//apply edits//
				tmd_edit.prim[prim_id].tex_x[b] = round(x_base);
				tmd_edit.prim[prim_id].tex_y[b] = round(y_base);
				
				tmd_base.prim[prim_id].x_diff[b] = tmd_edit.prim[prim_id].tex_x[b] - tmd_base.prim[prim_id].tex_x[b];
				tmd_base.prim[prim_id].y_diff[b] = tmd_edit.prim[prim_id].tex_y[b] - tmd_base.prim[prim_id].tex_y[b];
				
				if (prim_bit_mode != -1){
					tmd_edit.prim[prim_id].c_mode = prim_bit_mode;
				}
			}

			//clut coord edits//
			tmd_edit.prim[prim_id].clut_x = clut_x_ui; //x is in x16 increments// =0 when 8 bit
			tmd_edit.prim[prim_id].clut_y = clut_y_ui; //between 505-511 always
			
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
