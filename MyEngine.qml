import QtQuick 2.0

Item {
    id: engine
    function rndInt(min, max) { // min and max included
      return Math.floor(Math.random() * (max - min + 1) + min)
    }




    property int speed_min: 0;
    property int speed_max: 260;
    property int rpm_min: 0;
    property int rpm_max: 8000;
    property int currentSpeed: 0;
    property int currentRpm: 0;

    function changeSpeed(currentSpeed){
        let newSpeed = 0;
        newSpeed = rndInt(currentSpeed - 20, currentSpeed + 50)
        if(newSpeed < engine.speed_min){
            return (newSpeed)
        } else if(newSpeed > engine.speed_max){
            return (newSpeed - 50)
        } else {
            return newSpeed
        }
    }

    function changeRpm(currentRpm){
        let newRpm = 0;
        newRpm = rndInt(currentRpm - 1000, currentRpm + 2000)
        if(newRpm < engine.rpm_min){
            return (newRpm)
        } else if(newRpm > engine.rpm_max){
            return (newRpm - 2000)
        } else {
            return newRpm
        }
    }


}




