import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    CoverPlaceholder {
       // BusyIndicator { // Maybe.... Just, maybe... Cover.Active solves the problem with a lot of wake up's when idle!!! ... :)
       //     anchors.centerIn: parent
       //     size: BusyIndicatorSize.Large
       //     running: (sloading && Cover.Active)
       //     enabled: (Cover.Active)
       // }  // I really want this, but it still makes a lot of wake up's when idle (and only when used on cover)?????
        Label {
            id: app
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            font.pixelSize: Theme.fontSizeLarge
            color: Theme.primaryColor
            text: "AllRadio"
        }

  /*      Image {
           id: logo
           source: picon
           anchors.bottom: parent.bottom
           opacity: 0.4
           width: parent.width
           sourceSize.height:  parent.height
           height: parent.height
           fillMode: Image.PreserveAspectCrop
         } */

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
             anchors.verticalCenter: parent.verticalCenter
            anchors.top: app.bottom
            anchors.topMargin: Theme.paddingMedium
            anchors.leftMargin: 30
            anchors.rightMargin: 20
            //anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: Theme.paddingMedium
            font.pixelSize: Theme.fontSizeHuge
            fontSizeMode: Text.Fit
            wrapMode: Text.WordWrap
            maximumLineCount: 8
            color: Theme.secondaryColor
            text: (sleepTime > 0) ? (qsTr("Closing in ") + (sleepTime) + qsTr(" minutes.")) : metaInfo ? "<b>"+radioStation + ":</b>\n\n" + metaInfo : radioStation
            width: parent.width - 30
        }
    }

    CoverActionList {

        CoverAction {
            iconSource: sleepTime == 0 ? (streaming ? "image://theme/icon-cover-pause" : "image://theme/icon-cover-play") : "image://theme/icon-cover-cancel"
            onTriggered: sleepTime == 0 ? (streaming ? stopStream() : playStream()) : sleepTime = 0
        }
    }
}
