import QtQuick 2.0

Item {
    id: root
    VListDevice{
        id: listble
        width: parent.width
        height: parent.height
        anchors.top: titlerec.bottom;
    }


    Connections{
        target: _bleManager
        onClear_list_device:{
            blename.clear();
        }

        onBle_name:{
            if(_name != "") {
                var flag = 0;
                for(var m = 0; m < blename.count; m++){
                    if(blename.get(m).address === _add) flag ++;
                }
                if(flag == 0) blename.append({"name":_name ,"address": _add, "rssi": _rssi})

            }

        }
        onDevice_connect:{
            connect_status = _status
            if(_status){
                stackView.push(controlpanel)
                _bleManager.scanBLE(false)
            }
            else stackView.pop()

        }
    }
}
