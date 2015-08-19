import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page
    property var textAlignment: TextInput.AlignLeft
    allowedOrientations: Orientation.All
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: header.height + text.height + Theme.paddingLarge
        contentWidth: parent.width

            PageHeader {
                id: header
                title: "Help"
            }
            TextArea {
                id: text
                anchors {
                    top: header.bottom
                    left: parent.left
                    right: parent.right
                    leftMargin: 20
                    rightMargin: 20
                }
                width: parent.width
                wrapMode: Text.WordWrap
                readOnly: true
                font.pixelSize: Theme.fontSizeMedium
                horizontalAlignment: textAlignment
                text: "
Choose country by clicking the flag/name, then click the channel you want to listen to.

When playing you will see the name and country-flag of the current playing radio station at the bottom of the screen.

You can also see current station and country playing as wel as pause/play from the cover action.

You can press and hold on a channel to add to favourites. If you are in favourites you can press and hold a channel to remove it from favourites.

Use the sleeptimer to set a number of minutes until the AllRadio shuts down the currently playing stream."
            }
    }
}
