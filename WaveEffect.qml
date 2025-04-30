import QtQuick

Rectangle {
    width: 480; height: 240
    color: "#1e1e1e"

    Row {
        anchors.centerIn: parent
        spacing: 20

        // JapaneseFlag {
        //     width: 160; height: 80
        //     id: sourceImage
        // }

        // Image {
        //     id: sourceImage
        //     width: 160; height: width
        //     source: "qrc:/qt/qml/GrayScaleImage/Qtlogo.png"
        // }

        Image {
            id: sourceImage
            width: 240; height: 160
            source: "qrc:/qt/qml/GrayScaleImage/dogeFlag.jpg"
        }

        ShaderEffect {
            width: sourceImage.width; height: sourceImage.height
            property var source: sourceImage
            property real frequency: 8
            property real amplitude: 0.02
            property real time: 0.0
            NumberAnimation on time {
                from: 0; to: Math.PI*2
                duration: 1000
                loops: -1
            }
            fragmentShader: "qrc:/myWave.frag.qsb"
        }
    }
}
