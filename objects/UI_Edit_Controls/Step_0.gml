var x_m1_active = variable_instance_get(x_m1, "active");
var x_m10_active = variable_instance_get(x_m10, "active");
var x_m100_active = variable_instance_get(x_m100, "active");
var x_p1_active = variable_instance_get(x_p1, "active");
var x_p10_active = variable_instance_get(x_p10, "active");
var x_p100_active = variable_instance_get(x_p100, "active");

var y_m1_active = variable_instance_get(y_m1, "active");
var y_m10_active = variable_instance_get(y_m10, "active");
var y_m100_active = variable_instance_get(y_m100, "active");
var y_p1_active = variable_instance_get(y_p1, "active");
var y_p10_active = variable_instance_get(y_p10, "active");
var y_p100_active = variable_instance_get(y_p100, "active");

var xs_m1_active = variable_instance_get(xs_m1, "active");
var xs_m10_active = variable_instance_get(xs_m10, "active");
var xs_m100_active = variable_instance_get(xs_m100, "active");
var xs_p1_active = variable_instance_get(xs_p1, "active");
var xs_p10_active = variable_instance_get(xs_p10, "active");
var xs_p100_active = variable_instance_get(xs_p100, "active");

var ys_m1_active = variable_instance_get(ys_m1, "active");
var ys_m10_active = variable_instance_get(ys_m10, "active");
var ys_m100_active = variable_instance_get(ys_m100, "active");
var ys_p1_active = variable_instance_get(ys_p1, "active");
var ys_p10_active = variable_instance_get(ys_p10, "active");
var ys_p100_active = variable_instance_get(ys_p100, "active");

var rotate_right_active = variable_instance_get(rotate_right, "active");
var rotate_left_active = variable_instance_get(rotate_left, "active");

var clut_x_m1_active = variable_instance_get(clut_x_m1, "active");
var clut_x_p1_active = variable_instance_get(clut_x_p1, "active");
var clut_y_m1_active = variable_instance_get(clut_y_m1, "active");
var clut_y_p1_active = variable_instance_get(clut_y_p1, "active");

var xf_toggle_active = variable_instance_get(xf_toggle, "active");
var xf_toggle_status = variable_instance_get(xf_toggle, "status");
var yf_toggle_active = variable_instance_get(yf_toggle, "active");
var yf_toggle_status = variable_instance_get(yf_toggle, "status");

var transparency_toggle_active = variable_instance_get(transparency_toggle, "active");
var transparency_toggle_status = variable_instance_get(transparency_toggle, "status");

var prim_bit_active = variable_instance_get(prim_bit, "active");
var prim_bit_status = variable_instance_get(prim_bit, "status");

//Scale Values for XY Transform
scale_min = 1;
scale_mid = 10;
scale_max = 50;

if (array_length(prim_list) == 0){
	exit;
}
variable_instance_set(xf_toggle, "enable", 1);
variable_instance_set(yf_toggle, "enable", 1);
variable_instance_set(transparency_toggle, "enable", 1);
variable_instance_set(prim_bit, "enable", 1);
//if (mm0_base_buffer != -1){
//	old_primpage = tmd_base.prim[ui_prim].texpxy;
//}

if (x_m1_active == 1){
	x_edit--;
	variable_instance_set(x_m1, "active", 0);
}
if (x_m10_active == 1){
	x_edit = x_edit - 10;
	variable_instance_set(x_m10, "active", 0);
}
if (x_m100_active == 1){
	x_edit = x_edit - 100;
	variable_instance_set(x_m100, "active", 0);
}
if (x_p1_active == 1){
	x_edit++;
	variable_instance_set(x_p1, "active", 0);
}
if (x_p10_active == 1){
	x_edit = x_edit + 10;
	variable_instance_set(x_p10, "active", 0);
}
if (x_p100_active == 1){
	x_edit = x_edit + 100;
	variable_instance_set(x_p100, "active", 0);
}

if (y_m1_active == 1){
	y_edit--;
	variable_instance_set(y_m1, "active", 0);
}
if (y_m10_active == 1){
	y_edit = y_edit - 10;
	variable_instance_set(y_m10, "active", 0);
}
if (y_m100_active == 1){
	y_edit = y_edit - 100;
	variable_instance_set(y_m100, "active", 0);
}
if (y_p1_active == 1){
	y_edit++;
	variable_instance_set(y_p1, "active", 0);
}
if (y_p10_active == 1){
	y_edit = y_edit + 10;
	variable_instance_set(y_p10, "active", 0);
}
if (y_p100_active == 1){
	y_edit = y_edit + 100;
	variable_instance_set(y_p100, "active", 0);
}
if (array_length(prim_select) != 0){
	if (x_edit + x_edit_ui + group_xmax > 256){
		x_edit = 256 - x_edit_ui - group_xmax;
	}
	if (x_edit + x_edit_ui + group_xmin < 0){
		x_edit = 0 - x_edit_ui - group_xmin;
	}
	
	if (y_edit + y_edit_ui + group_ymax > 256){
		y_edit = 256  - y_edit_ui - group_ymax;
	}
	if (y_edit + y_edit_ui + group_ymin < 0){
		y_edit = 0  - y_edit_ui - group_ymin;
	}
	x_edit_ui = x_edit_ui + x_edit;
	x_edit = 0;
	y_edit_ui = y_edit_ui + y_edit;
	y_edit = 0;
}


if (xs_m1_active == 1){
	x_scale_edit = x_scale_edit - scale_min;
	variable_instance_set(xs_m1, "active", 0);
}
if (xs_m10_active == 1){
	x_scale_edit = x_scale_edit - scale_mid;
	variable_instance_set(xs_m10, "active", 0);
}
if (xs_m100_active == 1){
	x_scale_edit = x_scale_edit - scale_max;
	variable_instance_set(xs_m100, "active", 0);
}
if (xs_p1_active == 1){
	x_scale_edit = x_scale_edit + scale_min;
	variable_instance_set(xs_p1, "active", 0);
}
if (xs_p10_active == 1){
	x_scale_edit = x_scale_edit + scale_mid;
	variable_instance_set(xs_p10, "active", 0);
}
if (xs_p100_active == 1){
	x_scale_edit = x_scale_edit + scale_max;
	variable_instance_set(xs_p100, "active", 0);
}

if (ys_m1_active == 1){
	y_scale_edit = y_scale_edit - scale_min;
	variable_instance_set(ys_m1, "active", 0);
}
if (ys_m10_active == 1){
	y_scale_edit = y_scale_edit - scale_mid;
	variable_instance_set(ys_m10, "active", 0);
}
if (ys_m100_active == 1){
	y_scale_edit = y_scale_edit - scale_max;
	variable_instance_set(ys_m100, "active", 0);
}
if (ys_p1_active == 1){
	y_scale_edit = y_scale_edit + scale_min;
	variable_instance_set(ys_p1, "active", 0);
}
if (ys_p10_active == 1){
	y_scale_edit = y_scale_edit + scale_mid;
	variable_instance_set(ys_p10, "active", 0);
}
if (ys_p100_active == 1){
	y_scale_edit = y_scale_edit + scale_max;
	variable_instance_set(ys_p100, "active", 0);
}
//disabled because capping by percent makes no sense, it should be by grid boundaries
//if (x_scale_edit > 100){ 
//	x_scale_edit = 100;
//}
if (x_scale_edit < 1){
	x_scale_edit = 1;
}
//if (y_scale_edit > 100){
//	y_scale_edit = 100;
//}
if (y_scale_edit < 1){
	y_scale_edit = 1;
}

if (rotate_right_active == 1){
	rotate += 5;
	if (rotate > 359){
		rotate = 0;
	}
	variable_instance_set(rotate_right, "active", 0);
}
if (rotate_left_active == 1){
	rotate -= 5;
	if (rotate < -359){
		rotate = 0;
	}
	variable_instance_set(rotate_left, "active", 0);
}
if (prim_bit_mode == 0){
	variable_instance_set(clut_x_m1, "enable", 1);
	variable_instance_set(clut_x_p1, "enable", 1);
	if (clut_x_m1_active == 1){
		switch (clut_x_ui){
			case -1:
			clut_x_ui = 256;
			break;
	
			case 0:
			clut_x_ui = -1;
			break;
	
			default:
			clut_x_ui -= 16;
			break;
		}
		variable_instance_set(clut_x_m1, "active", 0);
	}
	if (clut_x_p1_active == 1){
		switch (clut_x_ui){
			case -1:
			clut_x_ui = 0;
			break;
	
			case 256:
			clut_x_ui = -1;
			break;
	
			default:
			clut_x_ui += 16;
			break;
		}
		variable_instance_set(clut_x_p1, "active", 0);
	}
}
else{
	variable_instance_set(clut_x_m1, "enable", 0);
	variable_instance_set(clut_x_p1, "enable", 0);
}
if (array_length(prim_select) != 0){
	variable_instance_set(clut_y_m1, "enable", 1);	
	variable_instance_set(clut_y_p1, "enable", 1);
	if (clut_y_m1_active == 1){
		switch (clut_y_ui){
			case -1:
			clut_y_ui = 511;
			break;
	
			case 505:
			clut_y_ui = -1;
			break;
	
			default:
			clut_y_ui--;
			break;
		}
		variable_instance_set(clut_y_m1, "active", 0);
	}
	if (clut_y_p1_active == 1){
		switch (clut_y_ui){
			case -1:
			clut_y_ui = 505;
			break;
	
			case 511:
			clut_y_ui = -1;
			break;
	
			default:
			clut_y_ui++;
			break;
		}
		variable_instance_set(clut_y_p1, "active", 0);
	}
}
else{
	variable_instance_set(clut_y_m1, "enable", 0);	
	variable_instance_set(clut_y_p1, "enable", 0);
}
if (xf_toggle_active == 1){
	switch(x_flip){
		case 0:
			x_flip = 1;
			variable_instance_set(xf_toggle, "active", 0);
			break;
		case 1:
			x_flip = 0;
			variable_instance_set(xf_toggle, "active", 0);
			break;
	}
}

if (yf_toggle_active == 1){
	switch(y_flip){
		case 0:
			y_flip = 1;
			variable_instance_set(yf_toggle, "active", 0);
			break;
		case 1:
			y_flip = 0;
			variable_instance_set(yf_toggle, "active", 0);
			break;
	}
}
if (xf_toggle_status == 1 && x_flip == 0){
	variable_instance_set(xf_toggle, "status", 0);
}
if (yf_toggle_status == 1 && y_flip == 0){
	variable_instance_set(yf_toggle, "status", 0);
}

if (transparency_toggle_active == 1){
	switch(ui_prim_transparency){
		case -1:
			ui_prim_transparency = 0;
			variable_instance_set(transparency_toggle, "active", 0);
			break;
		case 0:
			ui_prim_transparency = 1;
			variable_instance_set(transparency_toggle, "active", 0);
			break;
		case 1:
			ui_prim_transparency = -1;
			variable_instance_set(transparency_toggle, "active", 0);
			break;
	}
	variable_instance_set(transparency_toggle, "display", transparency[ui_prim_transparency + 1]);
	variable_instance_set(transparency_toggle, "status", 0);
}
if (prim_bit_active == 1){
	switch(prim_bit_mode){
		case -1:
			prim_bit_mode = 0;
			variable_instance_set(prim_bit, "active", 0);
			break;
		case 0:
			prim_bit_mode = 1;
			variable_instance_set(prim_bit, "active", 0);
			break;
		case 1:
			prim_bit_mode = -1;
			variable_instance_set(prim_bit, "active", 0);
			break;
	}
	variable_instance_set(prim_bit, "display", prim_bit_mode_string[prim_bit_mode + 1]);
	variable_instance_set(prim_bit, "status", 0);
}
if (timer % 2 == 0){
	variable_instance_set(transparency_toggle, "display", transparency[ui_prim_transparency + 1]);
	variable_instance_set(prim_bit, "display", prim_bit_mode_string[prim_bit_mode + 1]);
}
//if (transparency_toggle_status == 1){
//	variable_instance_set(transparency_toggle, "status", 0);
//}