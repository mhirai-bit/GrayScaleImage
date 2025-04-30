import QtQuick
import QtQuick.Particles

Rectangle {
    width: 640; height: 480
    color: "gray"

    ParticleSystem {
        id: particleSystem
    }

    Emitter {
        id: emitter
        anchors.fill: parent
        emitRate: 100
        lifeSpan: 1500
        lifeSpanVariation: 500
        size: 16
        endSize: 32
        sizeVariation: 10
        system: particleSystem
        velocity: AngleDirection {
            id: angleDirection
            angle: 0
            angleVariation: 15
            magnitude: 100
            magnitudeVariation: 50
        }
    }

    ImageParticle {
        source: "qrc:/qt/qml/GrayScaleImage/particle.png"
        system: particleSystem
        color: "#FFD700"
        colorVariation: 0.2
        rotation: 15
        rotationVariation: 5
        rotationVelocity: 45
        rotationVelocityVariation: 15
        entryEffect: ImageParticle.Scale
    }

    MouseArea {
        anchors.fill: parent

        property point pressedPoint: Qt.point(0, 0)
        property point releasedPoint: Qt.point(0, 0)

        onPressed: (mouse) => {
            console.log("onPressed")
            pressedPoint = Qt.point(mouse.x, mouse.y)
        }

        onReleased: (mouse) => {
            console.log("onReleased")
            releasedPoint = Qt.point(mouse.x, mouse.y)
            const dx = releasedPoint.x - pressedPoint.x
            const dy = releasedPoint.y - pressedPoint.y
            console.log("dx:", dx, "dy:", dy)

            let angle = Math.atan2(dy, dx) * 180 / Math.PI
            console.log("angle:", angle)
            if (angle < 0) {
                angle += 360
            }
            console.log("adjusted angle:", angle)

            const magnitude = Math.sqrt(dx * dx + dy * dy)
            console.log("magnitude:", magnitude)

            angleDirection.angle = angle
            angleDirection.magnitude = magnitude
        }
    }
}
