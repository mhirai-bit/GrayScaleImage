import QtQuick

ShaderEffect {
    anchors.fill: parent

    mesh: GridMesh {
        resolution: Qt.size(50,50)
    }

    property real topWidth: open ? width : 20
    property real bottomWidth: topWidth
    property real amplitude: 0.1
    property bool open: false
    property var source: effectSource

    Behavior on bottomWidth {
        SpringAnimation {
            easing.type: Easing.OutElastic
            velocity: 250; mass: 1.5
            spring: 0.5; damping: 0.05
        }
    }

    Behavior on topWidth {
        NumberAnimation { duration: 1000 }
    }

    ShaderEffectSource {
        id: effectSource
        sourceItem: effectImage
        hideSource: true
    }

    Image {
        id: effectImage
        anchors.fill: parent
        source: "qrc:/qt/qml/GrayScaleImage/redCurtain.png"
        fillMode: Image.Tile
    }

    vertexShader: "qrc:/curtain.vert.qsb"
    fragmentShader: "qrc:/curtain.frag.qsb"
}
