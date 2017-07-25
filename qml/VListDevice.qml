import QtQuick 2.0

Rectangle {
    id: root
    width: 120 *size_width
    height: 170 *size_height
    color: "transparent"//"#2962FF"
    property string ble_address: ""
    property int port_index: 0

    //    property int rssi: 0

    MouseArea{
        anchors.fill: parent

    }

    ListView {
        id: view
        width: parent.width
        height: parent.height
        clip: true
        keyNavigationWraps: true
        //        highlightMoveDuration: 0
        highlightFollowsCurrentItem: false
        focus: true
        //        snapMode: ListView.SnapToItem
        model: blename
        delegate: Rectangle {
            height: 100 *size_height
            width: parent.width
            color: "transparent"
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    view.currentIndex = index;
                    ble_address = address
                    port_index = index


                }
            }
            Rectangle{
                id: rectimg
                width: 40 *size_scale
                height: width
                radius: width / 2
                color: "#2196F3"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left; anchors.leftMargin: 10
                Image {
                    id: bleimg
                    source: "qrc:/images/bluetooth.png"
                    anchors.centerIn: parent
                    width: parent.width - 5*size_scale
                    height: width
                }

            }

            VTextStyle {
                id: stockNameText
                //                width: parent.width
                height: 35 *size_height
                color: "black"
                font.family: "Open Sans"
                font.pixelSize: 20 *size_scale
                font.bold: true
                elide: Text.ElideRight
                maximumLineCount: 1
                verticalAlignment: Text.AlignVCenter
                //                horizontalAlignment: Text.AlignHCenter
                anchors.top: parent.top; anchors.topMargin: 10 *size_height
                anchors.left: rectimg.right; anchors.leftMargin: 20 *size_width
                text: name
            }
            VTextStyle {
                id: stockAddressText
                anchors.top: stockNameText.bottom
                anchors.topMargin:  5 *size_height
                //                width: parent.width
                height: 35 *size_height
                color: "#212121"
                font.family: "Open Sans"
                font.pixelSize: 18 *size_scale
                font.bold: false
                elide: Text.ElideRight
                maximumLineCount: 1
                verticalAlignment: Text.AlignVCenter
                //                horizontalAlignment: Text.AlignHCenter
                anchors.left: rectimg.right; anchors.leftMargin: 20 *size_width
                text: address
            }
            Image {
                id: rssiimg
                source: "qrc:/images/rssi.png"
                width: 25 *size_scale
                height: width
                anchors.left: stockAddressText.right; anchors.leftMargin: 10 *size_width
                anchors.top: stockNameText.bottom
                anchors.topMargin:  10 *size_height
            }
            VTextStyle {
                id: rssiText
                anchors.top: stockNameText.bottom
                anchors.topMargin:  5 *size_height
                height: 35 *size_height
                color: "#212121"
                font.family: "Open Sans"
                font.pixelSize: 20 *size_scale
                font.bold: false
                elide: Text.ElideRight
                maximumLineCount: 1
                verticalAlignment: Text.AlignVCenter
                anchors.left: rssiimg.right; anchors.leftMargin: 10 *size_width
                text: rssi + " dBm"
            }

            FlatButton{
                id: searchbt
                anchors.rightMargin: 5 *size_width
                anchors.right: parent.right
                height: 40 *size_height
                anchors.top: parent.top
                anchors.topMargin: 10 *size_height
                radius_button: 2 *size_scale
                text: "Connect"
                bgcolor: "#000000"
                text_size: 25 *size_scale
                width: 140*size_width
                onClicked: {                   
                    _bleManager.connect_to_device(address)
                }

            }

            Rectangle {
                id: endingLine
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                height: 1.5 *size_height
                width: parent.width
                color: "#757575"
            }
        }

        highlight:  Rectangle {
            width: view.currentItem.width; height: view.currentItem.height
            color: "transparent"//"#FFA726";
            radius: 5
            y: view.currentItem.y
            Behavior on y {
                SpringAnimation {
                    spring: 2
                    damping: 0.2
                }
            }
        }
        onContentYChanged: {
            if(contentY < -150){
                search_status = true
                if(search_status) blename.clear()
                timerstop.running = false
                timerstop.running = true
                _bleManager.scanBLE(search_status)
            }
        }
    }


    Behavior on height{
        NumberAnimation { duration: 200 }
    }



}

