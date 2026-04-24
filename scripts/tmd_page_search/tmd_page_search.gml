//searches _tmd for prims that share a page number with tim_page
function tmd_page_search(_tmd){
	found_list = [];
	primbase = _tmd.objects[ui_obj].prim_index - _tmd.objects[ui_obj].prim_num;
	for (var a = 0; a < _tmd.objects[ui_obj].prim_num; a++){
		if (_tmd.prim[primbase + a].page_x == ui_page - 16){
			array_push(found_list, _tmd.prim[primbase + a]);
		}
	}
	return found_list;
}