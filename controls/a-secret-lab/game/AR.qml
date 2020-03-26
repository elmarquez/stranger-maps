
import QtGraphicalEffects 1.12
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13
import QtQuick.Layouts 1.13
import QtPositioning 5.3
import QtSensors 5.3

import ArcGIS.AppFramework 1.0
import Esri.ArcGISRuntime 100.2

Page {
    id: aSecretLabARPage

    StackView.onActivated: console.log("game ar activated")
    StackView.onDeactivated: console.log("game ar deactivated")

    Rectangle {
        anchors.fill: parent
        color: "#0B0B0B"

        Image {
            anchors.top: parent.top
            source: "../../../assets/backgrounds/trail-ar.png"
            sourceSize.height: app.height
            sourceSize.width: app.width
        }
    }

}