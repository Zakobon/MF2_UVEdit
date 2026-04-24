/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 61EC90C7
/// @DnDArgument : "obj" "GetOBJFile"
/// @DnDSaveInfo : "obj" "GetOBJFile"
var l61EC90C7_0 = false;l61EC90C7_0 = instance_exists(GetOBJFile);if(l61EC90C7_0){	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 3D7AA4CD
	/// @DnDApplyTo : {GetOBJFile}
	/// @DnDParent : 61EC90C7
	with(GetOBJFile) instance_destroy();}

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 0B05419C
/// @DnDArgument : "objectid" "GetOBJFile"
/// @DnDArgument : "layer" ""Vertex_Draw""
/// @DnDSaveInfo : "objectid" "GetOBJFile"
instance_create_layer(0, 0, "Vertex_Draw", GetOBJFile);