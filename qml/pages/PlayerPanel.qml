import QtQuick 2.1
import Sailfish.Silica 1.0

DockedPanel {
    id: panel

    width: parent.width
    height: Theme.itemSizeExtraLarge + Theme.paddingLarge
    dock: Dock.Bottom
    open: playMusic.playing

    Row {
        anchors.centerIn: parent
        id: iconButtons
        spacing: Theme.paddingLarge


        Button {
            id: listeningTo
            text: radioStation
            RemorsePopup {id: remorse}
            onClicked: remorse.execute("Opening webpage", function() {Qt.openUrlExternally(website)}, 3000)
        }

        IconButton {
            id: pause
            icon.source: "image://theme/icon-l-pause"
            onClicked: pauseStream()//{pauseStream(); buttonPress.play()}
            enabled: playMusic.playing
        }
        IconButton {
            id: play
            icon.source: "image://theme/icon-l-play"
            onClicked: playStream()//{playStream(); buttonPress.play()}
            enabled: !playMusic.playing
        }
    }
}
