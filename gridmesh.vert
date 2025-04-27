#version 440
layout(location = 0) in vec4 qt_Vertex;
layout(location = 1) in vec2 qt_MultiTexCoord0;
layout(location = 0) out vec2 qt_TexCoord0;
layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float width;
};
void main() {
    // GridMeshを使用することでqt_Vertexが増える
    vec4 pos = qt_Vertex;
    float d = 0.5 * smoothstep(0.0, 1.0, qt_MultiTexCoord0.y);
    pos.x = width * mix(d, 1.0 - d, qt_MultiTexCoord0.x);
    gl_Position = qt_Matrix * pos;
    qt_TexCoord0 = qt_MultiTexCoord0;
}
