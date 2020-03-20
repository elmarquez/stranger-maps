import QtGraphicalEffects 1.12
import QtMultimedia 5.11
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls.Material 2.1
import QtPositioning 5.3

/**
 * Application home page displays the list of game missions and a button for
 * the settings menu. It has an animated background consisting of the
 * "Stranger Maps" title and plays the theme music once loaded. When the
 * player clicks a menu option, the screen transitions to the next view.
 */
Page {
    property real textHeight: app.scaleFactor * 14

    id: homePage

    Image {
        fillMode: Image.PreserveAspectFit
        id: strangerThingsTitleImage
        source: "../assets/titles/stranger-things-background.png"
        sourceSize.height: app.height
        sourceSize.width: app.width
    }

    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        // anchors.top: parent.top
        // anchors.topMargin: app.height * 0.35
        anchors.verticalCenter: parent.verticalCenter
        id: homePageMenuLayout
        spacing: homePage.textHeight * 5

        Layout.preferredWidth: app.width

        Image {
            fillMode: Image.PreserveAspectFit
            id: willByersMenuOption
            smooth: true
            source: "../assets/labels/will-byers.svg"
            sourceSize.height: homePage.textHeight * 1.5
            // visible: false

            Layout.alignment: Qt.AlignHCenter;

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    appStackView.push("./scenarios/WillByers.qml")
                }
            }
        }

        Image {
            fillMode: Image.PreserveAspectFit
            id: secretLabMenuOption
            smooth: true
            source: "../assets/labels/a-secret-lab.svg"
            sourceSize.height: homePage.textHeight * 1.5
            // visible: false

            Layout.alignment: Qt.AlignHCenter;

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    appStackView.push("./scenarios/ASecretLab.qml")
                }
            }

        }
        Image {
            fillMode: Image.PreserveAspectFit
            id: theRussiansMenuOption
            smooth: true
            source: "../assets/labels/the-russians.svg"
            sourceSize.height: homePage.textHeight * 1.5
            // visible: false

            Layout.alignment: Qt.AlignHCenter;

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    appStackView.push("./scenarios/TheRussians.qml")
                }
            }

        }
        
        // DropShadow {
        //     anchors.fill: willByersMenuOption
        //     color: "#80000000"
        //     horizontalOffset: 3
        //     radius: 8.0
        //     samples: 17
        //     source: willByersMenuOption
        //     verticalOffset: 3
        // }

        // DropShadow {
        //     anchors.fill: secretLabMenuOption
        //     color: "#80000000"
        //     horizontalOffset: 3
        //     radius: 8.0
        //     samples: 17
        //     source: secretLabMenuOption
        //     verticalOffset: 3
        // }

        // DropShadow {
        //     anchors.fill: theRussiansMenuOption
        //     color: "#80000000"
        //     horizontalOffset: 3
        //     radius: 8.0
        //     samples: 17
        //     source: theRussiansMenuOption
        //     verticalOffset: 3
        // }

    }

    Image {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: homePage.textHeight * 6
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        id: settingsLabel
        smooth: true
        source: "../assets/labels/settings.svg"
        sourceSize.height: homePage.textHeight

        MouseArea {
            anchors.fill: parent
            onClicked: {
                    appStackView.push("./Settings.qml")
            }
        }

    }

}