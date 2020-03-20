/* Copyright 2020 Esri
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */


// You can run your app in Qt Creator by pressing Alt+Shift+R.
// Alternatively, you can run apps through UI using Tools > External > AppStudio > Run.
// AppStudio users frequently use the Ctrl+A and Ctrl+I commands to
// automatically indent the entirety of the .qml file.

import QtGraphicalEffects 1.12
import QtMultimedia 5.11
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls.Material 2.1
import QtPositioning 5.3
import QtSensors 5.3

import ArcGIS.AppFramework 1.0
import Esri.ArcGISRuntime 100.3

import "controls" as Controls

//------------------------------------------------------------------------------

App {
    id: app
    width: 414
    height: 736

    function units(value) {
        return AppFramework.displayScaleFactor * value
    }
    property real scaleFactor: AppFramework.displayScaleFactor
    property int baseFontSize : app.info.propertyValue("baseFontSize", 15 * scaleFactor) + (isSmallScreen ? 0 : 3)
    property bool isSmallScreen: (width || height) < units(400)

    //--------------------------------------------------------------------------
    // Events

    // Loader {
    //     anchors.fill: parent
    //     id: pageLoader
    //     onLoaded: function () {
    //         console.log("page loaded")
    //         themeSong.play()
    //     }
    //     sourceComponent: homePage
    // }

    //--------------------------------------------------------------------------
    // View

    StackView {
        anchors.fill: parent
        id: appStackView
        initialItem: homePage
        popEnter: Transition {
            PropertyAnimation {
                duration: 200
                from: 0
                property: "opacity"
                to: 1
            }
        }
        popExit: Transition {
            PropertyAnimation {
                duration: 200
                from: 1
                property: "opacity"
                to: 0
            }
        }   
        pushEnter: Transition {
            PropertyAnimation {
                duration: 200
                from: 0
                property: "opacity"
                to: 1
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                duration: 200
                from: 1
                property: "opacity"
                to: 0
            }
        }
    }

    // Application home page displays the list of game missions and a button for
    // the settings menu. It has an animated background consisting of the
    // "Stranger Maps" title and plays the theme music once loaded. When the
    // player clicks a menu option, the screen transitions to the next view.
    Page {
        property real textHeight: app.scaleFactor * 14

        id: homePage

        Rectangle {
            id: homePageBackground
            anchors.fill: parent
            // color: "#0B0B0B"
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#0B0B0B" }
                GradientStop { position: 0.33; color: "#1E1E1E" }
                GradientStop { position: 1.0; color: "#0B0B0B" }
            }
        }

        Image {
            fillMode: Image.PreserveAspectFit
            id: strangerThingsTitleImage
            source: "assets/titles/stranger-things-background.png"
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
                source: "assets/labels/will-byers.svg"
                sourceSize.height: homePage.textHeight * 1.5
                // visible: false

                Layout.alignment: Qt.AlignHCenter;
            }

            Image {
                fillMode: Image.PreserveAspectFit
                id: secretLabMenuOption
                smooth: true
                source: "assets/labels/a-secret-lab.svg"
                sourceSize.height: homePage.textHeight * 1.5
                // visible: false

                Layout.alignment: Qt.AlignHCenter;
            }
            Image {
                fillMode: Image.PreserveAspectFit
                id: theRussiansMenuOption
                smooth: true
                source: "assets/labels/the-russians.svg"
                sourceSize.height: homePage.textHeight * 1.5
                // visible: false

                Layout.alignment: Qt.AlignHCenter;
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
            source: "assets/labels/settings.svg"
            sourceSize.height: homePage.textHeight
        }

    }

    // Page {
    //     anchors.fill: parent
    //     id: homePage
    //     title: "Stranger Maps"

    //     contentItem: Rectangle {
    //         color: '#0A0A0A'
    //     }
    // }

    Audio {
        autoLoad: true
        autoPlay: true
        id: themeSong
        loops: SoundEffect.Infinite
        source: "assets/audio/theme.wav"
        volume: 0.5
    }

    Controls.DescriptionPage{
        id:descPage
        visible: false
    }
}

//------------------------------------------------------------------------------
