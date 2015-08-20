import QtQuick 2.0
import Sailfish.Silica 1.0

DockedPanel {
    id: panel
    width: parent.width
    height: Theme.itemSizeExtraLarge + Theme.paddingLarge
    dock: Dock.Bottom
    open: playMusic.playing

    BusyIndicator {
        anchors.centerIn: parent
        size: BusyIndicatorSize.Large
        running: playerStatus == 4
    }

    Column {
        anchors.centerIn: parent
        spacing: Theme.paddingLarge
        Row {
            spacing: Theme.paddingLarge
            id: iconButtons

            Image {
                height: pause.height + 10
                width: pause.width + 10
                opacity: 0.5
                fillMode: Image.PreserveAspectFit
               id: logo
               source: picon
             }

            Button {
                id: listeningTo
                text: radioStation
                width: panel.width / 2

                RemorsePopup {id: remorse}
                onClicked: remorse.execute(qsTr("Opening webpage"), function() {Qt.openUrlExternally(website)}, 3000)
            }

            IconButton {
                id: pause
                icon.source: "image://theme/icon-l-pause"
                onClicked: stopStream()
                enabled: playMusic.playing
            }
        }
    }
}
