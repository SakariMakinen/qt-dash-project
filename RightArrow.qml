import QtQuick 2.0

Rectangle {

    id: rightArrowBackground
    color: "#2F3646"
    height: 80
    width: 120

    Rectangle {
        id: rec1
        rotation: 45
        height: 40
        width: 40
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "#232835"
        z: 2
    }

    Rectangle {
        id: rec2

        height: 60
        width: 40
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 25
        color: "#2F3646"
        z: 3
    }

    Rectangle {
        id: rec3

        height: 15
        width: 40
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 15
        color: "#232835"
        z: 4
    }


    Timer {

        interval: 500; running: true; repeat: true
        onTriggered:{
            // @disable-check M126
            if(rec3.color == "#232835"){
                rec3.color = "yellow"
                rec1.color = "yellow"
            } else {
                rec3.color = "#232835"
                rec1.color = "#232835"
            }
        }
    }



}
