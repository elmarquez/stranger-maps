
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
    id: aSecretLabMapPage

    property string portalUrl: "https://www.arcgis.com/home/webmap/viewer.html?webmap=";
    property string itemID: "fe852181a7884208bdd15f29a8e36e66"

    MapView {
        anchors.fill: parent

        Map {
            id: gameMap
            initUrl: portalUrl + itemID
            onLoadStatusChanged: {}
        }
    }

}
