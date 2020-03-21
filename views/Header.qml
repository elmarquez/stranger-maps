import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

import ArcGIS.AppFramework 1.0

RowLayout {
    anchors.fill: parent
    clip: true
    spacing: 0

    Rectangle {
        Layout.preferredWidth: 50 * scaleFactor
    }

    Text {
        color: "white"
        elide: Text.ElideRight
        font.bold: true
        font.pixelSize: app.baseFontSize * 1.1
        maximumLineCount: 2
        text: app.info.title
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        Layout.alignment: Qt.AlignCenter
    }

    Rectangle {
        id:infoImageRect

        Layout.alignment: Qt.AlignRight
        Layout.preferredWidth: 50*scaleFactor

        ToolButton {
            id:infoImage
            indicator: Image{
                width: 30 * scaleFactor
                height: 30 * scaleFactor
                anchors.centerIn: parent
                source: "../assets/info.png"
                fillMode: Image.PreserveAspectFit
                mipmap: true
            }
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            onClicked: {
                descPage.visible = 1
            }
        }
    }
}





