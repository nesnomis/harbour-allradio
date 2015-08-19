import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: debugPage
    allowedOrientations: Orientation.All
    property string blah

    function debug(message) {
        blah = deBug
        deBug = blah + "\n" + message
    }

    ControlPanel { id:playerPanel }

    SilicaFlickable {
        id: flick
        clip: true
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            bottomMargin: playerPanel.visibleSize
        }
        contentHeight: dtext.height

        PullDownMenu {
            MenuItem {
                text: qsTr("Clear debug log")
                onClicked: deBug = ""
            }
        }

        VerticalScrollDecorator {}
        TextEdit {
            id: dtext
            width: parent.width
            color: Theme.highlightColor
            readOnly: true
            text: deBug
            font.pixelSize: Theme.fontSizeMedium
        }
     }
}
