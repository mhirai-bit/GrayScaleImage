import QtQuick

Rectangle {
    width: 640; height: 427
    layer.enabled: true
    color: "black"
    layer.effect: theEffect as Component

    ShaderEffect {
        id: theEffect
        width: parent.width
        height: parent.height
        fragmentShader: "qrc:/frenchFlag.frag.qsb"
    }
}
