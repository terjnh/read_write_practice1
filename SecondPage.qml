import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    id: page2
    Column {
        id: column
        x: 163
        width: 580
        height: 50
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter

        Label {
            id: label
            text: qsTr("Open Directory  ->  Read from a file  ->  Display Data")
            font.pointSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Column {
        id: column1
        y: 74
        width: 200
        height: 400
        anchors.left: parent.left
        anchors.leftMargin: 30
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.25;height:480;width:640}D{i:1;anchors_y:93}D{i:3;anchors_x:31}
}
##^##*/
