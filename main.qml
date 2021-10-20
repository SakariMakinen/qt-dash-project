import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: backGroundRec
        color: 'black'
        anchors.fill: parent
        z:-1
    }






}
