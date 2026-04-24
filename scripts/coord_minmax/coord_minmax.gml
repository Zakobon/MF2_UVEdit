//takes the primitive array (_prim_array)
//finds the highest and lowest values for _prim_array.tex_tx and _prim_array.tex_ty
//assigns those values to globalvar "group_{0}{1}", x||y, min||max
function coord_minmax(_prim_array){
	if (array_length(_prim_array) != 0){
		x_coords = [];
		y_coords = [];
		prim_array = _prim_array;
		x_base = 0;
		y_base = 0;
		for (var a = 0; a < array_length(prim_array); a++){
			
			for (var b = 0; b < array_length(prim_array[a].tex_x); b++){
				x_base = prim_array[a].tex_x[b];
				y_base = prim_array[a].tex_y[b];
				r_step_total = 0;
				for (var c = 0; c < array_length(prim_array[a].r_steps); c++){
					r_step = prim_array[a].r_steps[c];
					r_step_total += r_step;
				
					r_stepX = prim_array[a].r_cx[c];
					r_stepY = prim_array[a].r_cy[c];
				
					x_base = (prim_array[a].tex_x[b] - r_stepX) * 2;
					y_base = (prim_array[a].tex_y[b] - r_stepY) * 2;
				
					x_new = ((x_base) * cos(degtorad(r_step_total))) - ((y_base) * sin(degtorad(r_step_total)));
					y_new = ((x_base) * sin(degtorad(r_step_total))) + ((y_base) * cos(degtorad(r_step_total)));
				
					x_base = round((x_new / 2) + r_stepX);
					y_base = round((y_new / 2) + r_stepY);
				

				}
				

				array_push(x_coords, x_base);
				array_push(y_coords, y_base);
			}
			//array_push(x_coords, _prim_array[i].tex_x[0]);
			//array_push(y_coords, _prim_array[i].tex_y[0]);
			//array_push(x_coords, _prim_array[i].tex_x[1]);
			//array_push(y_coords, _prim_array[i].tex_y[1]);
			//array_push(x_coords, _prim_array[i].tex_x[2]);
			//array_push(y_coords, _prim_array[i].tex_y[2]);
			//if (_prim_array[i].cmd & 0b1000 == 8){
			//	array_push(x_coords, _prim_array[i].tex_x[3]);
			//	array_push(y_coords, _prim_array[i].tex_y[3]);
			//}
		}
			array_sort(x_coords, true);
			array_sort(y_coords, true);
			group_xmin = x_coords[0];
			group_xmax = array_last(x_coords);
			group_ymin = y_coords[0];
			group_ymax = array_last(y_coords);
	}
}