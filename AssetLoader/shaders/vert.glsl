#version 450 core


layout(location = 0) in vec3 vertexPosition_modelspace;
layout(location = 2) in vec3 norms;
layout(location = 3) in vec3 cols;
layout (location = 4) in vec2 texCoords;

out vec3 fragmentColor;
out vec3 Normal;
out vec3 FragPos;
out vec2 TexCoords;

uniform mat4 MVP;
uniform mat4 Model;
uniform vec3 myColor;


void main(){	

	// Output position of the vertex, in clip space : MVP * position
	gl_Position =  MVP *Model* vec4(vertexPosition_modelspace,1.0f);

	// The color of each vertex will be interpolated
	// to produce the color of each fragment
	FragPos = vec3( vec4(vertexPosition_modelspace, 1.0f));
    Normal = mat3(transpose(inverse(Model))) * norms; 
	fragmentColor = cols;
	TexCoords = texCoords;
}
