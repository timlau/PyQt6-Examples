import QtQuick 6.0
import QtQuick.Window 6.0
import QtQuick.Controls 6.0
import QtQuick.Controls.Material 6.0
import QtQuick.Layouts 6.0


ApplicationWindow {
    id: window
    width: 700
    height: 600
    visible: true
    title: qsTr("Simple Application")

    flags: Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint | Qt.CustomizeWindowHint | Qt.Dialog | Qt.WindowTitleHint

    Material.theme: Material.System
    Material.accent: Material.Red


    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
        height: 30
        radius: 5
        color: Material.color(Material.Red)
        Label {
            id: signal_label
            text: qsTr("This is some text")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

        }
    }


    Connections {
            // Setup the backend
            target: backend
    }

}


