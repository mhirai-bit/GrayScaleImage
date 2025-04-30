import QtQuick

Item {
    id: root
    width: background.width; height: background.height

    Rectangle {
        id: background
        anchors.centerIn: parent
        width: 640; height: 480
        color: "black"
    }

    Text {
        anchors.centerIn: parent
        font.pixelSize: 48
        color: "#efefef"
        text: "Qt 6 Book"
    }

    CurtainEffect {
        id: curtain
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            curtain.open = !curtain.open
            console.log("curtain clicked")
        }
    }
}
