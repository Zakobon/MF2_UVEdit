if (instance_exists(GetModel)){
	with(GetModel) instance_destroy();
}

instance_create_layer(0, 0, "Vertex_Draw", GetModel);