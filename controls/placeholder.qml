import QtGraphicalEffects 1.12
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

/**
 * Placeholder page.
 */
Page {

    id: placeholderPage

    //--------------------------------------------------------------------------

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#0B0B0B" }
            GradientStop { position: 0.33; color: "#1E1E1E" }
            GradientStop { position: 1.0; color: "#0B0B0B" }
        }
    }

    Image {
        id: backArrow

        antialiasing: true
        source: "../assets/icons/boxicons/regular/bx-left-arrow-alt.svg"
        sourceSize.height: 36
        visible: false
        x: 16
        y: 8
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

    ColumnLayout {
        property int textMargin: 24

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 0
        width: app.width

        Text {
            color: "#B3B3B3"
            font.family: "Avenir Next"
            font.pointSize: 18
            horizontalAlignment: Text.AlignHCenter
            text: "This is a placeholder page."
            wrapMode: Text.Wrap

            Layout.leftMargin: parent.textMargin
            Layout.preferredWidth: app.width - (parent.textMargin * 2)
        }

    }

}