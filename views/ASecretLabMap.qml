
import QtGraphicalEffects 1.12
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

import "../controls" as Controls

/**
 * Map view for the "Secret Lab" game scenario.
 */
Page {
    id: aSecretLabMapPage

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
            onClicked: appStackView.pop(null)
        }
    }
    
    Text {
        color: "#B3B3B3"
        font.bold: true
        font.capitalization: Font.AllUppercase
        font.family: "Avenir Next"
        font.pointSize: 24
        text: "A Secret Lab?"

        Layout.margins: parent.textMargin
        Layout.topMargin: parent.textMargin * 2
        Layout.preferredWidth: app.width - (parent.textMargin * 2)
    }

}