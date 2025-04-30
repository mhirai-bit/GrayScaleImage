#version 440
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;
layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
} ubuf;

void main() {
    float u = qt_TexCoord0.x;
    if (u < 1.0/3.0) {
        fragColor = vec4(0.0/255.0, 35.0/255.0, 149.0/255.0, ubuf.qt_Opacity);
    } else if (u < 2.0/3.0) {
        fragColor = vec4(1.0, 1.0, 1.0, ubuf.qt_Opacity);
    } else {
        fragColor = vec4(237/255.0, 41/255.0, 57/255.0, ubuf.qt_Opacity);
    }
}
