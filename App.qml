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
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.13
import QtPositioning 5.3
import QtSensors 5.3

import ArcGIS.AppFramework 1.0
import Esri.ArcGISRuntime 100.3

//------------------------------------------------------------------------------

App {
    id: app
    height: 736
    width: 414

    function units(value) {
        return AppFramework.displayScaleFactor * value
    }
    property real scaleFactor: AppFramework.displayScaleFactor
    property int baseFontSize : app.info.propertyValue("baseFontSize", 15 * scaleFactor) + (isSmallScreen ? 0 : 3)
    property bool isSmallScreen: (width || height) < units(400)

    //--------------------------------------------------------------------------

    Rectangle {
        anchors.fill: app
        color: "#0B0B0B"
    }

    StackView {
        id: appStackView

        property int transitionDuration: 650

        anchors.fill: app
        initialItem: "views/Home.qml"
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

    Audio {
        id: themeSong

        autoLoad: true
        autoPlay: true
        loops: SoundEffect.Infinite
        source: "assets/audio/theme.wav"
        volume: 0.3
    }

}
