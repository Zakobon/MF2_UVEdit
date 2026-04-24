//if(mm0_base_buffer != -1){
//	draw_set_colour($FFCCCCCC);
//	draw_text(x + 20, y + 5, string("Export MM0"));
//}

//else{
//	draw_set_colour($FF666666);
//	image_index = 0;
//	draw_text(x + 20, y + 5, string("Export MM0"));
//}

//draw_text(x + 40, y + 50, string("Bulk Export Edits \n(_a,_b,_d,_i,_p,_v)"));
//timer--;

//if (timer < 1){
//	if(){}
//	else{}
//	timer = 20;
//}

for (var a = 0; a < 6; a++){
	switch (filename_found[a]){
		case 0:
		draw_set_colour($FF666666);
		break;
		
		case 1:
		draw_set_colour($FFDDCFA0);
		break;
		
		case 2:
		draw_set_colour($FF5fA869);
		break;
	}
	draw_text(x + 50, y + 55 + (40 * a), export_status[filename_found[a]]);
}
draw_set_colour($FFCCCCCC);