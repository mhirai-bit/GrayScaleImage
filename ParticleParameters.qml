import QtQuick
import QtQuick.Particles

Rectangle {
    width: 640; height: 480
    color: "black"

    ParticleSystem {
        id: particleSystem
    }

    Emitter {
        anchors.fill: parent
        emitRate: 100
        lifeSpan: 1500
        lifeSpanVariation: 500
        size: 16
        endSize: 32
        sizeVariation: 10
        system: particleSystem
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
}
