import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Stack App")

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: qsTr("<")
                onClicked: stackView.pop()
            }  //ToolButton
            Label {
                text: "Read Write Practice App"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
        }
    }

    StackView {
        id: stackView
        initialItem: start_page

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
    }

    Component {
        id: start_page
        StartingPage {}
    }

    Component {
        id: second_page
        SecondPage {}
    }

    Component {
        id: third_page
        ThirdPage {}
    }

    function load_page(page) {
        switch(page) {
        case 'Start Page':
            stackView.push(start_page);
            break;
        case 'Read File':
            stackView.push(second_page);
            break;
        case 'Page 3':
            stackView.push(third_page);
            break;
        }
    }


}
