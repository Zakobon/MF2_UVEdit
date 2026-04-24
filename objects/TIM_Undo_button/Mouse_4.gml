if (array_length(tim_backup) != 0){
	tim = array_pop(tim_backup);
	timx = tim.pixel_x;
	timy = tim.pixel_y;
	timw = tim.pixel_w;
	timh = tim.pixel_h;
	tim_create(timx, timy, timw, timh, 1);
}

