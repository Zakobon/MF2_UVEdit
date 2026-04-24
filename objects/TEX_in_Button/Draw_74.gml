//Draws tim_list as rectangles in the grid area + draw preview of actual TIM file for ui_tim
if (ui_tim_draw_layer == 0){
	if (ui_tim_bit_mode != 0){
		draw_set_alpha(.25);
	}
	else{
		draw_set_alpha(.1);
	}
	if (ui_page == 28){
		offset = .55;
	}
	else{
		offset = 1;
	}
	draw_rectangle(grid_x + 256, grid_y + 0,grid_x + 512, grid_y + 512, 0);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_transformed_colour(grid_x + 376, grid_y + (246 * offset), "4-bit", 1.5, 1.5, 0, c_black, c_black, c_black, c_black, .7);
	draw_text_transformed_colour(grid_x + 120, grid_y + (246 * offset), "4-bit & 8-bit", 1.5, 1.5, 0, c_black, c_black, c_black, c_black, .7);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	if (ui_page == 28){
		draw_set_alpha(1);
		border = 12;
		draw_set_colour($FF363636);
		draw_rectangle(grid_x + 0, grid_y + 258, grid_x + 511, grid_y + 511, 0);
		draw_set_colour($FF363636);
		draw_rectangle(grid_x + (border / 2) + 0, grid_y + (border / 2) + 256, grid_x - (border / 2) + 511, grid_y - (border / 2) + 511, 0);
		draw_set_colour($FF555555);
		draw_rectangle(grid_x + border + 0,grid_y + border + 256, grid_x - border + 511, grid_y - border + 511, 0);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text_transformed_colour(grid_x + 256, grid_y + 406, "Reserved space for opponent", 1.5, 1.5, 0, $FF292929, $FF292929, $FF292929, $FF292929, .7);
		draw_text_transformed_colour(grid_x + 256, grid_y + 366, "Do not put anything down here", 1.5, 1.5, 0, $FF292929, $FF292929, $FF292929, $FF292929, .7);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}


	draw_set_alpha(1);
	//draw_set_colour($FF888888);
	draw_set_colour($FFCCCCCC);

	draw_text(x + 20, y + 5, "Import TEX");

	draw_set_colour($FFFFFFFF);
	//exit;
	if (ds_list_size(tim_list) == 0){
		exit;
	}

	//Draws tim_list entries as rectangles
	for(var i = 0; i < ds_list_size(tim_list); i ++) {
		bit_size = 1;
		if (tim_list[|i].bit < 1 && bit_size < 2){
			bit_size++;
		}
		timx = tim_list[|i].pixel_x;
		timy = tim_list[|i].pixel_y;
		timw = tim_list[|i].pixel_w;
		timh = tim_list[|i].pixel_h;
	
		if (tim_list[|i].clut_data[0].stp == 1){
			draw_set_alpha(.7);
		}
		else{
			draw_set_alpha(1);
		}
		//draw next page
		if (ui_tim_view_next_page != 0){
			if (((timx div 64) + 15) == ui_page){
				tx = grid_x + (timx - ((ui_page-16)*64)) * (4 * bit_size) + 1;
				ty = grid_y + (timy - 256) * 2 + 1;
				draw_set_alpha(.3);
				//draw_set_colour($FF90C183);
				if (bit_size < 2){
					draw_set_colour($FFc4cc9d);
				}
				else{
					draw_set_colour($FF94947A)
				}
		
				draw_rectangle(tx , ty , tx + (timw * (4 * bit_size)) - 1, ty + (timh * 2) - 1, 0);
				//draw_set_colour($FF960019);
				draw_set_colour($FFFFFFFF);
				draw_rectangle(tx , ty , tx + (timw * (4 * bit_size)) - 1, ty + (timh * 2) - 1, 1);
				draw_set_colour($FF000000);
				if (timw >= 3 && timh >= 5){
				draw_text(tx + 1, ty + 1, string(i));
					if (timw >= (16 / bit_size) && timh >= 20){
						draw_text(tx + 1, ty + 20, string(tim_list[|i].clut_y));
						if (bit_size < 2){
							draw_set_colour($FF960019);
						}
						else{
							draw_set_colour($FF6a1b08);
						}
						draw_text(tx + 24, ty + 1, string(tim_bit_mode_string[tim_list[|i].bit]));
					}
				}
	
			}
		}
		//Draw current page
		if (((timx div 64) + 16) == ui_page){
			tx = grid_x + (timx - ((ui_page-16)*64)) * (4 * bit_size) + 1;
			ty = grid_y + (timy - 256) * 2 + 1;
	
			//draw_set_colour($FF90C183);
			if (bit_size < 2){
				draw_set_colour($FFc4cc9d);
			
			}
			else{
			//	draw_set_colour($FF94947A);
				draw_set_colour($FF493939);
			}
		
			draw_rectangle(tx , ty , tx + (timw * (4 * bit_size)) - 1, ty + (timh * 2) - 1, 0);
			//draw_set_colour($FF960019);
			draw_set_colour($FFFFFFFF);
			draw_rectangle(tx , ty , tx + (timw * (4 * bit_size)) - 1, ty + (timh * 2) - 1, 1);
			draw_set_colour($FF000000);
			if (timw >= 3 && timh >= 5){
			draw_text(tx + 1, ty + 1, string(i));
				if (timw >= (16 / bit_size) && timh >= 20){
					draw_text(tx + 1, ty + 20, string(tim_list[|i].clut_y));
					if (bit_size < 2){
						draw_set_colour($FF960019);
					}
					else{
						draw_set_colour($FF6a1b08);
					}
					draw_text(tx + 24, ty + 1, string(tim_bit_mode_string[tim_list[|i].bit]));
				}
			}
	
		}
	
		draw_set_colour($FFCCCCCC);
		draw_set_alpha(1);
	}

	if (ui_tim != -1){
		bit_size = 1;
		if (tim_list[|ui_tim].bit < 1 && bit_size < 2){
			bit_size++;
		}
		timx = tim_list[|ui_tim].pixel_x;
		timy = tim_list[|ui_tim].pixel_y;
		timw = tim_list[|ui_tim].pixel_w;
		timh = tim_list[|ui_tim].pixel_h;

		tx = grid_x + (timx - ((ui_page-16)*64)) * (4 * bit_size) + 1;
		ty = grid_y + (timy - 256) * 2 + 1;
	
	

		if (tim_list[|ui_tim].clut_data[0].stp == 1){
			draw_set_alpha(.7);
		}
		else{
			draw_set_alpha(1);
		}
	
		draw_set_colour($FFD6C58F);
		draw_rectangle(tx , ty,  tx + (timw * (4 * bit_size)) - 1, ty + (timh * 2) - 1, 0);
		draw_set_colour($FF111111);
		draw_rectangle(tx , ty , tx + (timw * (4 * bit_size)) - 1, ty + (timh * 2) - 1, 1);
		draw_set_colour($FF000000);
	
		if (timw >= 3 && timh >= 5){
			draw_text(tx + 1, ty + 1, string(ui_tim));
			if (timw >= (16 / bit_size) && timh >= 20){
				draw_text(tx + 1, ty + 20, string(tim_list[|ui_tim].clut_y));
				if (bit_size < 2){
					draw_set_colour($FF960019);				
				}
				else{
					draw_set_colour($FF6a1b08);
				}
				draw_text(tx + 24, ty + 1, string(tim_bit_mode_string[tim_list[|ui_tim].bit]));
			}
		}
		////draw ghost TIM // Disabled due to frame drop. Need to just run all calculation on import
		//tim_rgb_draw(tx - 1, ty - 1, tim_list[|ui_tim], .7); 
		draw_set_alpha(1);
	}
	draw_set_alpha(1);
	draw_set_colour($FFFFFFFF);
}