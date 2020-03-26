
import QtGraphicalEffects 1.12
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13
import QtQuick.Layouts 1.13
import QtPositioning 5.3
import QtSensors 5.3

import ArcGIS.AppFramework 1.0
import Esri.ArcGISRuntime 100.2

/**
 * Game play view for the "Secret Lab" scenario.
 */
Page {
    id: aSecretLabGamePage

    property string closeMode: "Close"
    property string compassMode: "Compass"
    property string navigationMode: "Navigation"
    property string onMode: "On"
    property string recenterMode: "Re-Center"
    property string stopMode: "Stop"

    property string currentModeImage:"assets/Stop.png"
    property string currentModeText: stopMode

    StackView.onActivated: themeSong.stop();

    contentItem: Rectangle {
        anchors.bottom: footerTabBar.top
        anchors.top: aSecretLabGamePage.top
        color: "#0B0B0B"

        StackView {
            id: aSecretLabStackView
            property int transitionDuration: 650

            anchors.fill: parent
            initialItem: "./Map.qml"
            popEnter: Transition {
                PropertyAnimation {
                    duration: appStackView.transitionDuration
                    from: 0
                    property: "opacity"
                    to: 1
                }
            }
            popExit: Transition {
                PropertyAnimation {
                    duration: appStackView.transitionDuration
                    from: 1
                    property: "opacity"
                    to: 0
                }
            }   
            pushEnter: Transition {
                PropertyAnimation {
                    duration: appStackView.transitionDuration
                    from: 0
                    property: "opacity"
                    to: 1
                }
            }
            pushExit: Transition {
                PropertyAnimation {
                    duration: appStackView.transitionDuration
                    from: 1
                    property: "opacity"
                    to: 0
                }
            }
        }
    }

    footer: TabBar {
        id: footerTabBar

        property int tabButtonPadding: 24
        background: Rectangle {
            color: "#2B2B2B"
        }
        currentIndex: 1
        width: parent.width

        TabButton {
            background: Rectangle {
                color: "#0B0B0B"
            }
            onClicked: aSecretLabStackView.push('./AR.qml')
            padding: 32
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "../../../assets/icons/ar-view.svg"
                sourceSize.height: 24
                sourceSize.width: 24
            }
        }
        TabButton {
            background: Rectangle {
                color: "#0B0B0B"
            }
            onClicked: aSecretLabStackView.push('./Map.qml')
            padding: 32
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "../../../assets/icons/map-view.svg"
                sourceSize.height: 24
                sourceSize.width: 24
            }
        }
        TabButton {
            background: Rectangle {
                color: "#0B0B0B"
            }
            onClicked: aSecretLabStackView.push('./Chat.qml')
            padding: 32
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "../../../assets/icons/chat-view.svg"
                sourceSize.height: 24
                sourceSize.width: 24
            }
        }
    }

}