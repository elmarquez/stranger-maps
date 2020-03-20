import QtGraphicalEffects 1.12
import QtMultimedia 5.11
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls.Material 2.1
import QtPositioning 5.3

/**
 * Application settings page provides controls over application behavior.
 */
Page {

    property real textHeight: app.scaleFactor * 14

    id: settingsPage

    ColumnLayout {
        anchors.fill: parent
        id: settingsPageLayout
        spacing: 10

        Layout.preferredWidth: app.width

        TextInput { text: "Some text"; font.preferShaping: false }

        TextInput { text: "Some text"; font.preferShaping: false }

        TextInput { text: "Some text"; font.preferShaping: false }

        TextInput { text: "Some text"; font.preferShaping: false }

    }

    Button {
        id: settingsSaveButton
        onClicked: appStackView.pop()
        text: "Save"
    }

}