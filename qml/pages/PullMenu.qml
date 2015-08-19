import QtQuick 2.0
import Sailfish.Silica 1.0

PullDownMenu {
    /*MenuItem {
        text: qsTr("Drop Database")
        onClicked: dropDb()
    }*/
    /*MenuItem {
        text: qsTr("DebugPage")
        onClicked: pageStack.push("Debug.qml")
    }*/
    MenuItem {
        text: qsTr("Help")
        onClicked: pageStack.push(Qt.resolvedUrl("Help.qml"))
    }
    MenuItem {
        text: qsTr("About AllRadio")
        onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
    }
    MenuItem {
        text: qsTr("Sleeptimer")
        onClicked: pageStack.push(Qt.resolvedUrl("SleepTimerPage.qml"))
    }
}
