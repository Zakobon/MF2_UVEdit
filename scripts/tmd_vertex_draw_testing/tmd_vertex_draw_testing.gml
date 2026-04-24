//draws each primitive in _prim_array[i + _offset]with _fill color and a _line color
//_base_offset is added to _prim_array[i + _offset]'s index
//_prim_array[i + _offset][_base_offset + i].tex

function tmd_vertex_draw_testing(_prim_array, _offset, _count, _fill, _line, _edit = 0, _vertex_color = 0, _template = 0, _transparency = 1, _ignore_page = 0){
	prim_array = [];
	xedit = 0;
	yedit = 0;
	vert_size = 2;
	xsedit = 1;
	ysedit = 1;
	flip_x = 0;
	flip_y = 0;
	prim = [];
	ignore_page = _ignore_page;
	if(is_array(_prim_array)){
		prim_array = _prim_array;
	}
	else{
		prim_array = [_prim_array];
	}
	coord_minmax(_prim_array);
	centerX = ((group_xmax - group_xmin) / 2) + group_xmin;
	centerY = ((group_ymax - group_ymin) / 2) + group_ymin;
	for (var i = 0; i < _count; i++){
		
		
	//	prim_rotate = rotate + prim_array[i + _offset].r_total;
		if (array_length(prim_select) != 0){
			if (_edit == 1){
					xedit = (x_edit_ui * 2);
					yedit = (y_edit_ui * 2);
					xsedit = x_scale_edit / 100;
					ysedit = y_scale_edit / 100;
					flip_x = x_flip;
					flip_y = y_flip;
				}
		}
		if(_template == 1){
			if (array_length(prim_edit_backup) != 0){
				edit_undo = prim_edit_backup[ui_prim_template - 1];
				xedit = edit_undo.edit_x_ui;
				yedit = edit_undo.edit_y_ui;
				xsedit = edit_undo.xscale / 100;
				ysedit = edit_undo.yscale / 100;
				prim_rotate = prim_rotate - edit_undo.group_rotate;
				flip_x = edit_undo.flip_x;
				flip_y = edit_undo.flip_y;
			}
		}
		if (prim_array[i + _offset].cmd & 0b0010 == 2){
			draw_set_alpha(_transparency * .7);
		}
		else{
			draw_set_alpha(_transparency);
		}
		page = prim_array[i + _offset].page_x;
		
		x_list = [];
		y_list = [];
		for (var b = 0; b < array_length(prim_array[i + _offset].tex_x); b++){
			step_check = 0;
			r_step_total = 0;
			for (var c = 0; c < array_length(prim_array[i + _offset].r_steps); c++){
				r_step = prim_array[i + _offset].r_steps[c];
				r_step_total += r_step;
				
				r_stepX = prim_array[i + _offset].r_cx[c];
				r_stepY = prim_array[i + _offset].r_cy[c];
				
				x_base = (prim_array[i + _offset].tex_x[b] - r_stepX) * 2;
				y_base = (prim_array[i + _offset].tex_y[b] - r_stepY) * 2;
				
				x_new = ((x_base) * cos(degtorad(r_step_total))) - ((y_base) * sin(degtorad(r_step_total)));
				y_new = ((x_base) * sin(degtorad(r_step_total))) + ((y_base) * cos(degtorad(r_step_total)));
				
				x_base = round((x_new/2) + r_stepX);
				y_base = round((y_new/2) + r_stepY);
				
				step_check = 1;
			}
			if (step_check == 0){
				x_base = (prim_array[i + _offset].tex_x[b] - centerX) * 2;
				y_base = (prim_array[i + _offset].tex_y[b] - centerY) * 2;
			}
			else{
				x_base = (x_base - centerX) * 2;
				y_base = (y_base - centerY) * 2;
			}
			if(_edit == 1){				
				//rotate commands//	
				x_new = ((x_base) * cos(degtorad(rotate))) - ((y_base) * sin(degtorad(rotate)));
				y_new = ((x_base) * sin(degtorad(rotate))) + ((y_base) * cos(degtorad(rotate)));
				
				x_base = round(x_new);
				y_base = round(y_new);
				
				//flip commands//
				if (x_flip = 1){
					x_base = -x_base;
				}
				if (y_flip = 1){
					y_base = -y_base;
				}
				
				//scale commands//
				x_base = x_base * xsedit;
				y_base = y_base * ysedit;
				
				off = 0;
				//translation commands//
				if (_offset == 0){
					off = prim_array[i].p_id;
				}
				else{
					off = _offset;
				}
				x_base = x_base + xedit + (prim_array[i + _offset].x_diff[b] / 2);
				y_base = y_base + yedit + (prim_array[i + _offset].y_diff[b] / 2);
				
				//cleanup//
				x_base = round(x_base);
				y_base = round(y_base);
			}
			else{
				
				//x_new = ((x_base) * cos(rotate)) - ((y_base) * sin(rotate));
				//y_new = ((x_base) * sin(rotate)) + ((y_base) * cos(rotate));
				
				//x_base = round(x_new);
				//y_base = round(y_new);
			
			}
			array_push(x_list, x_base + (centerX * 2));
			array_push(y_list, y_base + (centerY * 2));
		}
		if (ui_page - 16 == page || ignore_page == 1){
			if ((array_length(prim_select) != 0) && _count != 1){
				draw_set_alpha(_transparency * .5);
			}
			if (ui_page - 16 != page){
				draw_set_alpha(.25);
			}
			if (prim_array[i + _offset].cmd & 0b0001 == 1){
				draw_set_colour($FF494949);
			}
			else if(prim_array[i + _offset].c_mode == 0){
				draw_set_colour($FF392929);
			}
			else{
				draw_set_colour(_fill);
			}
			//draw_set_colour(_fill);
			draw_primitive_begin(pr_trianglelist);
			draw_vertex(384 + x_list[0], 384 + y_list[0]);
			draw_vertex(384 + x_list[1], 384 + y_list[1]);
			draw_vertex(384 + x_list[2], 384 + y_list[2]);
			
			if (prim_array[i + _offset].cmd & 0b1000 == 8){	//fourth vertex check
				draw_vertex(384 + x_list[1], 384 + y_list[1]);
				draw_vertex(384 + x_list[2], 384 + y_list[2]);
				draw_vertex(384 + x_list[3], 384 + y_list[3]);
			}

			draw_primitive_end();

			//draws polygon lines
			if (prim_array[i + _offset].c_mode == 0){
				draw_set_colour(_fill);
			}
			else{
				draw_set_colour(_line);
			}
			draw_primitive_begin(pr_linestrip);
			draw_vertex(384 + (x_list[0] * 1) , 384 + (y_list[0]* 1));
			draw_vertex(384 + (x_list[1] * 1) , 384 + (y_list[1]* 1));
			draw_vertex(384 + (x_list[2] * 1) , 384 + (y_list[2]* 1));
			draw_vertex(384 + (x_list[0] * 1) , 384 + (y_list[0]* 1));
			draw_primitive_end();


			if (prim_array[i + _offset].cmd & 0b1000 == 8){	//fourth vertex check
				draw_primitive_begin(pr_linestrip);
				draw_vertex(384 + (x_list[1] * 1) , 384 + (y_list[1]* 1));
				draw_vertex(384 + (x_list[3] * 1) , 384 + (y_list[3]* 1));
				draw_vertex(384 + (x_list[2] * 1) , 384 + (y_list[2]* 1));
				draw_primitive_end();
			}
			
			//If a vertex color is given, a 3x3 square is drawn over each vertex in that color
			if (_vertex_color != 0){
				for (var a = 0; a < array_length(x_list); a++){
					draw_set_colour(_vertex_color);
					draw_primitive_begin(pr_trianglelist);
					draw_vertex(384 + x_list[a] - vert_size, 384 + y_list[a] - vert_size);
					draw_vertex(384 + x_list[a] + vert_size, 384 + y_list[a] - vert_size);
					draw_vertex(384 + x_list[a] - vert_size, 384 + y_list[a] + vert_size);
					draw_vertex(384 + x_list[a] + vert_size, 384 + y_list[a] - vert_size);
					draw_vertex(384 + x_list[a] - vert_size, 384 + y_list[a] + vert_size);
					draw_vertex(384 + x_list[a] + vert_size, 384 + y_list[a] + vert_size);
					draw_primitive_end();
				}
			}
		}
	}
	draw_set_colour(c_white);
	draw_set_alpha(1);
}