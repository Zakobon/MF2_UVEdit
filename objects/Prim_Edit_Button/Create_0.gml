globalvar prim_select;
prim_select = [];
globalvar prim_edit_backup;
prim_edit_backup = [];
image_index = 0;

p_clear = instance_create_layer(x + 0, y + 40, "UI_Draw", Prim_Reset_Button);