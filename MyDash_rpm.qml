import QtQuick 2.15
import QtQuick.Window 2.15
import Qt5Compat.GraphicalEffects

Image {
    property bool trigger: false
    property int currentRpm: 0
    property int oldRpm: 0

    id: dash_rpm
    source: "/res/dash_rpm.png"
    width: 545
    height: 545
    fillMode: Image.PreserveAspectFit

    Image {
        visible: false
        height: 220
        width: 30
        id: red_needle
        source: "/res/dash_red.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        z:2
        transformOrigin: Item.Bottom
        rotation : 235
        Behavior on rotation{
        NumberAnimation { duration: 700; }
        }

    }

    Rectangle{
        visible: false
        id: red_middle
        color: "#CA0000"
        border.color: "darkRed"
        border.width: 2
        height: 75
        width: 75
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        radius: 75
        z:3


    }

    DropShadow {
        anchors.fill: red_needle
        horizontalOffset: 3
        verticalOffset: 3
        radius: 3
        color: "#80000000"
        source: red_needle
        rotation: red_needle.rotation
        transformOrigin: Item.Bottom
    }

    DropShadow {
        anchors.fill: red_middle
        horizontalOffset: 3
        verticalOffset: 3
        radius: 3
        color: "#80000000"
        source: red_middle
    }



    Timer {
        id: getRpm
        interval: 700; running: true; repeat: true
        onTriggered:{
            trigger = !trigger
            rotate(dash_rpm.currentRpm)
            }
        }

    function rotate(rpm){
        let newAngle = 0;
        let multi = (250.0/8000.0)
        //change of speed to change in angle
        newAngle = (rpm - dash_rpm.oldRpm) * multi;

        red_needle.rotation += newAngle


        dash_rpm.oldRpm = rpm
    }
}





