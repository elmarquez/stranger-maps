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

    // Events


    // Application home page displays the list of game missions and a button for
    // the settings menu. It has an animated background consisting of the
    // "Stranger Maps" title and plays the theme music. When the user clicks a
    // menu option, the screen transitions to the next view.
    Loader {
        anchors.fill: parent
        id: pageLoader
        onLoaded: themeSong.play()
        sourceComponent: homePage
    }

    Page {
        anchors.fill: parent
        id: homePage
        title: "Stranger Maps"

        contentItem: Rectangle {
            color: '#0A0A0A'
        }
    }

    SoundEffect {
        id: themeSong
        source: "assets/audio/theme.wav"
        volume: 0.5
    }

    Controls.DescriptionPage{
        id:descPage
        visible: false
    }
}

//------------------------------------------------------------------------------
