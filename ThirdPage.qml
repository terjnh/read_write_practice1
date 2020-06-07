import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

Item {
    id: page3
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

        Button {
            id: btnSave
            width: 110
            height: 50
            text: qsTr("Save")
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: btnOpen
            width: 110
            height: 50
            text: qsTr("Open")
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_y:93}D{i:3;anchors_height:399;anchors_x:0;anchors_y:80}
}
##^##*/
