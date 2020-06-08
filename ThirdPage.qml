import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2

// From C++
import FileHandling 1.0


Item {
    id: page3


    // Change file save directory here
    FileHandling {
        id: fileHandle
        source: "/home/terry/Desktop/" + tfFileName.text
        onError: console.log(msg)
    }


    Popup {
        id: savePopup
        anchors.centerIn: parent
        width: 280; height: 120
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        Column{
            anchors.fill: parent
            spacing: 30
            Label {
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text: "File saved in: \n" + fileHandle.source;
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Close"
                onClicked: savePopup.close()
            }
        }
    } //Popup (id: savePopup)


    Column {
        id: colHeader
        x: 60
        width: 535
        height: 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 24

        Label {
            id: label
            text: qsTr("IO Page - Read / Write")
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Column {
        id: colText
        width: 398
        height: 350
        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.left: parent.left
        anchors.leftMargin: 20

        TextArea {
            id: textArea
            anchors.fill: parent
            anchors.margins: 1
            placeholderText: qsTr("Write some text here")
        }

    }

    Column {
        id: colButtons
        x: 409
        y: 80
        width: 200
        height: 380
        spacing: 10
        anchors.leftMargin: 15
        anchors.top: colText.top
        anchors.left: colText.right
        anchors.bottom: colText.bottom

        Label {
            id: lblFileNameInput
            text: "File Name for Read / Write:"
        }

        TextField {
            id: tfFileName
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Rmb to add .txt")
        }

        // Button to Save File
        Button {
            id: btnSave
            width: 110
            height: 50
            text: qsTr("Save")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                fileHandle.write(textArea.text)
                savePopup.open()
            }
        }  //Button (id: btnSave)

        // Button to Open File
        Button {
            id: btnOpen
            width: 110
            height: 50
            text: qsTr("Open")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                textArea.text = fileHandle.read()
            }
        }

        Button {
            id: btnJson
            width: 110
            height: 56
            text: "Interpret from\nJSON"
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_y:93}D{i:3;anchors_height:399;anchors_x:0;anchors_y:80}
}
##^##*/
