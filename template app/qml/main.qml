import QtQuick
import QtQuick.Controls.Fusion


ApplicationWindow {
    id: window
    width: 700
    height: 600
    visible: true
    title: qsTr("Simple Application")

    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
        height: 30
        radius: 5
        color: "#ff0000"
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


