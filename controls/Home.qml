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
    id: homePage

    property real textHeight: app.scaleFactor * 14

    StackView.onActivated: {
        console.log('application home activated');
        themeSong.play();
    }
    StackView.onDeactivated: {
        console.log('application home deactivated');
        themeSong.stop();
    }

    Image {
        id: strangerThingsTitleImage

        fillMode: Image.PreserveAspectFit
        source: "../assets/titles/stranger-things-background.png"
        sourceSize.height: app.height
        sourceSize.width: app.width
    }

    ColumnLayout {
        id: homePageMenuLayout

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: homePage.textHeight * 5

        Layout.preferredWidth: app.width

        Image {
            id: willByersMenuOption

            antialiasing: true
            fillMode: Image.PreserveAspectFit
            smooth: true
            source: "../assets/labels/will-byers.svg"
            sourceSize.height: homePage.textHeight * 1.5

            Layout.alignment: Qt.AlignHCenter;

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    appStackView.push("./will-byers/View.qml")
                }
            }
        }

        Image {
            id: secretLabMenuOption

            fillMode: Image.PreserveAspectFit
            smooth: true
            source: "../assets/labels/a-secret-lab.svg"
            sourceSize.height: homePage.textHeight * 1.5

            Layout.alignment: Qt.AlignHCenter;

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    appStackView.push("./a-secret-lab/View.qml")
                }
            }
        }

        Image {
            id: theRussiansMenuOption

            fillMode: Image.PreserveAspectFit
            smooth: true
            source: "../assets/labels/the-russians.svg"
            sourceSize.height: homePage.textHeight * 1.5

            Layout.alignment: Qt.AlignHCenter;

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    appStackView.push("./placeholder.qml")
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
        id: settingsLabel

        anchors.bottom: parent.bottom
        anchors.bottomMargin: homePage.textHeight * 6
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        smooth: true
        source: "../assets/labels/settings.svg"
        sourceSize.height: homePage.textHeight

        MouseArea {
            anchors.fill: parent
            onClicked: {
                    appStackView.push("./placeholder.qml")
            }
        }
    }

    states: [
        State {
            name: "title1"
            PropertyChanges {
                target: strangerThingsTitleImage
                x: -100
            }
        },
        State {
            name: "title2"
            PropertyChanges {
                target: strangerThingsTitleImage
                x: 0
            }
        },
        State {
            name: "title3"
            PropertyChanges {
                target: strangerThingsTitleImage
                x: 100
            }
        }
    ]

    transitions: []

}