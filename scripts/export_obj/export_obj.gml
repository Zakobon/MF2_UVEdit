//https://en.wikipedia.org/wiki/Wavefront_.obj_file
 
 
//# List of geometric vertices, with (x, y, z, [w]) coordinates, w is optional and defaults to 1.0.
//v 0.123 0.234 0.345 1.0
//v ...
//...
//# List of texture coordinates, in (u, [v, w]) coordinates, these will vary between 0 and 1. v, w are optional and default to 0.
//vt 0.500 1 [0]
//vt ...
//...
//# List of vertex normals in (x,y,z) form; normals might not be unit vectors.
//vn 0.707 0.000 0.707
//vn ...
//...
//# Parameter space vertices in (u, [v, w]) form; free form geometry statement (see below)
//vp 0.310000 3.210000 2.100000
//vp ...
//...
//# Polygonal face element (see below)
//f 1 2 3
//f 3/1 4/2 5/3
//f 6/4/1 3/5/3 7/6/5
//f 7//1 8//2 9//3
//f ...
//...
//# Line element (see below)
//l 5 8 1 2 4 9


//----------    Geometric vertex

//A vertex is specified via a line starting with the letter v. 
//That is followed by (x,y,z[,w]) coordinates. 
//W is optional and defaults to 1.0. W scales the point. 
//The point (x,y,z,w) corresponds to the point (x/w,y/w,z/w). 
//A right-hand coordinate system is used to specify the coordinate locations. 
//Some applications support vertex colors, by putting red, green and blue values 
//after x y and z (this precludes specifying w). The color values range from 0 to 1.[2] 


//----------    Parameter space vertices

//A free-form geometry statement can be specified in a line starting with the string vp. 
//Define points in parameter space of a curve or surface. u only is required for curve points, 
//u and v for surface points and control points of non-rational trimming curves, and u, v and w (weight) 
//for control points of rational trimming curves. 


//----------    Face elements

//Faces are defined using lists of vertex, texture and normal indices in the 
//format vertex_index/texture_index/normal_index for which each index starts 
//at 1 and increases corresponding to the order in which the referenced element was defined. 
//Polygons such as quadrilaterals can be defined by using more than three indices.

//OBJ files also support free-form geometry which use curves and surfaces to define objects, 
//such as NURBS surfaces. 


//----------    Vertex indices

//A valid vertex index matches the corresponding vertex elements of a previously defined vertex list. 
//If an index is positive then it refers to the offset in that vertex list, starting at 1. If an index is 
//negative then it relatively refers to the end of the vertex list, -1 referring to the last element.

//each face can contain three or more vertices. 

//[f v1 v2 v3 ...]


//----------    Vertex texture coordinate indices

//Optionally, texture coordinate indices can be used to specify texture coordinates when defining a face. 
//To add a texture coordinate index to a vertex index when defining a face, one must put a slash immediately 
//after the vertex index and then put the texture coordinate index. No spaces are permitted before or after 
//the slash. A valid texture coordinate index starts from 1 and matches the corresponding element in the 
//previously defined list of texture coordinates. each face can contain three or more elements. 

//[f v1/vt1 v2/vt2 v3/vt3 ...]


//----------    Vertex normal indices

//Optionally, normal indices can be used to specify normal vectors for vertices when defining a face. 
//To add a normal index to a vertex index when defining a face, one must put a second slash after the texture 
//coordinate index and then put the normal index. A valid normal index starts from 1 and matches the 
//corresponding element in the previously defined list of normals. each face can contain three or 
//more elements. 

//[f v1/vt1/vn1 v2/vt2/vn2 v3/vt3/vn3 ...]


//----------    Vertex normal indices without texture coordinate indices

//As texture coordinates are optional, one can define geometry without them, but one must put two slashes 
//after the vertex index before putting the normal index. 

//[f v1//vn1 v2//vn2 v3//vn3 ...]


//----------    Line elements

//Records starting with the letter "l" (lowercase L) specify the order of the vertices which build a polyline. 

//[l v1 v2 v3 v4 v5 v6 ...]

//----------    Other geometry formats    ----------//

//----------    Reference materials

//Materials that describe the visual aspects of the polygons are stored in external .mtl files. 
//More than one external MTL material file may be referenced from within the OBJ file. 
//The .mtl file may contain one or more named material definitions. 

//|mtllib [external .mtl file name]|
//|...                             |


//This tag specifies the material name for the element following it. 
//The material name matches a named material definition in an external .mtl file.

//|usemtl [material name]          |
//|...                             |


//Named objects and polygon groups are specified via the following tags.
//objects start with the letter "o" and groups start with the letter "g"

//|o [object name]                 |
//|  ...                           |
//|  g [group name]                |
//|  ...                           |


//Smooth shading across polygons is enabled by smoothing groups.

//|s 1                                        |
//|  ...                                      |
//|  # Smooth shading can be disabled as well.|
//|  s off                                    |
//|  ...                                      |


//----------    Relative and absolute indices

//OBJ files, due to their list structure, are able to reference vertices, normals, etc. 
//either by their absolute position (1 represents the first defined vertex, N representing 
//the Nth defined vertex), or by their relative position (-1 represents the latest defined vertex). 
//However, not all software supports the latter approach, and conversely some software 
//inherently writes only the latter form (due to the convenience of appending elements 
//without needing to recalculate vertex offsets, etc.), leading to occasional incompatibilities.

//===================== to-do =====================//
// find out which of the x y z values the PSX flips - PSX flips the Y value
//
// obj file doesn't keep vertex order when exported from other programs
// need to find alternative file format
//
// ================================================//

function export_obj(_tmd_source){
	objbuffer = buffer_create(0, buffer_grow, 1);
	mtllib_string = string_insert(fname_mm0, ".mtl", -1);
	mtllib = [mtllib_string];
	obj_string_array = [];
	//title
	array_push(obj_string_array, "# Wavefront OBJ exported by TMD Converter" + "\n");
	//empty line
	array_push(obj_string_array, "\n");
	//mtllib list
	if (array_length(mtllib) > 0){
		for (var a = 0; a < array_length(mtllib); a++){
			array_push(obj_string_array, string("mtllib {0}", mtllib[a]) + "\n");
		}
	}
	//empty line
	array_push(obj_string_array, "\n");
	//vertex section
	if(array_length(tmd_edit.vert) > 0){
		for (var a = 0; a < array_length(tmd_edit.vert); a++){
			array_push(obj_string_array, string("v {0}.000000 {1}.000000 {2}.000000", tmd_edit.vert[a].vx, ~tmd_edit.vert[a].vy + 1, tmd_edit.vert[a].vz) + "\n");
		}
	}
	//default for no verts
	else {array_push(obj_string_array, string("v 0.000000 0.000000 0.000000") + "\n");}
	//comment with vert count
	array_push(obj_string_array, string("# {0} vertices", array_length(tmd_edit.vert)) + "\n");
	//empty line
	array_push(obj_string_array, "\n");
	//vertex texture page coords
	//need to keep in mind the prim duplication when doing the primitive section
	vt_count = 0;
	quad_count = 0;
	if(array_length(tmd_edit.prim) > 0){
		
		//for (var a = 0; a < array_length(tmd_edit.prim); a++){
			
		//	array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[a].tex0tx), convert_xy_uv(tmd_edit.prim[a].tex0ty)) + "\n");
		//	vt_count++;
		//	array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[a].tex1tx), convert_xy_uv(tmd_edit.prim[a].tex1ty)) + "\n");
		//	vt_count++;
		//	array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[a].tex2tx), convert_xy_uv(tmd_edit.prim[a].tex2ty)) + "\n");
		//	vt_count++;
		//	if(tmd_edit.prim[a].cmd & 0b1000 == 8){
		//		array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[a].tex3tx), convert_xy_uv(tmd_edit.prim[a].tex3ty)) + "\n");
		//		vt_count++;
		//		quad_count++;
		//	}
			
		//	//array_push(obj_string_array, string("vt {0} {1}", tmd_edit.prim[a].tex0tx, tmd_edit.prim[a].tex0ty) + "\n");
		//	//vt_count++;
		//	//array_push(obj_string_array, string("vt {0} {1}", tmd_edit.prim[a].tex1tx, tmd_edit.prim[a].tex1ty) + "\n");
		//	//vt_count++;
		//	//array_push(obj_string_array, string("vt {0} {1}", tmd_edit.prim[a].tex2tx, tmd_edit.prim[a].tex2ty) + "\n");
		//	//vt_count++;
		//	//if(tmd_edit.prim[a].cmd & 0b1000 == 8){
		//	//	array_push(obj_string_array, string("vt 0.{0} 0.{1}", tmd_edit.prim[a].tex3tx, tmd_edit.prim[a].tex3ty) + "\n");
		//	//	vt_count++;
		//	//	quad_count++;
		//	//}
		//}
		for(var a = 0; a < tmd_edit.obj_num; a++){
			f29 = [];
			f30 = [];
			f31 = [];
			for (var b = 0; b < tmd_edit.objects[a].prim_num; b++){
				current_prim = b + tmd_edit.objects[a].prim_index - tmd_edit.objects[a].prim_num;
				switch (tmd_edit.prim[b + tmd_edit.objects[a].prim_index - tmd_edit.objects[a].prim_num].page_x){
					case 13:
					array_push(f29, current_prim);
					break;
					case 14:
					array_push(f30, current_prim);
					break;
					case 15:
					array_push(f31, current_prim);
					break;
				}
			}
		
			if (array_length(f29) != 0){
				for(var b = 0; b < array_length(f29); b++){
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f29[b]].tex_x[0]), convert_xy_uv(tmd_edit.prim[f29[b]].tex_y[0], 1)) + "\n");
					vt_count++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f29[b]].tex_x[1]), convert_xy_uv(tmd_edit.prim[f29[b]].tex_y[1], 1)) + "\n");
					vt_count++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f29[b]].tex_x[2]), convert_xy_uv(tmd_edit.prim[f29[b]].tex_y[2], 1)) + "\n");
					vt_count++;
					if(tmd_edit.prim[f29[b]].cmd & 0b1000 == 8){
						array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f29[b]].tex_x[3]), convert_xy_uv(tmd_edit.prim[f29[b]].tex_y[3], 1)) + "\n");
						vt_count++;
					}
				}
			}
			if (array_length(f30) != 0){
				for(var b = 0; b < array_length(f30); b++){
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f30[b]].tex_x[0]), convert_xy_uv(tmd_edit.prim[f30[b]].tex_y[0], 1)) + "\n");
					vt_count++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f30[b]].tex_x[1]), convert_xy_uv(tmd_edit.prim[f30[b]].tex_y[1], 1)) + "\n");
					vt_count++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f30[b]].tex_x[2]), convert_xy_uv(tmd_edit.prim[f30[b]].tex_y[2], 1)) + "\n");
					vt_count++;
					if(tmd_edit.prim[f30[b]].cmd & 0b1000 == 8){
						array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f30[b]].tex_x[3]), convert_xy_uv(tmd_edit.prim[f30[b]].tex_y[3], 1)) + "\n");
						vt_count++;
					}
				}
			}
			if (array_length(f31) != 0){
				for(var b = 0; b < array_length(f31); b++){
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f31[b]].tex_x[0]), convert_xy_uv(tmd_edit.prim[f31[b]].tex_y[0], 1)) + "\n");
					vt_count++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f31[b]].tex_x[1]), convert_xy_uv(tmd_edit.prim[f31[b]].tex_y[1], 1)) + "\n");
					vt_count++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f31[b]].tex_x[2]), convert_xy_uv(tmd_edit.prim[f31[b]].tex_y[2], 1)) + "\n");
					vt_count++;
					if(tmd_edit.prim[f31[b]].cmd & 0b1000 == 8){
						array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f31[b]].tex_x[3]), convert_xy_uv(tmd_edit.prim[f31[b]].tex_y[3], 1)) + "\n");
						vt_count++;
					}
				}
			}
		}
	}
	
	//default for no verts
	else {array_push(obj_string_array, string("vt 0.000000 0.000000"));}
	//comment with vert coord count
	array_push(obj_string_array, string("# {0} texture coordinates", vt_count) + "\n");
	//empty line
	array_push(obj_string_array, "\n");
	//default for no vertex normals
	array_push(obj_string_array, string("vn 0.000000 0.000000 0.000000") + "\n");
	array_push(obj_string_array, string("# {0} normals", 1) + "\n");
	//empty line
	array_push(obj_string_array, "\n");
	
	// grouping part of primitive section
	current_obj = 0;
	vert_base = 0;
	tex_base = 1;
	tex_count = 0;
	triangle_total = 0;
	for(var a = 0; a < tmd_edit.obj_num; a++){
		//g TMD object #0, VRAM page #30 

		change = tmd_edit.objects[a].vert_off - tmd_edit.objects[0].vert_off;
		vert_base = change / 8;

		f29 = [];
		f30 = [];
		f31 = [];
		for (var b = 0; b < tmd_edit.objects[a].prim_num; b++){
			current_prim = b + tmd_edit.objects[a].prim_index - tmd_edit.objects[a].prim_num;
			switch (tmd_edit.prim[b + tmd_edit.objects[a].prim_index - tmd_edit.objects[a].prim_num].page_x){
				case 13:
				array_push(f29, current_prim);
				break;
				case 14:
				array_push(f30, current_prim);
				break;
				case 15:
				array_push(f31, current_prim);
				break;
			}
		}
		if (array_length(f29) != 0){
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM page #29", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM page #29") + "\n");
			for (var b = 0; b < array_length(f29); b++){
				f_vert = tmd_edit.prim[f29[b]];
				f_tex = tmd_edit.prim[f29[b]];
				
				array_push(obj_string_array, string("f "));
				array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[0] + 1), string(tex_base)));
				tex_base++;
				array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[1] + 1), string(tex_base)));
				tex_base++;
				array_push(obj_string_array, string("{0}/{1}", string(vert_base + f_vert.vert[2] + 1), string(tex_base)));
				tex_base++;
				array_push(obj_string_array, "\n");
				triangle_group++;
				triangle_total++;
				
				if (tmd_edit.prim[f29[b]].cmd & 0b1000 == 8){
					tex_base -= 2;
					array_push(obj_string_array, string("f "));
					array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[1] + 1), string(tex_base)));
					tex_base++;
					array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[2] + 1), string(tex_base)));
					tex_base++;
					array_push(obj_string_array, string("{0}/{1}", string(vert_base + f_vert.vert[3] + 1), string(tex_base)));
					tex_base++;
					array_push(obj_string_array, "\n");
					triangle_group++;
					triangle_total++;
				}
				
			}
			//triangle_total = triangle_total + array_length(f29);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");

		}
		
		if (array_length(f30) != 0){
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM page #30", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM page #30") + "\n");
			for (var b = 0; b < array_length(f30); b++){
				f_vert = tmd_edit.prim[f30[b]];
				f_tex = tmd_edit.prim[f30[b]];
				
				array_push(obj_string_array, string("f "));
				array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[0] + 1), string(tex_base)));
				tex_base++;
				array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[1] + 1), string(tex_base)));
				tex_base++;
				array_push(obj_string_array, string("{0}/{1}", string(vert_base + f_vert.vert[2] + 1), string(tex_base)));
				tex_base++;
				//if (tmd_edit.prim[f30[b]].cmd & 0b1000 == 8){
				//	array_push(obj_string_array, string("{0}/{1}", string(vert_base + f_vert.vert[3]), string(tex_base)));
				//	tex_base++;
				//}
				array_push(obj_string_array, "\n");
				triangle_group++;
				triangle_total++;
				if (tmd_edit.prim[f30[b]].cmd & 0b1000 == 8){
					tex_base -= 2;
					array_push(obj_string_array, string("f "));
					array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[1] + 1), string(tex_base)));
					tex_base++;
					array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[2] + 1), string(tex_base)));
					tex_base++;
					array_push(obj_string_array, string("{0}/{1}", string(vert_base + f_vert.vert[3] + 1), string(tex_base)));
					tex_base++;
					array_push(obj_string_array, "\n");
					triangle_group++;
					triangle_total++;
				}
			}
			//triangle_total = triangle_total + array_length(f30);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");

	}
		
		if (array_length(f31) != 0){
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object# {0}, VRAM page #31", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM page #31") + "\n");
			for (var b = 0; b < array_length(f31); b++){
				f_vert = tmd_edit.prim[f31[b]];
				f_tex = tmd_edit.prim[f31[b]];
				
				array_push(obj_string_array, string("f "));
				array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[0] + 1), string(tex_base)));
				tex_base++;
				array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[1] + 1), string(tex_base)));
				tex_base++;
				array_push(obj_string_array, string("{0}/{1}", string(vert_base + f_vert.vert[2] + 1), string(tex_base)));
				tex_base++;
				//if (tmd_edit.prim[f31[b]].cmd & 0b1000 == 8){
				//	array_push(obj_string_array, string("{0}/{1}", string(vert_base + f_vert.vert[3]), string(tex_base)));
				//	tex_base++;
				//}
				array_push(obj_string_array, "\n");
				triangle_group++;
				triangle_total++;
				if (tmd_edit.prim[f31[b]].cmd == 8){
					tex_base -= 2;
					array_push(obj_string_array, string("f "));
					array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[1] + 1), string(tex_base)));
					tex_base++;
					array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[2] + 1), string(tex_base)));
					tex_base++;
					array_push(obj_string_array, string("{0}/{1}", string(vert_base + f_vert.vert[3] + 1), string(tex_base)));
					tex_base++;
					array_push(obj_string_array, "\n");
					triangle_group++;
					triangle_total++;
				}
			}
			//triangle_total = triangle_total + array_length(f31);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");

		}
		
	}
	//quad_string = string("{0} quads", quad_count);	
	array_push(obj_string_array, string("# {0} triangles total", triangle_total));	
	
	export_path = get_save_filename_ext("Wavefront OBJ|*.obj", fname_mm0, "","Save OBJ File");
	
	for (var a = 0; a < array_length(obj_string_array); a++){
		buffer_write(objbuffer, buffer_text, obj_string_array[a]);
	}
	
	buffer_save(objbuffer, export_path);
	// |# Wavefront OBJ exported by me ;)
	
	// |mtllib xx_xx_x.mtl                       //external .mtl file name
	// |
	// |
	// |
	// |v [x y z]
	// |v [x y z]
	// |v [x y z]
	// |# [num] vertices                         //comment line
	// |
	// |vt [u v]                                 // coord divided by 256
	// |vt [u v]
	// |vt [u v]
	// |# [num] texture coordinates
	// |
	// |vn [x y z] // vn 0.000000 0.000000 0.000000
	// |# [num] normals
	// |                                         //--- Face defining + mtl/texture tag
	// |o TMD object #{0}, VRAM page #{1}        //creating object{0} and group{1}
	// |usemtl VRAM page #{1}
	// |
	// |f 1/1 2/2 3/3                            //linking vert and text indices
	// |f 4/4 5/5 6/6 7/7                        //list 4 if a quad
	// |
	// |o TMD object #{0}, VRAM page #{1}        //repeat for remaining objects, split for seperate mtl/VRAM pages
	// |usemtl VRAM page #{1}
	// |
	// |f 1/1 2/2 3/3                            
	// |f 4/4 5/5 6/6                    
}