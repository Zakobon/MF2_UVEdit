if (ui_tim == -1){
	ui_tim_transparency = -1;
}
if (ds_list_size(tim_list) == 0){
	exit;
}

var plus_active = variable_instance_get(Plus, "active");
var minus_active = variable_instance_get(Minus, "active");


if (ds_list_size(tim_list) != 0){
	variable_instance_set(transparency_toggle, "enable", 1);
	variable_instance_set(bit_toggle, "enable", 1);
	
	if (plus_active == 1){
		found = 0;
		variable_instance_set(Plus, "active", 0)
		ui_tim++;
		for (var a = 0; a < ds_list_size(tim_list); a++){
			if (a == 0 && ui_tim == ds_list_size(tim_list)){
				ui_tim = -1;
				break;
			}
			if(ui_tim >= ds_list_size(tim_list)){
				ui_tim = 0; //loops to first item in list
			}
			timx = tim_list[|ui_tim].pixel_x;
			if (((timx div 64) + 16) == ui_page){
				found = 1;
				ui_tim_bit_mode = tim_list[|ui_tim].bit;
				variable_instance_set(bit_toggle, "display", tim_bit_mode_string[ui_tim_bit_mode]);
				ui_tim_transparency = tim_list[|ui_tim].clut_data[0].stp;
				variable_instance_set(transparency_toggle, "display", tim_transparency_string[ui_tim_transparency + 1]);
				break;
			}
			ui_tim++;
		}
		
		if (found != 1){
			ui_tim = -1;
			ui_tim_transparency = 0;
			variable_instance_set(transparency_toggle, "display", tim_transparency_string[ui_tim_transparency]);
		}
		if (ui_tim != -1) {
			ui_tim_bit_mode = tim_list[|ui_tim].bit;
			ui_timclutx = tim_list[|ui_tim].clut_x;
			ui_timcluty = tim_list[|ui_tim].clut_y;
			variable_instance_set(bit_toggle, "display", tim_bit_mode_string[ui_tim_bit_mode]);
			ui_tim_transparency = tim_list[|ui_tim].clut_data[0].stp;
			variable_instance_set(transparency_toggle, "display", tim_transparency_string[ui_tim_transparency + 1]);
		}
		
	}
	
	if (minus_active == 1){
		found = 0;
		variable_instance_set(Minus, "active", 0)
		ui_tim--;
		for (var a = 0; a < ds_list_size(tim_list); a++){
			if (a == 0 && ui_tim == -1){
				break;
			}
			if (ui_tim < 0) {
					ui_tim = ds_list_size(tim_list) - 1; //loops to last item in list
			}
			timx = tim_list[|ui_tim].pixel_x;
			
			
			if (((timx div 64) + 16) == ui_page) {
				found = 1;
				ui_tim_bit_mode = tim_list[|ui_tim].bit;
				variable_instance_set(bit_toggle, "display", tim_bit_mode_string[ui_tim_bit_mode]);
				ui_tim_transparency = tim_list[|ui_tim].clut_data[0].stp;
				variable_instance_set(transparency_toggle, "display", tim_transparency_string[ui_tim_transparency + 1]);
				break; //stops search if found
			}
			ui_tim--;
		}
		if (found != 1){
			ui_tim = -1;
			ui_tim_transparency = 0;
			variable_instance_set(transparency_toggle, "display", tim_transparency_string[ui_tim_transparency]);
		}
		if (ui_tim != -1) {
			ui_tim_bit_mode = tim_list[|ui_tim].bit;
			ui_timclutx = tim_list[|ui_tim].clut_x;
			ui_timcluty = tim_list[|ui_tim].clut_y;
			variable_instance_set(bit_toggle, "display", tim_bit_mode_string[ui_tim_bit_mode]);
			ui_tim_transparency = tim_list[|ui_tim].clut_data[0].stp;
			variable_instance_set(transparency_toggle, "display", tim_transparency_string[ui_tim_transparency + 1]);
		}
	}
}
if (ui_tim == -1){
	variable_instance_set(transparency_toggle, "enable", 0);
	variable_instance_set(bit_toggle, "enable", 0);
}
//-----------------------^Temp^-----------------------

if (ui_tim == -1){
	variable_instance_set(x_m1, "active", 0);
	variable_instance_set(x_m10, "active", 0);
	variable_instance_set(x_p1, "active", 0);
	variable_instance_set(x_p10, "active", 0);
	variable_instance_set(y_m1, "active", 0);
	variable_instance_set(y_m10, "active", 0);
	variable_instance_set(y_p1, "active", 0);
	variable_instance_set(y_p10, "active", 0);
	variable_instance_set(w_m1, "active", 0);
	variable_instance_set(w_m10, "active", 0);
	variable_instance_set(w_p1, "active", 0);
	variable_instance_set(w_p10, "active", 0);
	variable_instance_set(h_m1, "active", 0);
	variable_instance_set(h_m10, "active", 0);
	variable_instance_set(h_p1, "active", 0);
	variable_instance_set(h_p10, "active", 0);
	exit;
}

pagex = (ui_page - 16) * 64;
pagey = 256;
//var i_m1_active = variable_instance_get(i_m1, "active");
//var i_m10_active = variable_instance_get(i_m10, "active");
//var i_p1_active = variable_instance_get(i_p1, "active");
//var i_p10_active = variable_instance_get(i_p10, "active");

var x_m1_active = variable_instance_get(x_m1, "active");
var x_m10_active = variable_instance_get(x_m10, "active");
var x_p1_active = variable_instance_get(x_p1, "active");
var x_p10_active = variable_instance_get(x_p10, "active");

var y_m1_active = variable_instance_get(y_m1, "active");
var y_m10_active = variable_instance_get(y_m10, "active");
var y_p1_active = variable_instance_get(y_p1, "active");
var y_p10_active = variable_instance_get(y_p10, "active");

var w_m1_active = variable_instance_get(w_m1, "active");
var w_m10_active = variable_instance_get(w_m10, "active");
var w_p1_active = variable_instance_get(w_p1, "active");
var w_p10_active = variable_instance_get(w_p10, "active");

var h_m1_active = variable_instance_get(h_m1, "active");
var h_m10_active = variable_instance_get(h_m10, "active");
var h_p1_active = variable_instance_get(h_p1, "active");
var h_p10_active = variable_instance_get(h_p10, "active");

var clut_x_m1_active = variable_instance_get(clut_x_m1, "active");
var clut_x_p1_active = variable_instance_get(clut_x_p1, "active");
var clut_y_m1_active = variable_instance_get(clut_y_m1, "active");
var clut_y_p1_active = variable_instance_get(clut_y_p1, "active");

var transparency_toggle_active = variable_instance_get(transparency_toggle, "active");
var transparency_toggle_status = variable_instance_get(transparency_toggle, "status");

var bit_toggle_active = variable_instance_get(bit_toggle, "active");
var bit_toggle_status = variable_instance_get(bit_toggle, "status");

ui_timx = tim_list[|ui_tim].pixel_x - pagex;
ui_timy = tim_list[|ui_tim].pixel_y - pagey;
ui_timw = tim_list[|ui_tim].pixel_w;
ui_timh = tim_list[|ui_tim].pixel_h;
ui_timclutx = tim_list[|ui_tim].clut_x;
ui_timcluty = tim_list[|ui_tim].clut_y;

//if (tim_list[|ui_tim].bit = (0 & 0b0111)){
//	x_cap = 128;
//}
//else{
//	x_cap = 64;
//}
if (timer % 20 == 1){
	if (tim_list[|ui_tim].imported == 1){
		variable_instance_set(w_m1, "enable", 0);
		variable_instance_set(w_m10, "enable", 0);
		variable_instance_set(w_p1, "enable", 0);
		variable_instance_set(w_p10, "enable", 0);
		variable_instance_set(h_m1, "enable", 0);
		variable_instance_set(h_m10, "enable", 0);
		variable_instance_set(h_p1, "enable", 0);
		variable_instance_set(h_p10, "enable", 0);
	}
	else{
		variable_instance_set(w_m1, "enable", 1);
		variable_instance_set(w_m10, "enable", 1);
		variable_instance_set(w_p1, "enable", 1);
		variable_instance_set(w_p10, "enable", 1);
		variable_instance_set(h_m1, "enable", 1);
		variable_instance_set(h_m10, "enable", 1);
		variable_instance_set(h_p1, "enable", 1);
		variable_instance_set(h_p10, "enable", 1);
	}
}
if (x_m1_active == 1){
	ui_timx = ui_timx - 1;
	variable_instance_set(x_m1, "active", 0);
}
if (x_m10_active == 1){
	ui_timx = ui_timx - 8;
	variable_instance_set(x_m10, "active", 0);
}
if (x_p1_active == 1){
	ui_timx = ui_timx + 1;
	variable_instance_set(x_p1, "active", 0);
}
if (x_p10_active == 1){
	ui_timx = ui_timx + 8;
	variable_instance_set(x_p10, "active", 0);
}
if (ui_timx < 0){
	ui_timx = 0;
}
//if (ui_timx + ui_timw > x_cap){
//	ui_timw = x_cap - ui_timx;
//}
switch(ui_tim_bit_mode){
	case 0:
	if (ui_timx + ui_timw > (x_cap / 2)){
		ui_timx = (x_cap / 2) - ui_timw;
	}
	case 1:
	if (ui_timx + ui_timw > x_cap){
		ui_timx = x_cap - ui_timw;
	}
}

if (y_m1_active == 1){
	ui_timy = ui_timy - 1;
	variable_instance_set(y_m1, "active", 0);
}
if (y_m10_active == 1){
	ui_timy = ui_timy - 16;
	variable_instance_set(y_m10, "active", 0);
}
if (y_p1_active == 1){
	ui_timy = ui_timy + 1;
	variable_instance_set(y_p1, "active", 0);
}
if (y_p10_active == 1){
	ui_timy = ui_timy + 16;
	variable_instance_set(y_p10, "active", 0);
}
if (ui_timy < 0){
	ui_timy = 0;
}
//if (ui_timy + ui_timh > 256){
//	ui_timh = 256 - ui_timy;
//}
if (ui_timy + ui_timh > 256){
	ui_timy = 256 - ui_timh;
}
if (w_m1_active == 1){
	ui_timw = ui_timw - 1;
	variable_instance_set(w_m1, "active", 0);
}
if (w_m10_active == 1){
	ui_timw = ui_timw - 8;
	variable_instance_set(w_m10, "active", 0);
}
if (w_p1_active == 1){
	ui_timw = ui_timw + 1;
	variable_instance_set(w_p1, "active", 0);
}
if (w_p10_active == 1){
	ui_timw = ui_timw + 8;
	variable_instance_set(w_p10, "active", 0);
}
if (ui_timw < 1){
	ui_timw = 1;
}
if (ui_timw > x_cap){
	ui_timw = x_cap;
}
if (ui_timx + ui_timw > x_cap){
	ui_timx = x_cap - ui_timw;
}
if (h_m1_active == 1){
	ui_timh = ui_timh - 1;
	variable_instance_set(h_m1, "active", 0);
}
if (h_m10_active == 1){
	ui_timh = ui_timh - 16;
	variable_instance_set(h_m10, "active", 0);
}
if (h_p1_active == 1){
	ui_timh = ui_timh + 1;
	variable_instance_set(h_p1, "active", 0);
}
if (h_p10_active == 1){
	ui_timh = ui_timh + 16;
	variable_instance_set(h_p10, "active", 0);
}
if (ui_timh < 1){
	ui_timh = 1;
}
if (ui_timh > 256){
	ui_timh = 256;
}
if (ui_timy + ui_timh > 256){
	ui_timy = 256 - ui_timh;
}
if (ui_tim_bit_mode == 0){
	variable_instance_set(clut_x_m1, "enable", 1);
	variable_instance_set(clut_x_p1, "enable", 1);
	
	if (clut_x_m1_active == 1){
		ui_timclutx -= 16;
		if(ui_timclutx < 0){
			ui_timclutx = 256;
		}
		variable_instance_set(clut_x_m1, "active", 0);
	}
	if (clut_x_p1_active == 1){
		ui_timclutx += 16;
		if(ui_timclutx > 256){
			ui_timclutx = 0;
		}
		variable_instance_set(clut_x_p1, "active", 0);
	}
}
else{
	variable_instance_set(clut_x_m1, "enable", 0);
	variable_instance_set(clut_x_p1, "enable", 0);
}
if (clut_y_m1_active == 1){
	ui_timcluty--;
	if(ui_timcluty < 505){
		ui_timcluty = 511;
	}
	variable_instance_set(clut_y_m1, "active", 0);
}
if (clut_y_p1_active == 1){
	ui_timcluty++;
	if(ui_timcluty > 511){
		ui_timcluty = 505;
	}
	variable_instance_set(clut_y_p1, "active", 0);
}


if (transparency_toggle_active == 1){
	//switch(ui_tim_transparency){
	//	case -1:
	//		ui_tim_transparency = 0;
	//		variable_instance_set(transparency_toggle, "active", 0);
	//		break;
	//	case 0:
	//		ui_tim_transparency = 1;
	//		variable_instance_set(transparency_toggle, "active", 0);
	//		break;
	//	case 1:
	//		ui_tim_transparency = -1;
	//		variable_instance_set(transparency_toggle, "active", 0);
	//		break;
	//}
	ui_tim_transparency = !ui_tim_transparency;
	variable_instance_set(transparency_toggle, "active", 0);
	variable_instance_set(transparency_toggle, "status", 0);
	variable_instance_set(transparency_toggle, "display", tim_transparency_string[ui_tim_transparency + 1]);
	//if (ui_tim_transparency != -1){
		for (var a = 0; a < array_length(tim_list[|ui_tim].clut_data); a++){
			tim_list[|ui_tim].clut_data[a].stp = ui_tim_transparency;
		}
	//}
}
if (bit_toggle_active == 1){
	switch (tim_list[|ui_tim].bit){
		case 0: //4-bit
		ui_tim_bit_mode = 1;
		x_cap = 128;
		ui_timclutx = 0;
		//if (tim_list[|ui_tim].bit != ui_tim_bit_mode){
		//	ui_timx = (tim_list[|ui_tim].pixel_x - pagex) / 2;
		//	ui_timw = (tim_list[|ui_tim].pixel_w) / 2;
		//}
		break;
		
		case 1: //8-bit
		ui_tim_bit_mode = 0;
		x_cap = 128;
		//if (tim_list[|ui_tim].bit != ui_tim_bit_mode){
		//	ui_timx = (tim_list[|ui_tim].pixel_x - pagex) * 2;
		//	ui_timw = (tim_list[|ui_tim].pixel_w) * 2;
		//}
		break;
		
		case 2: //16-bit
		break;
		
		case 3: //24-bit
		break;
		
		case 4: //mixed
		break;
	}
	//if (tim_list[|ui_tim].bit = 0){
	//	timx = timx * 2;
	//	timw = timw * 2;
	//}
	variable_instance_set(bit_toggle, "display", tim_bit_mode_string[ui_tim_bit_mode]);
	variable_instance_set(bit_toggle, "active", 0);
}
tim_list[|ui_tim].pixel_x = ui_timx + pagex;
tim_list[|ui_tim].pixel_y = ui_timy + pagey;
tim_list[|ui_tim].pixel_w = ui_timw;
tim_list[|ui_tim].pixel_h = ui_timh;
tim_list[|ui_tim].clut_x = ui_timclutx;
tim_list[|ui_tim].clut_y = ui_timcluty;
tim_list[|ui_tim].bit = ui_tim_bit_mode;

timer++;