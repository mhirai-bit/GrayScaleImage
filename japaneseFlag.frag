#version 440
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;
layout(std140, binding = 0) uniform ubuf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float width;
    float height;
};

void main() {
    vec2 uv = qt_TexCoord0 - vec2(0.5);

    uv.x *= width/height;

    float d = length(uv);

    float r = 0.3;

    vec3 red = vec3(188.0/255.0, 0.0, 45.0/255.0);
    vec3 white = vec3(1.0);
    vec3 col = (d < r) ? red : white;

    fragColor = vec4(col, 1.0) * qt_Opacity;
}
