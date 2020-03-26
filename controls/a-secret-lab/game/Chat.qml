
import QtGraphicalEffects 1.12
import QtMultimedia 5.11
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13
import QtQuick.Layouts 1.13
import QtPositioning 5.3
import QtSensors 5.3

import ArcGIS.AppFramework 1.0
import Esri.ArcGISRuntime 100.2

Page {
    id: aSecretLabChatPage

    StackView.onActivated: {
        willUpsideDownWalkieTalkieAudio.play();
    }
    StackView.onDeactivated: {
        willUpsideDownWalkieTalkieAudio.stop();
    }

    Rectangle {
        anchors.fill: parent
        color: "#0B0B0B"

        Image {
            anchors.top: parent.top
            source: "../../../assets/backgrounds/trc214.svg"
            sourceSize.height: app.height
            sourceSize.width: app.width
        }
    }

    Audio {
        id: willUpsideDownWalkieTalkieAudio

        autoLoad: true
        autoPlay: true
        loops: SoundEffect.Infinite
        source: "../../../assets/audio/will-upside-down.wav"
        volume: 0.3
    }

}
