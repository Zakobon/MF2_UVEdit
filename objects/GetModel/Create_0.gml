globalvar filename_input;
filename_input = "";

globalvar prim_diff;
prim_diff = [];

mm0_base_buffer = -1; //Import buffer
tmd_edit_buffer = -1; //Export buffer
p_index = 0; //counter to keep track of where an object's primitives start from
offset = 0;


tmd_base = { //Original data, do not edit
	id : 0,
	
	mm0header : { //MM0 file's actual header is just a table linking start of tmd(1) and start of animations(1-2)
		tsize : 0, // 2 or 3 items, table doesn't include the 32bit zero padding right after size 
		pointer : [],
	},
	
	tmd_id : 0x41,
	tmd_flag : 0, //0b1 object refs offset(0=Addr from beginning of Object 1=beginning of TMD)
	obj_num : 0,
	
	tmd_size : 0,
	objects : [],
	
	
	prim : [], //entire primitive section - either "prim3" or "Primitive" struct
	vert : [], //entire vertex section - use "vertex" struct
	norm : [],
	final : [], //animation section - can just dump rest of file into here
}

tmd_edit = { //The modified values should be saved here
	id : 0,

	mm0header : { //MM0 file's actual header is just a table linking start of tmd(1) and start of animations(1-2)
		tsize : 0, // 2 or 3 items, table doesn't include the 32bit zero padding right after size 
		pointer : [],
	},
	
	tmd_id : 0x41,
	tmd_flag : 0, //0b1 object refs offset(0=Addr from beginning of Object 1=beginning of TMD)
	obj_num : 0,
	
	tmd_size : 0,
	objects : [],
	
	
	prim : [], //entire primitive section - either "prim3" or "Primitive" struct
	vert : [], //entire vertex section - use "vertex" struct
	norm : [],
	final : [], //normal + animation section - can just dump rest of file into here
}
function Object(_prim_index, _Scale, _PrimNum, _PrimOff, _NormNum, _NormOff, _VertNum, _VertOff) constructor{
		vert_off = _VertOff; // + 0x1c if tmd_base.mm0header.size = 3, +0x10 else
		vert_num = _VertNum;
		normal_off = _NormOff; // + 0x1c if tmd_base.mm0header.size = 3, +0x10 else
		normal_num = _NormNum;
		prim_off = _PrimOff; // + 0x1c if tmd_base.mm0header.size = 3, +0x10 else
		prim_num = _PrimNum;
		scale = _Scale;
		prim_index = _prim_index;
		//prim_p29_list = [];
		//prim_p30_list = [];
		//prim_p31_list = [];
}

//function Primitive(_vert3 = 0, _norm3 = 0, _vert2 = 0, _norm2 = 0, _vert1 = 0, _norm1 = 0, _pad2 = 0, _3ty = -1, _3tx = -1, _pad = 0, _2ty = 0, _2tx = 0, _pxy = 0, _1ty = 0, _1tx = 0, _clut = 0, _0ty = 0, _0tx = 0, _cmd = 0, _B = 0, _G = 0, _R = 0, _p_id) constructor{
//	p_id = _p_id;
//	red = _R; //u8 First Vertex Color
//	green = _G; //u8
//	blue = _B; //u8
//	cmd = _cmd //u8
//	//0bxx xx xx x1 = Texture Mode      (0=Blended 1=Raw)                (Textured-Polygon/Rectangle only)
//	//0bxx xx xx 1x = Semi Transparency (0=Opaque 1=Semi-Transparent)    (All Render Types)
//	//0bxx xx x1 xx = Texture Mapping   (0=Off 1=On)                     (Polygon/Rectangle only)
	
//	//0bxx x1 1x xx = Rectangle Size    (0=Var 1=1x1 2=8x8 3=16x16)      (Rectangle only)
//	//0bxx xx 1x xx = Num Vertices      (0=Triple 1=Quad)                (Polygon only)
//	//0bxx xx 1x xx = Num Lines         (0=Single 1=Poly)                (Line only)
	
//	//0bxx x1 xx xx = Shading           (0=Flat 1=Gouroud)               (Polygon/Line only)
//	//0bx1 1x xx xx = Primitive Type    (1=Polygon 2=Line 3=Rectangle)
//	tex0tx = _0tx; //u8
//	tex0ty = _0ty; //u8
//	texclut = _clut; //u16 clut_x(u6) + clut_y(u9) +Null(u1)
//	tex1tx = _1tx; //u8
//	tex1ty = _1ty; //u8
//	texpxy = _pxy; //u16 * 64 = texpagex or u4 + 16 = texpage#
//	//texpy = _py; //u1 0 = texpagey + 0 or  1 = texpagey + 256
//	tex2tx = _2tx; //u8
//	tex2ty = _2ty; //u8
//	pad = _pad //u16
//	tex3tx = _3tx; //u8
//	tex3ty = _3ty; //u8
//	pad2 = _pad2; //u16
//	color = [] //u32 [00 Bb Gg Rrh] same deal as GPU command + color (u32), cmd bytes are zero here
//	norm = [_norm1, _norm2, _norm3]; // 4 x u16
//	vert = [_vert1, _vert2, _vert3]; // 4 x u16
//}

//removed R G B to add it to colors[0] instead
function Prim_Base_Diff() constructor{
	r_steps = []; //tracks rotation steps from edit_write to prevent warping
	r_cx = []; //centerX points of r_steps
	r_cy = []; //centerY points of r_steps
	tex_x = [0, 0, 0, 0];
	tex_y = [0, 0, 0, 0];
	
	
	x_scale_total = 100;
	y_scale_total = 100;
	x_flip_new = 0;
	y_flip_new = 0;
	transparency_new = -1;
	bit_mode_new = -1;
}
function Primitive(_pad = 0, _t_disable = 0, _c_mode = 0, _t_mode = 0, _page_y = 256, _page_x = 0, _clut_y = 0, _clut_x = 0, _cmd = 0, _p_id = 0) constructor{
	p_id = _p_id;
	r_steps = []; //tracks rotation steps from edit_write to prevent warping
	r_cx = []; //centerX points of r_steps
	r_cy = []; //centerY points of r_steps
	x_diff = [0, 0, 0, 0];
	y_diff = [0, 0, 0, 0];
	cmd = _cmd; //u8
	//0bxx xx xx x1 = Texture Mode      (0=Blended 1=Raw)                (Textured-Polygon/Rectangle only)
	//0bxx xx xx 1x = Semi Transparency (0=Opaque 1=Semi-Transparent)    (All Render Types)
	//0bxx xx x1 xx = Texture Mapping   (0=Off 1=On)                     (Polygon/Rectangle only)
	
	//0bxx x1 1x xx = Rectangle Size    (0=Var 1=1x1 2=8x8 3=16x16)      (Rectangle only)
	//0bxx xx 1x xx = Num Vertices      (0=Triple 1=Quad)                (Polygon only)
	//0bxx xx 1x xx = Num Lines         (0=Single 1=Poly)                (Line only)
	
	//0bxx x1 xx xx = Shading           (0=Flat 1=Gouroud)               (Polygon/Line only)
	//0bx1 1x xx xx = Primitive Type    (1=Polygon 2=Line 3=Rectangle)
	tex_x = [];
	tex_y = [];
	clut_x = _clut_x;
	clut_y = _clut_y;
	
	page_x = _page_x;       //0bxxxx xxxx xxxx 1111// page_x + (16 * page_y) = page number or page_x * 64 = page x
	page_y = _page_y;       //0bxxxx xxxx xxx1 xxxx// page_y base = page_y * 256;
	t_mode = _t_mode;       //0bxxxx xxxx x11x xxxx// transparency mode
	c_mode = _c_mode;       //0bxxxx xxx1 1xxx xxxx// bit depth
	t_disable = _t_disable; //0bxxxx 1xxx xxxx xxxx// Texture Disable
	
	//1 - 4 u8 -> [00 Bb Gg Rrh] same deal as GPU command + color (u32), except cmd bytes are 00
	colors = []; //Vertex_Color(_blue,_green,_red)
	norm = []; // 3 or 4 x u16
	vert = []; //Vertex(_pad,_vz,_vy,_vz)
}
function Vertex(_pad, _vz, _vy, _vx) constructor{
	vx = _vx;
	vy = _vy;
	vz = _vz;
	pad = _pad;
}
function Normal(_pad = 0, _nz, _ny, _nx) constructor{
	nx = _nx;
	ny = _ny;
	nz = _nz;
	pad = _pad;
}
function Vertex_Color(_pad, _blue, _green, _red) constructor{
	r = _red; //u8
	g = _green; //u8
	b = _blue; //u8
	pad = _pad; //u8
}
filename_input = get_open_filename_ext("MRDX MM_ Files|*.mmj;*.mmx", "", "","Open MRDX MMJ/MMX File");

if ( filename_input != "") {
	file_destination = filename_input;
	base_tag = string_copy(file_destination, string_length(file_destination) - 4, 5);
	new_tag = string_delete(base_tag, 0, 1);
    mm0_base_buffer = buffer_load(filename_input);
    buffer_seek(mm0_base_buffer, buffer_seek_start, 0);
	filename_array = string_split(filename_input, "\\");
	ui_name_mm0 = filename_array[array_length(filename_array) - 1];
	fname_mm0 = string_trim(ui_name_mm0, [".mmj", ".mmx"]);
	filename_array[0] = string_replace(filename_input, base_tag,"a" + new_tag);
	filename_array[1] = string_replace(filename_input, base_tag,"b" + new_tag);
	filename_array[2] = string_replace(filename_input, base_tag,"d" + new_tag);
	filename_array[3] = string_replace(filename_input, base_tag,"i" + new_tag);
	filename_array[4] = string_replace(filename_input, base_tag,"p" + new_tag);
	filename_array[5] = string_replace(filename_input, base_tag,"v" + new_tag);
}
else{
	tmd_base = -1;
	tmd_edit = -1;
	instance_destroy();
	exit;
}
 

 
 while ( filename_input != "" && buffer_tell(mm0_base_buffer) + 16 < buffer_get_size(mm0_base_buffer)) {
	 
	 
	tmd_base.mm0header.tsize = buffer_read(mm0_base_buffer, buffer_u32);
	array_push(tmd_base.mm0header.pointer,buffer_read(mm0_base_buffer, buffer_u32));
	array_push(tmd_base.mm0header.pointer,buffer_read(mm0_base_buffer, buffer_u32));
	array_push(tmd_base.mm0header.pointer,buffer_read(mm0_base_buffer, buffer_u32));
	
	if tmd_base.mm0header.tsize == 3 {
		array_push(tmd_base.mm0header.pointer,buffer_read(mm0_base_buffer,buffer_u32));
	}
	else {
		array_push(tmd_base.mm0header.pointer, -1);
	}


	
	tmd_base.tim_id = buffer_read(mm0_base_buffer,buffer_u32);
	tmd_base.version = buffer_read(mm0_base_buffer,buffer_u32);
	tmd_base.obj_num = buffer_read(mm0_base_buffer,buffer_u32);
	
// OBJECTS
	tmd_base.obj_off = buffer_tell(mm0_base_buffer); //base address for each object's offset
	
	for (var i = 0; i < tmd_base.obj_num; i++) {
		obj = new Object(
			0,
			buffer_read(mm0_base_buffer,buffer_u32),
			buffer_read(mm0_base_buffer,buffer_u32),
			buffer_read(mm0_base_buffer,buffer_u32),
			buffer_read(mm0_base_buffer,buffer_u32),
			buffer_read(mm0_base_buffer,buffer_u32),
			buffer_read(mm0_base_buffer,buffer_u32),
			buffer_read(mm0_base_buffer,buffer_u32)
		)
		array_push(tmd_base.objects, obj);
		p_index += tmd_base.objects[i].prim_num;
		tmd_base.objects[i].prim_index = p_index;
	}


	primbase = 0;
	for (var j = 0; j < tmd_base.obj_num; j++) {
		primbase = tmd_base.obj_off + tmd_base.objects[j].prim_off;
		tmd_base.prim_base = primbase;
		
		
		buffer_seek(mm0_base_buffer, buffer_seek_start, primbase);
		
		tmd_base.prim_offset = 0;
		
		for (var i = 0; i < tmd_base.objects[j].prim_num; i++) {
			
			buffer_seek(mm0_base_buffer, buffer_seek_relative, tmd_base.prim_offset);
			
			//var CMD = buffer_peek(mm0_base_buffer, primbase + 3, buffer_u8);
			var red = buffer_read(mm0_base_buffer, buffer_u8);
			var green = buffer_read(mm0_base_buffer, buffer_u8);
			var blue = buffer_read(mm0_base_buffer, buffer_u8);
			var CMD = buffer_read(mm0_base_buffer, buffer_u8);
			
			vert_rgb = new Vertex_Color(
				0,
				blue, 
				green, 
				red
			);
			primitive = new Primitive();
			prim_base_diff = new Prim_Base_Diff();
			primitive.p_id = i;
			primitive.cmd = CMD;
			array_push(primitive.colors, vert_rgb);
			array_push(prim_diff, prim_base_diff);
			
			
			//==Decoding primitive's GPU command==
			p_type = (CMD >> 5) & 0b11; //Primitive Type 0b1xx is ignored for our purposes
			p_shading = (CMD >> 4) & 0b1; //Polygon/Line only
			p_line_num = (CMD >> 3) & 0b1; //Line only
			p_poly_vert = (CMD >> 3) & 0b1; //Polygon only
			p_rect_size = (CMD >> 3) & 0b11; //Rectangle only
			p_tex_mapping = (CMD >> 2) & 0b1; //Polygon/Rectangle
			p_transparency = (CMD >> 1) & 0b1; //All Render Types
			p_tex_mode = CMD & 0b1; //Textured-Polygon/Rectangle only
			
			if (p_type == 1){
				array_push(primitive.tex_x, buffer_read(mm0_base_buffer, buffer_u8));
				array_push(primitive.tex_y, buffer_read(mm0_base_buffer, buffer_u8));
				clut = buffer_read(mm0_base_buffer, buffer_u16);
				primitive.clut_x = clut & 0b111111;
				primitive.clut_y = (clut >> 6) & 0b111111111;
				
				array_push(primitive.tex_x, buffer_read(mm0_base_buffer, buffer_u8));
				array_push(primitive.tex_y, buffer_read(mm0_base_buffer, buffer_u8));
				page = buffer_read(mm0_base_buffer, buffer_u16);
				primitive.page_x = page & 0b1111;
				primitive.page_y = (page >> 4) & 0b1;
				primitive.t_mode = (page >> 5) & 0b11;
				primitive.c_mode = (page >> 7) & 0b11;
				primitive.t_disable = (page >> 11) & 0b1;
				array_push(primitive.tex_x, buffer_read(mm0_base_buffer, buffer_u8));
				array_push(primitive.tex_y, buffer_read(mm0_base_buffer, buffer_u8));
				if (p_tex_mode == 1){ //raw texture blending
					primitive.n_off = buffer_read(mm0_base_buffer, buffer_u16);
					repeat (3){
						vert_rgb = new Vertex_Color(
							buffer_read(mm0_base_buffer, buffer_u8), //padding
							buffer_read(mm0_base_buffer, buffer_u8), //blue
							buffer_read(mm0_base_buffer, buffer_u8), //green
							buffer_read(mm0_base_buffer, buffer_u8) //red
						);
						array_push(primitive.colors, vert_rgb);
					}
					repeat (3){
						array_push(primitive.vert, buffer_read(mm0_base_buffer, buffer_u16));
					}
					buffer_read(mm0_base_buffer, buffer_u16); //padding
				}
				else{
					buffer_read(mm0_base_buffer, buffer_u16); //padding
					if (p_poly_vert == 1){
						array_push(primitive.tex_x, buffer_read(mm0_base_buffer, buffer_u8));
						array_push(primitive.tex_y, buffer_read(mm0_base_buffer, buffer_u8));
						buffer_read(mm0_base_buffer, buffer_u16); //padding
					}
					repeat (3 + p_poly_vert){
						array_push(primitive.norm, buffer_read(mm0_base_buffer, buffer_u16));
						array_push(primitive.vert, buffer_read(mm0_base_buffer, buffer_u16));
					}
				}
			}
			array_push(tmd_base.prim, primitive);
		}
	}
			////==Old import==
			//if (CMD & 0b1000 == 8){
			//	cmd_off = 4;
			//}
			//else{
			//	cmd_off = 0;
			//}
			////==Old import==//
			//primitive = new Primitive(
			//		buffer_peek(mm0_base_buffer, primbase + 26 + cmd_off, buffer_u16),//vert3
			//		buffer_peek(mm0_base_buffer, primbase + 24 + cmd_off, buffer_u16),//norm3
					
			//		buffer_peek(mm0_base_buffer, primbase + 22 + cmd_off, buffer_u16),//vert2
			//		buffer_peek(mm0_base_buffer, primbase + 20 + cmd_off, buffer_u16),//norm2
					
			//		buffer_peek(mm0_base_buffer, primbase + 18 + cmd_off, buffer_u16),//vert1
			//		buffer_peek(mm0_base_buffer, primbase + 16 + cmd_off, buffer_u16),//norm1
					
			//		buffer_peek(mm0_base_buffer, primbase + 18, buffer_u16),//PAD2
			//		buffer_peek(mm0_base_buffer, primbase + 17, buffer_u8),//tex3ty
			//		buffer_peek(mm0_base_buffer, primbase + 16, buffer_u8),//tex3tx
					
			//		buffer_peek(mm0_base_buffer, primbase + 14, buffer_u16),//PAD
			//		buffer_peek(mm0_base_buffer, primbase + 13, buffer_u8),//tex2ty
			//		buffer_peek(mm0_base_buffer, primbase + 12, buffer_u8),//tex2tx
				
			//		buffer_peek(mm0_base_buffer, primbase + 10, buffer_u16) - 144,//texpxy
			//		buffer_peek(mm0_base_buffer, primbase + 9, buffer_u8),//tex1ty
			//		buffer_peek(mm0_base_buffer, primbase + 8, buffer_u8),//tex1tx
				
			//		buffer_peek(mm0_base_buffer, primbase + 6, buffer_u16),//clut
			//		buffer_peek(mm0_base_buffer, primbase + 5, buffer_u8),//tex0ty 
			//		buffer_peek(mm0_base_buffer, primbase + 4, buffer_u8),//tex0tx 
				
			//		buffer_peek(mm0_base_buffer, primbase + 3, buffer_u8),//cmd 
			//		buffer_peek(mm0_base_buffer, primbase + 2, buffer_u8),//B 
			//		buffer_peek(mm0_base_buffer, primbase + 1, buffer_u8),//G 
			//		buffer_peek(mm0_base_buffer, primbase + 0, buffer_u8),//R
					
			//		i//p_id
			//	);
				
			//if (p_poly_vert) {
			//	array_push(primitive.vert, buffer_peek(mm0_base_buffer, primbase + 34, buffer_u16));//vert4
			//	array_push(primitive.norm, buffer_peek(mm0_base_buffer, primbase + 32, buffer_u16));//norm4
			//	primbase += 36;
			//	array_push(primitive.vert, buffer_read(mm0_base_buffer, buffer_u16));//vert4
			//}
			//else{
			//	primbase += 28;
			//}
			

	
	//buffer_seek(mm0_base_buffer, buffer_seek_start, primbase + 1);

	vert_total = (tmd_base.objects[0].normal_off - tmd_base.objects[0].vert_off) / 4;
	for(var a = 0; a < (vert_total * 4); a += 8){
		vx = buffer_read(mm0_base_buffer, buffer_s16);
		vy =  buffer_read(mm0_base_buffer, buffer_s16);
		vz = buffer_read(mm0_base_buffer, buffer_s16);
		pad = buffer_read(mm0_base_buffer, buffer_s16);
		vertex = new Vertex(pad, vz, vy, vx);
		array_push(tmd_base.vert, vertex);
	}
	for(var a = 0; a < (vert_total * 4); a += 8){
		nx = buffer_read(mm0_base_buffer, buffer_s16);
		ny =  buffer_read(mm0_base_buffer, buffer_s16);
		nz = buffer_read(mm0_base_buffer, buffer_s16);
		pad = buffer_read(mm0_base_buffer, buffer_s16);
		normal = new Normal(pad, nz, ny, nx);
		array_push(tmd_base.norm, normal);
	}
	tmd_base.tmd_size = tmd_base.objects[0].scale;
	check = buffer_peek(mm0_base_buffer, tmd_base.tmd_size + tmd_base.mm0header.pointer[1] + 0x10, buffer_u16);
	animation_pointer = tmd_base.tmd_size + check + tmd_base.mm0header.pointer[1];
	//test2 = ["file type: ", animation_pointer]
	
	//Unused data collection
	while (buffer_tell(mm0_base_buffer) + 16 < buffer_get_size(mm0_base_buffer)){
		array_push(tmd_base.final,buffer_read(mm0_base_buffer,buffer_u8));
	}
}

// ----------------- Milkshape 3D OBJ file prim linking setup ----------------- //
// Milkshape TMD Import splits each object into parts based on tex page #
// example: "TMD object #0, VRAM page #29" & "TMD object #0, VRAM page #30"
// this split loses the original ordering/index number for each primitive
// to fpixelx this, we'll use a base file and create lists of index numbers
// in the same order that Wavefront splits the object and it's primitives
//
//                               -- Example --
// -- file_obj_in.objects[x].part[0].prim[0].p_id = objects[x].prim_p29_list[0]
// -- file_obj_in.objects[x].part[1].prim[0].p_id = objects[x].prim_p30_list[0]
// -- file_obj_in.objects[x].part[2].prim[5].p_id = objects[x].prim_p31_list[5]
// ------------------------------------------------------------------------- //

// For each object this creates an array for each page 
// that contains the indices of that page's primitives
//for (var a = 0; a < array_length(tmd_base.objects); a++){
//	pbase = tmd_base.objects[a].prim_index - tmd_base.objects[a].prim_num;

//	for (var b = 0; b < tmd_base.objects[a].prim_num; b++){
//		switch (tmd_base.prim[b + pbase].texpxy + 16) 
//		{
//			case 29:
//			array_push(tmd_base.objects[a].prim_p29_list, tmd_base.prim[b + pbase].p_id);
//			break;
			
//			case 30:
//			array_push(tmd_base.objects[a].prim_p30_list, tmd_base.prim[b + pbase].p_id);
//			break;
			
//			case 31:
//			array_push(tmd_base.objects[a].prim_p31_list, tmd_base.prim[b + pbase].p_id);
//			break;
		
//			default:
//			break;
//		}
		
//	}
//}
// tmd_base = original(unedited)
// tmd_edit = copy that we write changes to
tmd_edit = variable_clone(tmd_base);
//if (tmd_edit_flag != 1){
//	tmd_edit = variable_clone(tmd_base);
//	tmd_edit_flag = 1;
//} 

prim_list = [tmd_edit.prim[ui_prim]];

ui_prim = 0;
ui_obj = 0;

ui_prim_x = 0;
ui_prim_y = 0;
group_xmin = 0;
group_xmax = 0;
group_ymin = 0;
group_ymax = 0;
x_edit = 0;
y_edit = 0;
x_edit_ui = 0;
y_edit_ui = 0;
x_scale_edit = 100;
y_scale_edit = 100;
rotate = 0;
clut_x_ui = -1;
clut_y_ui = -1;
ui_prim_transparency = -1;
prim_bit_mode = -1;
event_user(0);