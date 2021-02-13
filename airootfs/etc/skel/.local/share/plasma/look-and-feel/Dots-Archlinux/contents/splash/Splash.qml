import QtQuick 2.5


Image {
    id: root
    source: "images/background.png"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }


    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Image {
            id: logo
            //match SDDM/lockscreen avatar positioning
            property real size: units.gridUnit * 8

            anchors.centerIn: parent

            source: "images/archlogo.png"

            sourceSize.width: size
            sourceSize.height: size
        }

      AnimatedSprite {
         source: "images/sprite_dots.png"
         frameWidth: 100
         frameHeight: 40
         frameCount: 6
        frameDuration: 300
        interpolate: false
        anchors {
            bottom: parent.bottom
            bottomMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
      }

    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
