
import QtQuick 2.13
import QtQuick.Controls 2.13

/**
 * "The Russians" game scenario.
 */
Page {

    id: theRussiansPage

    Text {
        color: "red"
        font.family: "Helvetica"
        font.pointSize: 24
        text: "The Russians"
    }

    Button {
        onClicked: appStackView.pop()
        text: "Go Back"
    }

}