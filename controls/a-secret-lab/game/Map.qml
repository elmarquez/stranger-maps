
import QtGraphicalEffects 1.12
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13
import QtQuick.Layouts 1.13
import QtPositioning 5.3
import QtSensors 5.3

import ArcGIS.AppFramework 1.0
import Esri.ArcGISRuntime 100.3

Page {
    id: aSecretLabMapPage

    property string portalUrl: "https://www.arcgis.com/home/webmap/viewer.html?webmap=";
    property string itemID: "fe852181a7884208bdd15f29a8e36e66"

    StackView.onActivated: console.log("game map activated")
    StackView.onDeactivated: console.log("game map deactivated")

    MapView {
        id: gameMapView

        property real initialMapRotation: 0

        anchors.fill: parent
        locationDisplay {
            positionSource: PositionSource {
            }
        }
        rotationByPinchingEnabled: true
        zoomByPinchingEnabled: true
        
        Map {
            id: gameMap

            property int markerScaleFactor: 20

            initUrl: portalUrl + itemID
            onLoadStatusChanged: {}

            FeatureLayer {
                ServiceFeatureTable {
                    url: "https://services6.arcgis.com/XdqyqDLkqtMvP1yd/arcgis/rest/services/stranger_things/FeatureServer/0"
                }
                UniqueValueRenderer {
                    defaultSymbol: SimpleMarkerSymbol {}
                    fieldNames: ['type']

                    UniqueValue {
                        values: ['friend']
                            SimpleMarkerSymbol {
                                style: Enums.SimpleMarkerSymbolStyleCircle
                                color: "#0071bc"
                                size: 8.0 * parent.markerScaleFactor
                            }
                    }
                    UniqueValue {
                        values: ['demogorgon']
                            SimpleMarkerSymbol {
                                style: Enums.SimpleMarkerSymbolStyleSquare
                                color: "yellow"
                                size: 4.0 * parent.markerScaleFactor
                            }
                    }
                    UniqueValue {
                        values: ['story']
                            SimpleMarkerSymbol {
                                style: Enums.SimpleMarkerSymbolStyleCircle
                                color: "#e52d07"
                                size: 4.0 * parent.markerScaleFactor
                            }
                    }
                }
            }
        }

        // GraphicsOverlay {
        //     id: graphicsOverlay
        // }

        // // Markers

        // Point {
        //     id: point1
        //     spatialReference: SpatialReference { wkid: 4326 }
        //     x: 144.979400
        //     y: -37.848080
        // }

        // SimpleMarkerSymbol {
        //     id: pointSymbol
        //     color: "#E52D07"
        //     size: 10
        //     style: Enums.SimpleMarkerSymbolStyleCircle
        // }

        // Graphic {
        //     id: pointGraphic
        //     geometry: point1
        //     symbol: pointSymbol
        // }

        // Component.onCompleted: {
        //     // add a point
        //     graphicsOverlay.graphics.append(pointGraphic);
        // }

        BusyIndicator {
            anchors.centerIn: parent
            height: 48 * app.scaleFactor
            running: true
            visible: (gameMapView.drawStatus === Enums.DrawStatusInProgress)
            width: height
        }

    }

}
