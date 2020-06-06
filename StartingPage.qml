import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Item {
    id: element
    GridView {
        id: myGridView
        width: 240
        height: 250
        cellWidth: 120
        cellHeight: 50

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.bottom: parent.bottom

        model: ListModel {
            ListElement {
                name: "Page 1"
            }
            ListElement {
                name: "Page 2"
            }
            ListElement {
                name: "Page 3"
            }
        }

        delegate: Button {
            id: myButton
            text: name
            onClicked: {
                // Retrieve load_page() function from main.qml
                load_page(text);
                console.log("text: " + text);
            }
        }

    }
}
