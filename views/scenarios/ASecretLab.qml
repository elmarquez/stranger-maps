
import QtQuick 2.13
import QtQuick.Controls 2.13

/**
 * "A Secret Lab" game scenario.
 */
Page {

    id: aSecretLabPage

    Text {
        color: "red"
        font.family: "Helvetica"
        font.pointSize: 24
        text: "A Secret Lab"
    }

    Button {
        onClicked: appStackView.pop()
        text: "Go Back"
    }

}