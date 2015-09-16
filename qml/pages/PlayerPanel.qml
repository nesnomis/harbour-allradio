import QtQuick 2.0
import Sailfish.Silica 1.0

DockedPanel {
    width: parent.width
    height: Theme.itemSizeLarge + Theme.paddingLarge
    dock: Dock.Bottom
    open: showPlayer  ? true : false

    RemorsePopup {id: remorse}

    Rectangle {
        anchors.fill: parent
        opacity: 0.9
        color: "black"
    }

    BusyIndicator {
        anchors.centerIn: parent
        size: BusyIndicatorSize.Large
        running: (sloading && Qt.application.active)
        enabled: (Qt.application.active)
    }
            BackgroundItem {
                height: parent.height
                anchors.left: parent.left
                anchors.right: pause.left
                anchors.rightMargin: 20
                onClicked: {
                    remorse.execute(qsTr("Opening webpage"), function() {Qt.openUrlExternally(website)}, 3000)
                }

                Image {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 30
                    anchors.left: parent.left
                    width: parent.height - 30
                    opacity: 0.6
                    fillMode: Image.PreserveAspectFit
                   id: logo
                   source: picon
                 }

                Label {
                    anchors.left: logo.right
                    anchors.leftMargin: 30
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width - (pause.width + logo.width)
                    color: Theme.highlightColor
                    font.pixelSize: Theme.fontSizeMedium
                    fontSizeMode: Text.VerticalFit
                    wrapMode: Text.Wrap
                    maximumLineCount: 3
                    id: listeningTo
                    text: radioStation
                    opacity: 0.9
                }
            }

            IconButton {
                id: pause
                enabled: radioStation !== "" ? true : false
                anchors.right: parent.right
                anchors.rightMargin: 30
                anchors.verticalCenter: parent.verticalCenter
                icon.source: streaming ? "image://theme/icon-l-pause" : "image://theme/icon-l-play"
                onClicked: streaming ? stopStream() : playStream()

            }
         /*   PushUpMenu {
                MenuItem {
                    text: qsTr("Sleep timer")
                    onClicked: pageStack.push(Qt.resolvedUrl("SleepTimerPage.qml"))
                }
                MenuItem {
                    text: qsTr("Startup timer")
                    onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
                }
            } */
}
