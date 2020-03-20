
import QtQuick 2.13
import QtQuick.Controls 2.13

/**
 * "Will Byers" game scenario.
 */
Page {

    id: willByersPage

    Text {
        color: "red"
        font.family: "Helvetica"
        font.pointSize: 24
        text: "Will Byers"
    }

    Button {
        onClicked: appStackView.pop()
        text: "Go Back"
    }

}