import QtQuick 2.15
import QtQuick.Window 2.15
import Qt5Compat.GraphicalEffects


Image {
    property bool trigger: false
    property int currentSpeed: 0
    property int oldSpeed: 0
    id: dash_speed
    source: "/res/dash_speed.png"
    width: 544
    height: 544
    fillMode: Image.PreserveAspectFit


    Image {
        visible: false
        height: 220
        width: 30
        id: red_needle
        source: "/res/dash_red.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        rotation : 223 //0 mph = 223,260 mph = 135, 130 mph = 0

        Behavior on rotation{
        NumberAnimation { duration: 2000; }
        }


    }

    Rectangle{
        id: red_middle
        color: "#CA0000"
        border.color: "darkRed"
        border.width: 2
        height: 75
        width: 75
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        radius: 75


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
        id: getSpeed
        interval: 2000; running: true; repeat: true
        onTriggered:{
            trigger = !trigger
            rotate(dash_speed.currentSpeed)
            }
        }


    function rotate(speed){
        let newAngle = 0;
        let multi = (272.0/260.0)
        //change of speed to change in angle
        newAngle = (speed - dash_speed.oldSpeed) * multi;

        //if angle crosses 360 treshold:


        red_needle.rotation += newAngle


        dash_speed.oldSpeed = speed
    }
}



