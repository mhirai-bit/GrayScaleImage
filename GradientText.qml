import QtQuick

Text {
    id: gradientText
    font.pixelSize: 48
    text: "Gradient Text"
    layer.enabled: true
    layer.samplerName: "maskSource"
    layer.effect: ShaderEffect {
        // property var colorSource: Rectangle {
        //     width: 10; height: 10
        //     gradient: Gradient {
        //         GradientStop { position: 0; color: "white" }
        //         GradientStop { position: 1; color: "steelblue" }
        //     }
        //     visible: false
        //     layer.enabled: true
        //     layer.smooth: true
        // }
        property var colorSource: gradientRect
        fragmentShader: "qrc:/mask.frag.qsb"
    }
    Rectangle {
        id: gradientRect;
        width: 10
        height: 10
        gradient: Gradient {
            GradientStop { position: 0; color: "black" }
            GradientStop {
                id: stop1
                position: 1
                color: "steelblue"
            }
        }
        visible: false; // should not be visible on screen.
        layer.enabled: true;
        layer.smooth: true

        SequentialAnimation {
            running: true
            loops: Animation.Infinite
            NumberAnimation {
                target: stop1
                property: "position"
                duration: 1000
                easing.type: Easing.InOutQuad
                from: 0; to: 1
            }

            NumberAnimation {
                target: stop1
                property: "position"
                duration: 1000
                easing.type: Easing.InOutQuad
                from: 1; to: 0
            }
        }
    }
}
