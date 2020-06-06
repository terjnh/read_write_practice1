import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.0

// From C++
import FileHandling 1.0

Item {
    id: page2

    signal qml_signal

    /*** When openFile() signal is emited from QML,
            onOpenFile SLOT in QML will handle the connection to
            openFile() SLOT in C++ class (filehandling.h)  ***/
    onQml_signal: {
        file_handling.openFile();
    }



    FileHandling {
        id: myFile
        source: "my_file.txt"
        onError: console.log(msg)
    }




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
        id: colButtons
        y: 74
        width: 150
        height: 400
        spacing: 12
        anchors.left: parent.left
        anchors.leftMargin: 30

        Button {
            id: btnOpenFile
            width: 120
            height: 60
            text: qsTr("Open File")
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                page2.qml_signal()
                console.log("Open File button clicked");
                fileDialog.visible = true;
            }
        }  //Button (id: btnOpenFile)

        Button {
            id: btnJsonEg
            width: 120
            height: 60
            text: qsTr("Json Example")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                var JsonString = '{"a":"A whatever, run","b":"B fore something happens"}';
                var JsonObject= JSON.parse(JsonString);

                //retrieve values from JSON again
                var aString = JsonObject.a;
                var bString = JsonObject.b;

                console.log(aString);
                console.log(bString);
            }
        }  //Button (id: btnJsonEg)

        Button {
            id: btnFileHandle
            width: 120
            height: 60
            anchors.horizontalCenter: parent.horizontalCenter
            text: "FileHandle\nC++"
            onClicked: {
                console.log("WRITE" + myFile.write("Testing.. 1.. 2.. 3\nTest New Line"));
                textareaRead.text = myFile.read();
            }
        }
    }  //Column (id: colButtons)




    FileDialog {
        id: fileDialog
        title: "Please choose a file... "
        folder: shortcuts.home
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)
            Qt.quit();
        }
        onRejected: {
            console.log("Cancelled");
            Qt.quit();
        }
    }






    Column {
        id: colDisplay
        x: 186
        y: 80
        width: 200
        height: 400
        anchors.horizontalCenter: parent.horizontalCenter

        TextArea {
            id: textareaRead
            width: 180
            height: 300
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Text from my_file.txt will be displayed here")
            text: ""
        }
    }





}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.25;height:480;width:640}D{i:1;anchors_y:93}D{i:3;anchors_x:31}
D{i:9;anchors_x:186}
}
##^##*/
