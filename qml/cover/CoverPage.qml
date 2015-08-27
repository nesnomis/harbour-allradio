import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    anchors.fill: parent

    Image {
       source: picon
       anchors.horizontalCenter: parent.horizontalCenter
       opacity: 0.5
       width: parent.width / 1.5
       height: parent.height / 1.5
       fillMode: Image.PreserveAspectFit
     }

    Label {
        y: parent.height * 0.5
        text: (sleepTime > 0) ? (qsTr("Closing in ") + (sleepTime) + qsTr(" minutes.")) : radioStation
        width: parent.width
        color: Theme.highlightColor
        horizontalAlignment: TextInput.AlignHCenter
    }

    CoverActionList {

        CoverAction {
            iconSource: sleepTime == 0 ? (streaming ? "image://theme/icon-cover-pause" : "image://theme/icon-cover-play") : "image://theme/icon-cover-cancel"
            onTriggered: sleepTime == 0 ? (streaming ? pauseStream() : playStream()) : sleepTime = 0
        }
    }
}
