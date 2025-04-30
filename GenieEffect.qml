import QtQuick

Rectangle {
    width: 480; height: 240
    color: "#1e1e1e"

    Image {
        id: sourceImage
        width: 160; height: width
        source: "qrc:/qt/qml/GrayScaleImage/doge.jpg"
        visible: false
    }
    Rectangle {
        width: 160; height: width
        anchors.centerIn: parent
        color: "#333333"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("clicked")
                genieEffect.minimized = !genieEffect.minimized
            }
        }
    }
    ShaderEffect {
        id: genieEffect
        width: 160; height: width
        anchors.centerIn: parent
        property var source: sourceImage
        property real bend: 0.0
        property bool minimized: false
        property real minimize: 0.0
        property real side: 0.5
        vertexShader: "qrc:/genie.vert.qsb"
        mesh: GridMesh { resolution: Qt.size(20,20) }
        MouseArea {
            anchors.fill: parent
            onClicked: genieEffect.minimized = !genieEffect.minimized
        }
        ParallelAnimation {
            id: animMinimize
            running: genieEffect.minimized
            SequentialAnimation {
                PauseAnimation { duration: 300 }
                NumberAnimation {
                    target: genieEffect; property: 'minimize';
                    to: 1; duration: 700;
                    easing.type: Easing.InOutSine
                }
                PauseAnimation { duration: 1000 }
            }
            // adding bend animation
            SequentialAnimation {
                NumberAnimation {
                    target: genieEffect; property: 'bend'
                    to: 1; duration: 700;
                    easing.type: Easing.InOutSine }
                PauseAnimation { duration: 1300 }
            }
        }
    }
}
