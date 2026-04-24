//disabled

//exit;

var l61EC90C7_0 = false;
l61EC90C7_0 = instance_exists(ImportTIM);
if(l61EC90C7_0)
{
	with(ImportTIM) instance_destroy();
}

instance_create_layer(x + 0, y + 0, "TIM_Draw", ImportTIM);