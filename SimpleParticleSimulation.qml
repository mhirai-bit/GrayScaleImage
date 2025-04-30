import QtQuick
import QtQuick.Particles

Rectangle {
    id: root
    width: 480; height: 160
    color: "#1f1f1f"

    ParticleSystem {
        id: particleSystem
    }

    Emitter {
        id: emitter
        anchors.centerIn: parent
        width: 160; height: 80
        system: particleSystem
        emitRate: 150
        lifeSpan: 10000
        lifeSpanVariation: 5000
        size: 16
        endSize: 32
    }

    ImageParticle {
        source: "qrc:/qt/qml/GrayScaleImage/particle.png"
        system: particleSystem
    }
}
