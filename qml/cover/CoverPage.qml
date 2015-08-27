import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    CoverPlaceholder {
        text: radioStation
        icon.source: picon
    }

    CoverActionList {

        CoverAction {
            iconSource: sleepTime == 0 ? (streaming ? "image://theme/icon-cover-pause" : "image://theme/icon-cover-play") : "image://theme/icon-cover-cancel"
            onTriggered: sleepTime == 0 ? (streaming ? pauseStream() : playStream()) : sleepTime = 0
        }
    }
}
