import QtQuick

ShaderEffect {
    width: 640; height: 480
    mesh: GridMesh {
        resolution: Qt.size(20, 20)
    }
    property var source: Image {
        source: "qrc:/qt/qml/GrayScaleImage/Qtlogo.png"
        sourceSize { width: 200; height: 200 }
    }
    vertexShader: "qrc:/gridmesh.vert.qsb"
}
