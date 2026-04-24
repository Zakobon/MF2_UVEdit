//takes the primitive array (_prim_array) and min_x, min_y, max_x, max_y
//returns array of primitives
function coord_bounds(_prim_array, _x0, _y0, _x1, _y1){
	if (array_length(_prim_array) != 0){
		search_list = [];
		found_list = [];
		prim_xy = [];
		found = 0;
		var test_count = 0;
		for (var a = 0; a < array_length(_prim_array); a++){
			search_list = [];
			
			array_push(prim_xy, (_prim_array[a].tex_x[0] * 2) + grid_x);
			array_push(prim_xy, (_prim_array[a].tex_y[0] * 2) + grid_y);
			array_push(search_list, prim_xy);
			prim_xy = [];
			
			array_push(prim_xy, (_prim_array[a].tex_x[1] * 2) + grid_x);
			array_push(prim_xy, (_prim_array[a].tex_y[1] * 2) + grid_y);
			array_push(search_list, prim_xy);
			prim_xy = [];
			
			array_push(prim_xy, (_prim_array[a].tex_x[2] * 2) + grid_x);
			array_push(prim_xy, (_prim_array[a].tex_y[2] * 2) + grid_y);
			array_push(search_list, prim_xy);
			prim_xy = [];
			if (_prim_array[a].cmd & 0b1000 == 8){
				array_push(prim_xy, (_prim_array[a].tex_x[3] * 2) + grid_x);
				array_push(prim_xy, (_prim_array[a].tex_y[3] * 2) + grid_y);
				array_push(search_list, prim_xy);
				prim_xy = [];
			}
			
			for (var b = 0; b < array_length(search_list); b++){
				found = 1; //move this line to before the for loop for a more exact search
				if (_x0 < _x1){
					if !((search_list[b][0] >= _x0) && (search_list[b][0]  < _x1)){
						found = 0;
					}
				}
				else{
					if !((search_list[b][0]  >= _x1) && (search_list[b][0]  < _x0)){
						found = 0;
					}
				}
				
				if (_y0 < _y1){
					if !((search_list[b][1]  >= _y0) && (search_list[b][1]  < _y1)){
						found = 0;
					}
				}
				else{
					if !((search_list[b][1]  >= _y1) && (search_list[b][1]  < _y0)){
						found = 0;
					}
				}
			}
			if (found == 1){
					if !(array_contains(found_list, _prim_array[a])){
						array_push(found_list, _prim_array[a]);
					}
			}
			
		}
	return found_list;
	}
}