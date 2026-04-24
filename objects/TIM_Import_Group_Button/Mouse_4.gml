filename_input = "";
filename_input = get_open_filename_ext("MRDX TIM Folder|*.tim", "", "","Select First TIM File in Folder");
if (filename_input == ""){
	exit;
}
tim_import(filename_input, 1);