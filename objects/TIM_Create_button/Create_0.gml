image_index = 0;
apply = 0;

globalvar tim_backup;
tim_backup = [];


//ARAGON16 PALETTE
//Created by Space-AgeWrangler
//https://lospec.com/palette-list/aragon16
globalvar clut_4_default;
clut_4_default = [
0xf9f8dd,
0xd2e291,
0xa8d455,
0x9cab6c,
0x5c8d58,
0x3b473c,
0x8b8893,
0x54555c,
0xe0bf7a,
0xba9572,
0x876661,
0x272120,
0xb7c4d0,
0x8daad6,
0x9197b6,
0x6b72d4
];
for (var a = 0; a < array_length(clut_4_default); a++){
	bit_16 = clut_4_default[a] / 0xFF;
	clut_4_default[a] = round(bit_16 * 0x1F);
}
globalvar clut_8_default;
clut_8_default = variable_clone(clut_4_default);
bit_8 = 0;
while (array_length(clut_8_default) < 256){
	bit_8 += 255;
	array_push(clut_8_default, bit_8);
}
instance_create_layer(x + 0, y + 35, "TIM_Draw", TIM_Delete_button);
//instance_create_layer(x + 10, y + 70, "TIM_Draw", TIM_Undo_button);