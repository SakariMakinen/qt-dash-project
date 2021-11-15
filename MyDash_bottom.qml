import QtQuick 2.0

Rectangle {

    id: dashBottom
    border.width: 5;
    border.color: "#3B4358"
    width: 600
    height: 100
    color: "#2F3646"
    z:4
    radius: 250

    Image {
        visible: true
        height: 40
        width: 45
        id: motorLight
        source: "/res/engineLight.png"
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        z:2
        anchors.leftMargin: 160
    }

    Image {
        visible: true
        height: 40
        width: 45
        id: tempLight
        source: "/res/engineTemp.png"
        anchors.left: motorLight.right
        anchors.verticalCenter: parent.verticalCenter
        z:2
        anchors.leftMargin: 30
    }

    Image {
        visible: true
        height: 40
        width: 45
        id: brakeLight
        source: "/res/handBrake.png"
        anchors.left: tempLight.right
        anchors.verticalCenter: parent.verticalCenter
        z:2
        anchors.leftMargin: 30

    }

    Image {
        visible: true
        height: 40
        width: 55
        id: keyLight
        source: "/res/keyLight.png"
        anchors.left: brakeLight.right
        anchors.verticalCenter: parent.verticalCenter
        z:2
        anchors.leftMargin: 30

    }
    Timer {

        interval: 3000; running: true; repeat: true
        onTriggered:{
            keyLight.visible = !keyLight.visible;
            brakeLight.visible = !brakeLight.visible;
            tempLight.visible = !tempLight.visible;
            motorLight.visible = !motorLight.visible;
        }
    }

 }
