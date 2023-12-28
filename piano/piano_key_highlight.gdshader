shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 incolor = texture(TEXTURE, UV);
	COLOR = incolor;
	//COLOR = vec4(1, 1, incolor.b, 0.9);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
