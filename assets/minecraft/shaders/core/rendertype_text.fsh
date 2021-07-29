#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

uniform vec2 ScreenSize;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

bool isDarkGray(vec4 a) {
    return (a.r == 0.329411765 && a.r == a.g && a.r == a.b && a.a == 1.0) || (a.r > 0.081 && a.r < 0.082 && a.r == a.g && a.r == a.b);
}

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
	
	// discard transparent parts
    if(color.a < 0.001) discard;
	
	//color.a = 1.0;
	
	// if shadow of tooltip font
	if(color.r >= 0.0150 && color.r <= 0.0154 && color.g == 0.0 && color.b >= 0.0150 && color.b <= 0.0154 && color.a < 0.95) {
		discard;
	}
	//  && color.b >= 0.0150 && color.b <= 0.0154 && color.a < 0.95
	if(color.r >= 0.0372 && color.r <= 0.0390 && color.g == 0.0) {
		discard;
	}
	
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);

    if(isDarkGray(fragColor)) discard;
}
