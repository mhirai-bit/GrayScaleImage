import QtQuick
import QtQuick.Controls

Item {
    width: 640
    height: 480

    Slider {
        id: remainingBatterySlider
        width: parent.width/3
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 30
        }
        from: 0
        to: 1
    }

    Rectangle {
        width: parent.width/3
        height: parent.height/1.5
        border.width: 4
        border.color: "darkgray"
        radius: 8
        anchors {
            top: remainingBatterySlider.bottom
            topMargin: 48
            horizontalCenter: remainingBatterySlider.horizontalCenter
        }

        layer.enabled: true
        layer.samplerName: "maskSource"
        layer.effect: ShaderEffect {
            property var colorSource: gradientColorSource
            fragmentShader: "qrc:/battery.frag.qsb"
        }

        Rectangle {
            id: gradientColorSource
            visible: false // this should be invisible
            width: 10; height: 10
            color: "blue"
            layer.enabled: true
            layer.smooth: true
            gradient: Gradient {
                GradientStop {
                    color: "black"
                    position: 0
                }
                GradientStop {
                    color: "green"
                    position: remainingBatterySlider.value
                }
            }
        }
    }
}
