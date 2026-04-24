//draw_point_colour(grid_x, grid_y, c_black);
//draw_point_colour(grid_x + dx, grid_y, c_red);
//draw_point_colour(grid_x, grid_y + dy, c_blue);
//draw_point_colour(grid_x + dx, grid_y + dy, c_green);

//draw_text(grid_x0,grid_y0, "a:" + string(a));
//draw_text(grid_x0,grid_y + 30, "b:" + string(b));
//draw_text(grid_x0,grid_y + 50, "sqr(b):" + string(sqr(a)));
//draw_text(grid_x0,grid_y + 70, "sqr(b):" + string(sqr(b)));
//draw_text(grid_x0,grid_y + 90, "c:" + string(sqr(a) + sqr(b)));
//draw_text(grid_x0,grid_y10, "sqrt(c):" + string(sqrt(sqr(a) + sqr(b))));

//draw_text(grid_x0,grid_y50, "30 / 90:" + string(30 / 90));
//draw_text(grid_x0,grid_y70, "(30 / 90) * sqrt(c) :" + string((30 / 90) * sqrt(sqr(a) + sqr(b))));
//draw_text(grid_x0,grid_y90, "(1-(30 % 90)) * sqrt(c) :" + string((1 - (30 / 90)) * sqrt(sqr(a) + sqr(b))));
//for (var i = 0; i <= 90; i = i){
//	c_square = sqrt(sqr(a) + sqr(b));
//	old = a / c_square;
//	rotation_cos = cos(old + (i / 90));
//	rotation_sin = sin(old + (i / 90));
//	dxr = c_square * rotation_cos;
//	dyr = c_square * rotation_sin;
//	draw_point_colour(grid_x + dxr, grid_y + dyr, c_red);
//}


//rotation += 2;
//draw_point_colour(x, y, c_white);
//draw_point_colour(x + a[0], y + b[0], c_blue);
//draw_point_colour(x + a[1], y + b[1], c_blue);
//draw_point_colour(x + a[2], y + b[2], c_blue);
//for(var i = 0; i < array_length(a); i++){
//	c_square = sqrt(sqr(a[i]) + sqr(b[i]));
//	old = a[i] / c_square;
//	rotation_cos = cos(old + degtorad(rotation));
//	rotation_sin = sin(old + degtorad(rotation));
//	dxr = c_square * rotation_cos;
//	dyr = c_square * -rotation_sin;
//	draw_point_colour(x + dxr, y + dyr, c_red);
//}

//////if (mm0_base_buffer != -1 && ui_prim != -1){
//////	for(var i = 0; i < array_length(prim_select[a].tex_x); i++){
//////		x_base = prim_select[a].tex_x[i];
//////		y_base = prim_select[a].tex_y[i];
//////		c_square = sqrt(sqr(x_base) + sqr(y_base));
//////		oldcos = ((x_base / c_square));
//////		rotation_cos =  cos(oldcos + degtorad(rotation));
//////		rotation_sin =  sin(oldcos + degtorad(rotation));
//////		dxr = c_square * rotation_cos;
//////		dyr = c_square * -rotation_sin;
//////		draw_point_colour(grid_x + 200 + (2 * dxr),grid_y +  150 + (2 * dyr), c_red);
//////	}
//////}

if (mm0_base_buffer != -1 && ui_prim != -1){
	//for (var a = 0; a < array_length(prim_select); a++){
	//	draw_arrayx = [];
	//	draw_arrayy = [];
	//	coord_minmax(prim_select[0]);//
	//	centerX = ((group_xmax - group_xmin) / 2) + group_xmin;//
	//	centerY = ((group_ymax - group_ymin) / 2) + group_ymin;//
	
	//	for(var i = 0; i < array_length(prim_select[a].tex_x); i++){
			
	//		x_base = ((prim_select[a].tex_x[i] - centerX) * 2);
	//		y_base = ((prim_select[a].tex_y[i] - centerY) * 2);
			
	//		dxr = (x_base * cos(degtorad(rotation))) - (y_base * sin(degtorad(rotation)));
	//		dyr = (x_base * sin(degtorad(rotation))) + (y_base * cos(degtorad(rotation)));

	//		array_push(draw_arrayx, dxr + (centerX * 2));
	//		array_push(draw_arrayy, dyr + (centerY * 2));

		
	//	}
	//  draw_set_alpha(.5);
	//	draw_primitive_begin(pr_trianglelist);
	//	draw_vertex(grid_x + draw_arrayx[0], grid_y + draw_arrayy[0]);
	//	draw_vertex(grid_x + draw_arrayx[1], grid_y + draw_arrayy[1]);
	//	draw_vertex(grid_x + draw_arrayx[2], grid_y + draw_arrayy[2]);
	//	if (array_length(draw_arrayx) > 3){
	//		draw_vertex(grid_x + draw_arrayx[1], grid_y + draw_arrayy[1]);
	//		draw_vertex(grid_x + draw_arrayx[2], grid_y + draw_arrayy[2]);
	//		draw_vertex(grid_x + draw_arrayx[3], grid_y + draw_arrayy[3]);
	//	}
	//	draw_primitive_end();
	//	draw_set_alpha(1);

	//}
}

//rotation += 10;