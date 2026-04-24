globalvar tim_list;
tim_list = ds_list_create();

globalvar tim_list_next; //tim_list of the next page
tim_list_next = ds_list_create();


image_index = 0;
instance_create_layer(x + 144, y, "TIM_Draw", TEX_out_Button);

instance_create_layer(x + 0, y + 45, "TIM_Draw", TIM_Import_Button);
exit;
instance_create_layer(x + 425, y, "TIM_Draw", TIM_Import_Group_Button);


