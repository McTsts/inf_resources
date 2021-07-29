#version 150

in vec4 vertexColor;
in float vertexDistance;
in vec2 uv;

uniform vec4 ColorModulator;

out vec4 fragColor;

void main() {
    vec4 color = vertexColor;
	// remove durability blue bar
    if (color.a == 0.0 || (color.r == 0.4 && color.g == 0.4 && color.b == 1.0 && color.a == 1.0) || (color.r == 0.0 && color.g == 0.0 && color.b == 0.0 && color.a == 1.0)) {
        discard;
    }
	// remove bundle hightlight
	if(vertexDistance < 2000.0 && (color.r > 0.9 && color.r == color.b && color.b == color.g)) {
		discard;
	}
	//remove tooltip
	if((color.r >= 0.062745098 && color.r <= 0.062745099 && color.r == color.b && color.g == 0.00) || (color.r >= 0.156862745 && color.r <= 0.313725490 && color.b >= 0.156862745 && color.b <= 1.0 && color.g == 0.00)) {
		discard;
	}
    fragColor = color * ColorModulator;
}
