import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import "qml"

ApplicationWindow {
    id: mainwindows
    visible: true
    width: 480
    height: 720
    title: qsTr("Bot Battle")
    property double size_width  : Screen.desktopAvailableWidth/480
    property double size_height  : Screen.desktopAvailableHeight/720
    property double size_scale: (size_width + size_height) / 2

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: MainPage{

        }


    }
    Component{
        id: controlpanel
        VUser{
            width: mainwindows.width
            height: mainwindows.height
        }
    }

}
