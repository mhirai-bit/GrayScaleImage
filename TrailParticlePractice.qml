import QtQuick
import QtQuick.Particles

Item {
    width: 500; height: 500

    Rectangle {
        id: gaugeBackground
        anchors.fill: parent
        radius: width/2
        color: "gray"

        Rectangle {
            id: needle
            height: parent.height/2
            width: 10
            color: "blue"
            anchors.horizontalCenter: parent.horizontalCenter
            transformOrigin: Item.Bottom
            RotationAnimation {
                running: true; target: needle
                from: 130; to: -130
                duration: 4000; loops: Animation.Infinite
            }
            // 1) Seed emitter: spits out logical particles at the needle tip
            Emitter {
                system: particleSystem
                group: "needle"                     // ← name this group “needle”
                emitRate: 500                       // 100 particles/sec
                lifeSpan: 500                      // each lives 500 ms
                size: 10                             // size=0 makes them invisible
                // anchors.fill: parent
                height: needle.height * 0.5
            }
            Emitter {
                system: particleSystem
                group: "needle"                     // ← name this group “needle”
                emitRate: 200                       // 100 particles/sec
                lifeSpan: 300                      // each lives 500 ms
                size: 50                             // size=0 makes them invisible
                // anchors.fill: parent
                height: needle.height * 0.9
            }
        }
    }

    ParticleSystem { id: particleSystem }

    // 2) Trail emitter: follows every “needle” particle
    TrailEmitter {
        system: particleSystem
        follow: "needle"                    // ← must match the Emitter’s group
        emitWidth:  10
        emitHeight: 10
        velocityFromMovement: 10
        emitRatePerParticle: 20             // 20 trail‐particles per “needle” particle/sec
        lifeSpan: 800                      // how long each trail‐particle lasts
        size: 8; endSize: 0                 // trail shrinks to 0
    }

    // 3) Painter: draws each logical particle as an image
    ImageParticle {
        system: particleSystem
        source: "qrc:/qt/qml/GrayScaleImage/particle.png"
        // source: "qrc:/qt/qml/GrayScaleImage/doge.jpg"
    }
    // ImageParticle {
    //     system: particleSystem
    //     // source: "qrc:/qt/qml/GrayScaleImage/particle.png"
    //     source: "qrc:/qt/qml/GrayScaleImage/doge.jpg"
    // }
}
