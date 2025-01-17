import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls.Material 2.13
import QtPositioning 5.3
import QtSensors 5.3


import Esri.ArcGISRuntime 100.6


RoundButton{
    property url imageSource: ""
    signal iconClicked()
    id:homeButton

    radius: 30 * scaleFactor
    width: 60 * scaleFactor
    height:width
    Material.elevation: 3
    Material.background: "#8f499c"

    Image{
        id:image
        source:imageSource
        height:24 * scaleFactor
        width: 24 * scaleFactor
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            iconClicked();
        }
    }
}

