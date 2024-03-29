import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Item {
    id: element
    GridView {
        id: myGridView
        width: 120
        height: 240
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 115
        cellWidth: 120
        cellHeight: 60

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.bottom: parent.bottom

        model: ListModel {
            ListElement {
                pageName: "Start Page"
            }
            ListElement {
                pageName: "Reference"
            }
            ListElement {
                pageName: "IO Page"
            }
        }

        delegate: Button {
            id: myButton
            text: pageName
            width: 120
            height: 50
            onClicked: {
                // Retrieve load_page() function from main.qml
                load_page(text);
                console.log("PAGE: " + text);
            }
        }

    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
