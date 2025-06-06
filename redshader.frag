#version 440
layout(location  = 0)in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float redChannel;
} ubuf;

layout(binding = 1) uniform sampler2D source;

void main() {
    fragColor = texture(source, qt_TexCoord0) * vec4(ubuf.redChannel, 0.0, 0.0, 1.0) * ubuf.qt_Opacity;
}
