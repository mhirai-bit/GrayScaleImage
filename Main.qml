import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    SwipeView {
        anchors.fill: parent
        Item {
            width: 640
            height: 480
            Row {
                anchors.fill: parent
                spacing: 20
                Image {
                    id: img
                    width: 200
                    fillMode: Image.PreserveAspectFit
                    source: "Qtlogo.png"
                }
                ShaderEffect {
                    width: img.width
                    height: img.height
                    property variant src: img
                    vertexShader: "qrc:/myeffect.vert.qsb"
                    fragmentShader: "qrc:/myeffect.frag.qsb"
                }
            }
        }
        Item {
            width: 640
            height: 480
            GradientText {
                anchors.centerIn: parent
            }
        }
        BatteryScreen {}
        GridMeshTest {}
    }
}
