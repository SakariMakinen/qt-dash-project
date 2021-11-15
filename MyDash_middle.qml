import QtQuick 2.0

Rectangle {

    id: dashMiddle
    border.width: 0;
    border.color: "#3B4358"
    width: 500
    height: 400
    color: "#2F3646"
    z:1


    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        height: 400
        width: 480
        color: "black"
        border.color: "#232835"
        border.width: 3
        anchors.topMargin: 5

        Text {
            id: dashClock
            text: qsTr("12:00")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 50
            font.pointSize: 32
            color: "grey"
        }

        Text {
            id: dash1Text
            text: qsTr("Gear: ")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 200
            color: "grey"
        }

        Rectangle {
            id: gearRec
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: dash1Text.bottom
            height: 50
            width: 50
            color: "black"

            Text {
                id: gearText
                text: qsTr("D")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                color: "grey"
                font.pointSize: 32
            }
        }

        Text {
            id: dash2Text
            text: qsTr("Fuel: ")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            color: "grey"
        }

        Rectangle {
            id: fuelLeft
            anchors.left: fuelBase.left
            anchors.top: dash2Text.bottom
            anchors.topMargin: 10
            height: 20
            width: 200
            color: "grey"
            z: 3
            Behavior on width {
                NumberAnimation { duration: 500  }
            }
            Timer {
                id: fuelBgone
                interval: 1000; running: true; repeat: true
                onTriggered:{
                        fuelLeft.width -= 5;
                    }
                }
        }

        Rectangle {
            id: fuelBase
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: dash2Text.bottom
            anchors.topMargin: 10
            height: 20
            width: 200
            color: "#232835"
            z: 2
            Behavior on width {
                NumberAnimation {  }
            }
        }

    }

    Timer {
        id: getTime
        interval: 1000*60; running: true; repeat: true
        onTriggered:{
                dashMiddle.getTime();
            }
        }

    Component.onCompleted: dashMiddle.getTime()

    function getTime(){
        let today = new Date();
        let time = ""
        if(today.getMinutes() < 10) {
        time = today.getHours() + " : 0" + today.getMinutes()
        } else {
        time = today.getHours() + " : " + today.getMinutes()
        }

        dashClock.text = time
    }
}
