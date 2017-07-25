
import QtQuick 2.7
import QtQuick.Controls 2.0
Rectangle{
    color: "white"
    property int speed: 60

    Timer{
        id: timerspeed
        interval: 150
        repeat: true
        running: false
        onTriggered: {
            console.log("send")
            speed = speed + 8
            if(speed >= 200) speed =200
           _bleManager.send_command_speed_to_device(4,speed)
        }
    }
    Rectangle{
        id: upbt
        width: 130 *size_height
        height: 130 *size_height
        radius: 65 * size_height
        color: "#E91E63"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top; anchors.topMargin: 10 *size_height
        z: 10
        FlatButton{
           id: upbtlb
           anchors.fill: parent
           radius_button: parent.width / 2
           text:"LEFT"
           rotation: 90
           z: 10
           onPressed: {
               timerspeed.running = true
           }
           onReleased: {
               _bleManager.send_command_speed_to_device(0,0)
               timerspeed.running = false
               speed = 60;
           }
        }
    }
    Timer{
        id: timerspeed1
        interval: 150
        repeat: true
        running: false
        onTriggered: {
            speed = speed + 8
            if(speed >= 200) speed =200
           _bleManager.send_command_speed_to_device(1,speed)
        }
    }
    Row{
        id: rowbt
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: upbt.bottom; anchors.topMargin: 0 *size_height
        spacing: 10 * size_height
        z: 10
        Rectangle{
            id: leftbt
            width: 130 *size_height
            height: 130 *size_height
            radius: 65 * size_height
            color: "#E91E63"
            z: 10
            FlatButton{
               id: leftbtlb
               anchors.fill: parent
               radius_button:  parent.width / 2
               text:"DOWN"
               rotation: 90
               z: 10
               onPressed:{
                   timerspeed1.running = true
               }
               onReleased: {
                   _bleManager.send_command_speed_to_device(0,0)
                   timerspeed1.running= false
                   speed = 60;
               }
            }

        }
        Item{
            id: stopbtsdfds
            width: 130 *size_width
            height: 130 *size_height

        }
        Rectangle{
            id: stopbt
            width: 130 *size_height
            height: 130 *size_height
            radius: 65 * size_height
            color: "#E91E63"
            visible: false
            FlatButton{
               id: stopbtlb
               anchors.fill: parent
               radius_button: parent.width / 2
               text:"STOP"
               onClicked:{
               }
            }
        }
        Timer{
            id: timerspeed2
            interval: 150
            repeat: true
            running: false
            onTriggered: {
                speed = speed + 8
                if(speed >= 200) speed =200
               _bleManager.send_command_speed_to_device(2,speed)
            }
        }
        Rectangle{
            id: rightbt
            width: 130 *size_height
            height: 130 *size_height
            radius: 65 * size_height
            color: "#E91E63"
            z: 10
            FlatButton{
               id: rightbtlb
               anchors.fill: parent
               radius_button:  width / 2
               text:"UP"
               rotation: 90
               z: 10
               onPressed: {
                   timerspeed2.running = true
               }
               onReleased: {
                   _bleManager.send_command_speed_to_device(0,0)
                   timerspeed2.running = false
                   speed = 60;
               }
            }
        }
    }
    Timer{
        id: timerspeed3
        interval: 150
        repeat: true
        running: false
        onTriggered: {
            speed = speed + 8
            if(speed >= 200) speed =200
           _bleManager.send_command_speed_to_device(3,speed)
        }
    }
    Rectangle{
        id: downbt
        width: 130 *size_height
        height: 130 *size_height
        radius: 65 * size_height
        color: "#E91E63"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: rowbt.bottom; anchors.topMargin: 0 *size_height
        z: 10
        FlatButton{
           id: downbtlb
           anchors.fill: parent
           radius_button:  width / 2
           text:"RIGHT"
           rotation: 90
           z: 10
           onPressed: {
               timerspeed3.running = true
           }
           onReleased: {
               _bleManager.send_command_speed_to_device(0,0)
               timerspeed3.running = false
               speed = 60;
           }
        }
    }
    Column{
        id: colunmmotor
        anchors.left: colunmmotor2.right
        anchors.leftMargin: 5 *size_width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40 *size_height
        spacing: 3 *size_height
        FlatButton{
           id: motor1up
           width: 100 *size_height
           height: 100 *size_height
           text:"UP"
           backgroundColor: point1.pressed? "#2196F3":"#EF6C00"
           rotation: 90
           z: 10
           onClicked: {
              _bleManager.send_command_speed_to_device(5,0)
           }
           MultiPointTouchArea {
               anchors.fill: parent
               touchPoints: [
                   TouchPoint {
                       id: point1
                       onPressedChanged: {
                           if(pressed) _bleManager.send_command_speed_to_device(5,0)
                       }
                   }
               ]
           }
        }
        FlatButton{
           id: motor1down
           width: 100 *size_height
           height: 100 *size_height
           backgroundColor: point2.pressed? "#2196F3":"#EF6C00"
           text:"DOWN"
           rotation: 90
           z: 10
           onClicked: {
              _bleManager.send_command_speed_to_device(6,0)
           }
           MultiPointTouchArea {
               anchors.fill: parent
               touchPoints: [
                   TouchPoint {
                       id: point2
                       onPressedChanged: {
                           if(pressed) _bleManager.send_command_speed_to_device(6,0)
                       }
                   }
               ]
           }
        }
    }

    Column{
        id: colunmmotor2
        anchors.left: colunmfunction.right
        anchors.leftMargin: 5 *size_width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40 *size_height
        spacing: 3 *size_height
        FlatButton{
            id: motor2up
            width: 100 *size_height
            height: 100 *size_height
            text:"UP"
            backgroundColor:point3.pressed? "#2196F3": "#FF5722"
            rotation: 90
            z: 10
            onClicked: {
                _bleManager.send_command_speed_to_device(7,0)
            }
            MultiPointTouchArea {
                anchors.fill: parent
                touchPoints: [
                    TouchPoint {
                        id: point3
                        onPressedChanged: {
                            if(pressed) _bleManager.send_command_speed_to_device(7,0)
                        }
                    }
                ]
            }
        }
        FlatButton{
            id: motor2down
            width: 100 *size_height
            height: 100 *size_height
            backgroundColor: point4.pressed? "#2196F3":"#FF5722"
            text:"DOWN"
            rotation: 90
            z: 10
            onClicked: {
                _bleManager.send_command_speed_to_device(8,0)
            }
            MultiPointTouchArea {
                anchors.fill: parent
                touchPoints: [
                    TouchPoint {
                        id: point4
                        onPressedChanged: {
                            if(pressed) _bleManager.send_command_speed_to_device(8,0)
                        }
                    }
                ]
            }
        }
    }
    Column{
        id: colunmfunction
        anchors.left: colunmfunction2.right
        anchors.leftMargin: 5 *size_width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40 *size_height
        spacing: 3 *size_height
        FlatButton{
           id: f1
           width: 100 *size_height
           height: 100 *size_height
           text:"F1"
           backgroundColor: point5.pressed? "#2196F3":"#EC407A"
           rotation: 90
           z: 10
           onClicked: {
              _bleManager.send_command_speed_to_device(9,0)
           }
           MultiPointTouchArea {
               anchors.fill: parent
               touchPoints: [
                   TouchPoint {
                       id: point5
                       onPressedChanged: {
                           if(pressed) _bleManager.send_command_speed_to_device(9,0)
                       }
                   }
               ]
           }
        }
        FlatButton{
           id:f2
           width: 100 *size_height
           height: 100 *size_height
           backgroundColor:point6.pressed? "#2196F3": "#EC407A"
           text:"F2"
           rotation: 90
           z: 10
           onClicked: {
              _bleManager.send_command_speed_to_device(10,0)
           }
           MultiPointTouchArea {
               anchors.fill: parent
               touchPoints: [
                   TouchPoint {
                       id: point6
                       onPressedChanged: {
                           if(pressed) _bleManager.send_command_speed_to_device(10,0)
                       }
                   }
               ]
           }
        }
    }
    Column{
        id: colunmfunction2
        anchors.left: parent.left
        anchors.leftMargin: 5 *size_width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40 *size_height
        spacing: 5 *size_height
        FlatButton{
           id: f3
           width: 100 *size_height
           height: 100 *size_height
           text:"F3"
           backgroundColor:point7.pressed? "#2196F3": "#EC407A"
           rotation: 90
           z: 10
           onClicked: {
              _bleManager.send_command_speed_to_device(11,0)
           }
           MultiPointTouchArea {
               anchors.fill: parent
               touchPoints: [
                   TouchPoint {
                       id: point7
                       onPressedChanged: {
                           if(pressed) _bleManager.send_command_speed_to_device(11,0)
                       }
                   }
               ]
           }
        }
        FlatButton{
           id:f4
           width: 100 *size_height
           height: 100 *size_height
           backgroundColor:point8.pressed? "#2196F3": "#EC407A"
           text:"F4"
           rotation: 90
           z: 10
           onClicked: {
              _bleManager.send_command_speed_to_device(12,0)
           }
           MultiPointTouchArea {
               anchors.fill: parent
               touchPoints: [
                   TouchPoint {
                       id: point8
                       onPressedChanged: {
                           if(pressed) _bleManager.send_command_speed_to_device(12,0)
                       }
                   }
               ]
           }
        }
    }


}
