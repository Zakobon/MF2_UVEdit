function convert_uv_xy(_value){
	dec = string_digits(_value)
	convert = 256;
	for(var i = 2; i < string_length(_value); i++){
		convert = convert / 10;
	}
	dec = round(dec);
	dec = dec * convert;
	return round(dec);
}