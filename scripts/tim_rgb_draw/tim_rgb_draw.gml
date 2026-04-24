function tim_rgb_draw(_x = 0, _y = 0, _tim, _alpha = 1){
	dclut = [];

	//tim_px = _tim.pixel_x - ((ui_page - 16) * 64);
	//tim_py = _tim.pixel_y - 256;
	tim_px = 0;
	tim_py = 0;
	tim_pw = _tim.pixel_w;
	tim_ph = _tim.pixel_h;
	tim_bit =  (_tim.bit * 2) * 2;
		
	for (var b = 0; b < array_length(_tim.clut_data); b++){
			
		cred = _tim.clut_data[b].red;
		cgreen = _tim.clut_data[b].green;
		cblue = _tim.clut_data[b].blue;
		cstp = _tim.clut_data[b].stp;
		if (cred + cgreen + cblue + cstp == 0){
			dstp = 0;
		}
		else{
			dstp = 1;
		}
		dred = cred * 8;
		dgreen = cgreen * 8;
		dblue = cblue * 8;
		if (dred > 200){
			j = 0;
			
		}
		dcolor = make_colour_rgb(dred, dgreen, dblue);
			
		dclut[b] = dcolor;
		dtflag[b] = dstp;
	}
	
	
	width = 0;
	height = 0;
	//for (var h = 0; h < tim_ph; h++){
	repeat (4){ //width multiplier
		w = 0;
		repeat (2){ //height multiplier
			h = 0;
			for (var b = 0; b < tim_pw * tim_ph; b++){
				pixel = _tim.pixel_data[b];
			
					if (w % 2){
						if (dtflag[pixel[0]] == 0){
							draw_set_alpha(_alpha * .1);
							draw_point_colour(_x + tim_px + (w * tim_bit) + width, _y + tim_py + (h * 2) + height, c_black)
							draw_set_alpha(_alpha);
						}
						else{
							draw_point_colour(_x + tim_px + (w * tim_bit) + width, _y + tim_py + (h * 2) + height, dclut[pixel[0]]);
						}
					}
					else{
						if (dtflag[pixel[1]] == 0){
							draw_set_alpha(_alpha * .1);
							draw_point_colour(_x + tim_px + (w * tim_bit) + width, _y + tim_py + (h * 2) + height, c_black)
							draw_set_alpha(_alpha);
						}
						else{
							draw_point_colour(_x + tim_px + (w * tim_bit) + width, _y + tim_py + (h * 2) + height, dclut[pixel[1]]);
						}
					}
					w++;
					if !(w % (tim_pw)){
						h++;
						w = 0;
					}
			}
			height++;
		}
		height = 0;
		width++;
	}
}