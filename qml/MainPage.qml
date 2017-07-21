import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    width: parent.width
    height: parent.height
    property bool connect_status: false
    property bool search_status: false
    property bool current_device_tab: true
    property string current_address_ble: ""

    Rectangle{
        id: titlerec
        width: parent.width
        height: 70*size_height
        color: "#009ada"
        VTextStyle{
            id: textlb
            text: "Devices"
            anchors.left: parent.left; anchors.leftMargin: 30 *size_width
            anchors.top: parent.top; anchors.topMargin: 20 * size_height
            font.pixelSize: 25*size_scale
            font.bold: true
            color: "white"
        }
        FlatButton{
            id: searchbt
            anchors.rightMargin: 20 *size_width
            anchors.right: parent.right
            anchors.top: parent.top;
            //            anchors.topMargin: 5 *size_height
            radius_button: 8 *size_scale
            text: search_status? "STOP SCANNING" :"SCAN"
            text_anchor: true
            visible: current_device_tab
            bgcolor: "transparent"
            text_size: 20 *size_scale
            width: 100*size_width
            onClicked: {
                //                searchbt.text = "Scanning"
                //                search_status = true
                search_status = !search_status
                if(search_status) blename.clear()
                timerstop.running = false
                timerstop.running = true
                _bleManager.scanBLE(search_status)

            }
        }
        FlatButton{
            id: connectbt
            anchors.rightMargin: 20 *size_width
            anchors.right: parent.right
            anchors.top: parent.top;
            //            anchors.topMargin: 5 *size_height
            radius_button: 8 *size_scale
            text: connect_status? "DISCONNECT" : "CONNECT"
            visible: !current_device_tab
            bgcolor: "transparent"
            text_size: 20 *size_scale
            width: 100*size_width
            onClicked: {
                if(!connect_status) _bleManager.connect_to_device(current_address_ble)
                else _bleManager.disconnectDevice()
            }
        }
    }
    Timer{
        id: timerOnStart
        running: true
        interval: 500
        repeat: false
        onTriggered: {
            search_status = true
            if(search_status) blename.clear()
            timerstop.running = false
            timerstop.running = true
            _bleManager.scanBLE(search_status)
        }
    }
    Timer{
        id: timerstop
        running: false
        interval: 15000
        repeat: false
        onTriggered: {
            search_status = false
            _bleManager.scanBLE(search_status)
            //            searchbt.text = "SCAN"
        }
    }
    ListModel {
        id: blename
    }

    VSearchDevice{
        id: searchtab
        width: parent.width
        height: parent.height - titlerec.height
        anchors.bottom: parent.bottom
    }
}
