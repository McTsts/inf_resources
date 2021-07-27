#version 150

in vec3 Position;
in vec4 Color;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

out vec4 vertexColor;
out float vertexDistance;
out vec2 uv;

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    vertexColor = Color;
	vertexDistance = length((ModelViewMat * vec4(Position, 1.0)).xyz);
	
	uv = (gl_Position.xy/gl_Position.w + 1.0)/2.0;
}
