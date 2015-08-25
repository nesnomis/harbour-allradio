import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {

    BusyIndicator {
        anchors.centerIn: parent
        size: BusyIndicatorSize.Large
        running: playerStatus == 4
    }

    Image {
       id: logo
       source: picon
       anchors.horizontalCenter: parent.horizontalCenter
       opacity: 0.5
       width: parent.width / 1.5
       height: parent.height / 1.5
       fillMode: Image.PreserveAspectFit
     }

    TextArea {
        y: parent.height * 0.5
        text: (sleepTime > 0) ? (qsTr("Closing in ") + (sleepTime) + qsTr(" minutes.")) : radioStation
        width: parent.width
        color: Theme.highlightColor
        readOnly: true
        horizontalAlignment: TextInput.AlignHCenter
    }

    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: sleepTime == 0 ? (playMusic.playing ? "image://theme/icon-cover-pause" : "image://theme/icon-cover-play") : "image://theme/icon-cover-cancel"
            onTriggered: sleepTime == 0 ? (playMusic.playing ? pauseStream() : playStream()) : sleepTime = 0
        }
    }
}
