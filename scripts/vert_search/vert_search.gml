
// _prim_array: primitive list to add to
// _vert_array: vert collection of each item inside _prim_array
// _prim: primitive being checked
// returns array_push(_array, _prim) if true
function vert_search(_prim_array, _vert_array, _prim){
	if (_prim_array[0].page_x == _prim.page_x){
		pxy = [
		_prim.tex_x[0] + (_prim.tex_y[0]* 1000),
		_prim.tex_x[1] + (_prim.tex_y[1]* 1000),
		_prim.tex_x[2] + (_prim.tex_y[2]* 1000)
		]
		
		if (_prim.cmd & 0b1000 == 8){
			array_push(pxy, _prim.tex_x[3] + (_prim.tex_y[3]* 1000));
		}
		
		for (var a = 0; a < array_length(pxy); a++){
			if (array_contains(_vert_array, pxy[a])){
				for (var b = 0; b < array_length(pxy); b++){
					if (!array_contains(_vert_array,pxy[b])){
						array_push(_vert_array, pxy[b]);
					}
				}
				return true;
			}
		}
	}
}