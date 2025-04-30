import QtQuick

Rectangle {
    width: 480; height: 240
    color: "#1e1e1e"

    Grid {
        anchors.centerIn: parent
        spacing: 20
        rows: 2; columns: 4
        Image {
            id: sourceImage
            width: 80
            fillMode: Image.PreserveAspectFit
            source: "qrc:/qt/qml/GrayScaleImage/Qtlogo.png"
        }

        ShaderEffect {
            id: shaderEffect
            width: sourceImage.width
            height: sourceImage.height
            property var source: sourceImage
            property real redChannel: 0.5
            NumberAnimation on redChannel {
                running: true
                loops: -1
                from: 0.5; to: 1
                duration: 1000
                easing.type: Easing.InOutQuad
            }

            fragmentShader: "qrc:/redshader.frag.qsb"
        }
    }
}
