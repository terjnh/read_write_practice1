import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    id: page2
    Column {
        id: column
        x: 163
        y: 93
        width: 161
        height: 87
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Label {
            id: label
            text: qsTr("This is page 2")
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/