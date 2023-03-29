shader_type canvas_item;
uniform sampler2D overlay;

//good documentation for shader syntax: https://docs.godotengine.org/en/stable/tutorials/shaders/shader_reference/shading_language.html#uniforms
//good example for shader syntax: https://www.reddit.com/r/godot/comments/flshso/is_there_a_way_to_create_sprite_overlays_in_godot/
//If base color brighter than 50%, get brighter, if dimmer than 50%, get dimmer - what constitutes brightness?
//Also apply texture of grayness? - what constitutes texture?
void fragment() {
	vec4 base = texture(TEXTURE, UV); //read from texture
	vec4 over = texture(overlay, UV); //read from input image (provided in BluffTable.gd at runtime)
	COLOR = base; //complete with no change
}
