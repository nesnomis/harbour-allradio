import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    CoverPlaceholder {
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            font.pixelSize: Theme.fontSizeLarge
            color: Theme.secondaryHighlightColor
            text: "AllRadio"
        }

        Image {
           id: logo
           source: picon
           anchors.horizontalCenter: parent.horizontalCenter
           opacity: 0.2
           width: parent.width
           sourceSize.height:  parent.height
           height: parent.height
           fillMode: Image.PreserveAspectCrop
         }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 30
            anchors.rightMargin: 20
            font.pixelSize: Theme.fontSizeHuge
            fontSizeMode: Text.Fit
            wrapMode: Text.WordWrap
            maximumLineCount: 4
            color: Theme.highlightColor
            text: (sleepTime > 0) ? (qsTr("Closing in ") + (sleepTime) + qsTr(" minutes.")) : radioStation
            width: parent.width - 30
        }
    }

    CoverActionList {

        CoverAction {
            iconSource: sleepTime == 0 ? (streaming ? "image://theme/icon-cover-pause" : "image://theme/icon-cover-play") : "image://theme/icon-cover-cancel"
            onTriggered: sleepTime == 0 ? (streaming ? pauseStream() : playStream()) : sleepTime = 0
        }
    }
}
