import QtQuick 2.0

Item {
    width: 50
    height: 50

    property int itemSize: 40
    property string sourceIcon: "qrc:/images/new svg/volume-up.svg"

    Rectangle {
        id: donateBack
        visible: true
        width: itemSize
        height: itemSize
        color: "#00ffffff"
        radius: donateBack.width / 2
        anchors.centerIn: parent

        Image {
            id: donateImage
            anchors.fill: parent
            source: sourceIcon
            fillMode: Image.Pad

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                enabled: true
                hoverEnabled: true

                onEntered: {
                    isEnteredRadius.running = true
                }

                onExited: {
                    isExitedRadius.running = true
                }

                onClicked: {
                    console.log("was tap")
                    colorAnimation.running = true
                }

                onCanceled: {
                    colorAnimationReverse.running = true
                }
            }
        }
    }

    // Properties: radius and color
    PropertyAnimation {
        id: colorAnimation
        target: donateBack
        properties: "color"
        to: "#37385a"
        duration: 145
    }

    PropertyAnimation {
        id: colorAnimationReverse
        target: donateBack
        properties: "color"
        to: "#00ffffff"
        duration: 145
    }

    PropertyAnimation {
        id: isEnteredRadius
        target: donateBack
        property: "radius"
        to: 14
        duration: 120
    }

    PropertyAnimation {
        id: isExitedRadius
        target: donateBack
        property: "radius"
        to: 8
        duration: 120
    }

}
