
import QtGraphicalEffects 1.12
import QtMultimedia 5.11
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

/**
 * Will Byers game scenario.
 */
Page {
    id: willByersIntroPage

    header: Rectangle {
        id: headerBar

        color: "#0B0B0B"
        height: 42
        width: willByersIntroPage.width

        Image {
            id: backArrow

            antialiasing: true
            source: "../../assets/icons/boxicons/regular/bx-left-arrow-alt.svg"
            sourceSize.height: 36
            visible: false
            x: 16
            y: 6
        }

        ColorOverlay {
            anchors.fill: backArrow
            antialiasing: true
            source: backArrow
            color: "red"
            transform: rotation

            MouseArea {
                anchors.fill: parent
                onClicked: appStackView.pop()
            }
        }
    }

    //--------------------------------------------------------------------------

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#0B0B0B" }
            GradientStop { position: 0.33; color: "#1E1E1E" }
            GradientStop { position: 1.0; color: "#0B0B0B" }
        }
    }

    Video {
        id: willByersOpeningVideo

        autoPlay: true
        fillMode: VideoOutput.PreserveAspectCrop
        height : app.height
        // onPlaying: console.log('video playing')
        // onPaused: console.log('video paused')
        // onStopped: console.log('video stopped')
        source: "../../assets/videos/willbyers-intro.mp4"
        width : app.width
        x: 0
        y: 0
    }

}
