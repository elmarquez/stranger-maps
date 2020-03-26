
import QtGraphicalEffects 1.12
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

/**
 * "A Secret Lab" game scenario.
 */
Page {
    id: aSecretLabPage

    header: Rectangle {
        id: headerBar

        color: "#0B0B0B"
        height: 42
        width: aSecretLabPage.width

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

    Image { 
        anchors.top: parent.top
        source: "../../assets/backgrounds/secret-lab-red-filter.png"
        sourceSize.width: parent.width
    }
    
    ScrollView {
        anchors.fill: parent
        clip: true
        width: aSecretLabPage.width

        ScrollBar.horizontal.interactive: false

        ColumnLayout {
            property int textMargin: 24

            spacing: 0
            width: app.width

            Text {
                color: "#B3B3B3"
                font.bold: true
                font.capitalization: Font.AllUppercase
                font.family: "Avenir Next"
                font.pointSize: 24
                text: "A Secret Lab?"

                Layout.margins: parent.textMargin
                Layout.preferredWidth: app.width - (parent.textMargin * 2)
                Layout.topMargin: parent.textMargin * 6
            }

            Text {
                color: "#B3B3B3"
                font.family: "Avenir Next"
                font.pointSize: 18
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
                wrapMode: Text.Wrap

                Layout.leftMargin: parent.textMargin
                Layout.preferredWidth: app.width - (parent.textMargin * 2)
                Layout.rightMargin: parent.textMargin
            }

            Button {
                onClicked: appStackView.push('./game/View.qml')
                text: "Start"

                Layout.bottomMargin: parent.textMargin * 2
                Layout.leftMargin: parent.textMargin
                Layout.topMargin: parent.textMargin
            }

        }

    }

}