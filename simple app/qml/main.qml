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
    title: qsTr("Shotcut Preset Generator")

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
            text: qsTr("Some text")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

        }
    }

    TextField {
        id: property_input
        anchors.bottom: some_input.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
        placeholderText: qsTr("Property Value (edit text to update property)")

        Component.onCompleted: text = backend.data // get data from backend property (data)
        onTextEdited:  backend.data = text // update backend property (data)

    }

    TextField {
        id: some_input
        anchors.bottom: button.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
        placeholderText: qsTr("Enter some text and press <Callback>")
    }

    Button {
        id: button
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter : parent.horizontalCenter 
        text: "Callback"
        // call the callback medthod in the backend
        onClicked: backend.my_callback(some_input.text)
    }

    Connections {
            // Setup the backend
            target: backend
            // property to read/write from backend.
            property string data

            // handler for the mysignal signal
            function onMysignal(msg) {
                console.info("mysignal received: "+msg)
                signal_label.text = msg
            }

    }

}


