import QtQuick 2.15
import QtQuick.Window 2.15
import Qt5Compat.GraphicalEffects


Window {
    width: 1280
    height: 960
    visible: true
    title: qsTr("QT dash")

    Rectangle {
        id: backGroundRec
        color: 'black'
        anchors.fill: parent
        z:-1
    }

    Rectangle {
        id: dashMain
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50
        opacity: 100
        Rectangle {
            id: dashUpperBack
            color: "#2F3646"
            width: 1200
            height: 480
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            radius: 300
            border.color: "#3B4358"
            border.width: 4;

            MyDash_middle {
                id: dashMiddle
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width: 500
                height: 400
                z:1
            }

            MyDash_bottom {
                id: dashBottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: dashMiddle.bottom

                LeftArrow{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 50
                }

                RightArrow{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 50
                }

            }




            MyDash_rpm{
                id: dashRpm
                anchors.right: parent.right;
                anchors.rightMargin: -37;
                anchors.verticalCenter:  parent.verticalCenter;
                z:2
                onTriggerChanged: {
                    dashRpm.currentRpm = engine.changeRpm(dashRpm.currentRpm)
                }
            }

            MyDash_speed{
                id: dashSpeed
                anchors.left: parent.left;
                anchors.leftMargin: -30
                anchors.verticalCenter:  parent.verticalCenter;
                z: 2
                onTriggerChanged: {
                    dashSpeed.currentSpeed = engine.changeSpeed(dashSpeed.currentSpeed)
                }

            }

        }

    }

    MyEngine{
       id: engine
    }


}
