import QtQuick 2.0
import Sailfish.Silica 1.0

DockedPanel {
    width: parent.width
    height: metaData.text !== "" ? Theme.itemSizeLarge + metaData.height + metaSep.height + Theme.paddingMedium   : Theme.itemSizeLarge
    dock: Dock.Bottom
    open: showPlayer ? true : false

    RemorsePopup {id: remorse}

    Rectangle {
        anchors.fill: parent
        radius: 10
        color: Theme.highlightDimmerColor
    }

    Separator  {
        id: metaSep
        color: Theme.highlightColor
        width: parent.width
        anchors.top: metaData.bottom
        anchors.topMargin: Theme.paddingMedium
        visible: metaData.text !== ""
    }

    Text {
        id: metaData
        visible: text !== ""
        width: parent.width
        anchors.left: parent.left
        anchors.right: parent.right
        color: Theme.highlightColor
        anchors.leftMargin: Theme.paddingMedium
        anchors.rightMargin: Theme.paddingMedium
        anchors.top: parent.top
        anchors.topMargin: Theme.paddingSmall
        font.pixelSize: Theme.fontSizeSmall
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        maximumLineCount: 2
        text: metaInfo
        opacity: 0.9
    }

    BackgroundItem {
        id: bgItem
                anchors.top: metaSep.visible ? metaSep.bottom : parent.top
                anchors.topMargin: Theme.paddingSmall
                height: metaData.text !== "" ? parent.height - (metaData.height + metaSep.height) : parent.height
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.right: pause.left
                anchors.rightMargin: Theme.paddingMedium
                width: parent.widt - pause.width
                onClicked: {
                    remorse.execute(qsTr("Opening webpage"), function() {Qt.openUrlExternally(website)}, 3000)
                   // window.pageStack.push(Qt.resolvedUrl("RadioWeb.qml"),{radioUrl: website})
                }

                Image {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: Theme.paddingMedium
                    anchors.left: parent.left
                    height: parent.height / 1.8
                    opacity: 0.6
                    fillMode: Image.PreserveAspectFit
                   id: logo
                   source: picon
                 }

                Label {
                    id: listeningTo
                    anchors.left: logo.right
                    anchors.leftMargin: Theme.paddingMedium
                    anchors.verticalCenter: logo.verticalCenter
                    width: parent.width - (pause.width + logo.width)
                    color: bgItem.highlighted ? Theme.highlightColor : Theme.primaryColor
                    font.pixelSize: Theme.fontSizeMedium
                    fontSizeMode: Text.Fit
                    wrapMode: Text.Wrap
                    maximumLineCount: 2
                    text: radioStation
                    opacity: 0.9
                }

            }

    IconButton {
                id: pause
                enabled: radioStation !== "" ? true : false
                anchors.topMargin: Theme.paddingLarge
                anchors.right: parent.right
                anchors.rightMargin: 30
                anchors.verticalCenter: bgItem.verticalCenter
                icon.source: streaming ? "image://theme/icon-l-pause" : "image://theme/icon-l-play"
                onClicked: streaming || sloading ? stopStream() : playStream()
    }
    BusyIndicator {
        anchors.centerIn: pause
        size: BusyIndicatorSize.Medium
        running: (sloading && Qt.application.active)
        enabled: (Qt.application.active)
    }
        ProgressBar {
            id: progress
            visible: value < 1.0 && value > 0.0  ? true : false
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: pause.width
            anchors.rightMargin: pause.width
            anchors.top: bgItem.verticalCenter
            opacity: 0.4
            minimumValue: 0.0
            maximumValue: 1.0
            value: playMusic.bufferProgress
        }
}
